/*
 * bridge.exe - TCP log server
 *
 * Listens on localhost:9500 (or argv[1] port).
 * Accepts client connections, reads log lines, prints to stdout/stderr.
 * Designed for Windows XP + TCC.
 */
#include <winsock2.h>
#include <windows.h>
#include <stdio.h>
#include <string.h>

#define DEFAULT_PORT 9500
#define MAX_CLIENTS  16
#define BUF_SIZE     4096

static volatile BOOL g_running = TRUE;
static const char* g_stop_on = NULL;

static BOOL WINAPI ctrl_handler(DWORD type) {
    if (type == CTRL_C_EVENT || type == CTRL_BREAK_EVENT || type == CTRL_CLOSE_EVENT) {
        g_running = FALSE;
        return TRUE;
    }
    return FALSE;
}

static void print_ts(void) {
    SYSTEMTIME t;
    GetLocalTime(&t);
    printf("[%04d-%02d-%02d %02d:%02d:%02d.%03d] ",
           t.wYear, t.wMonth, t.wDay,
           t.wHour, t.wMinute, t.wSecond, t.wMilliseconds);
}

static void dispatch_line(const char* line) {
    print_ts();
    if (strncmp(line, "ERROR:", 6) == 0 || strncmp(line, "WARN:", 5) == 0) {
        fprintf(stderr, "%s\n", line);
        fflush(stderr);
    } else {
        printf("%s\n", line);
        fflush(stdout);
    }
    /* check sentinel */
    if (g_stop_on && strstr(line, g_stop_on)) {
        g_running = FALSE;
    }
}

int main(int argc, char* argv[]) {
    WSADATA wsa;
    SOCKET  listen_sock;
    struct  sockaddr_in addr;
    int     port = DEFAULT_PORT;
    SOCKET  clients[MAX_CLIENTS];
    int     nclients = 0;
    int     i;

    for (i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--stop-on") == 0 && i + 1 < argc) {
            g_stop_on = argv[++i];
        } else if (strcmp(argv[i], "--port") == 0 && i + 1 < argc) {
            port = atoi(argv[++i]);
        } else {
            port = atoi(argv[i]);
        }
    }
    if (port <= 0 || port > 65535) port = DEFAULT_PORT;

    SetConsoleCtrlHandler(ctrl_handler, TRUE);

    if (WSAStartup(MAKEWORD(2,2), &wsa) != 0) {
        fprintf(stderr, "WSAStartup failed\n");
        return 1;
    }

    listen_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (listen_sock == INVALID_SOCKET) {
        fprintf(stderr, "socket() failed: %d\n", WSAGetLastError());
        return 1;
    }

    memset(&addr, 0, sizeof(addr));
    addr.sin_family      = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port        = htons((unsigned short)port);

    if (bind(listen_sock, (struct sockaddr*)&addr, sizeof(addr)) != 0) {
        fprintf(stderr, "bind() failed: %d\n", WSAGetLastError());
        closesocket(listen_sock);
        return 1;
    }

    if (listen(listen_sock, 4) != 0) {
        fprintf(stderr, "listen() failed: %d\n", WSAGetLastError());
        closesocket(listen_sock);
        return 1;
    }

    print_ts();
    printf("bridge listening on 127.0.0.1:%d\n", port);
    fflush(stdout);

    for (i = 0; i < MAX_CLIENTS; i++) clients[i] = INVALID_SOCKET;

    while (g_running) {
        fd_set rfds;
        struct timeval tv;
        int maxfd = (int)listen_sock;

        FD_ZERO(&rfds);
        FD_SET(listen_sock, &rfds);
        for (i = 0; i < nclients; i++) {
            FD_SET(clients[i], &rfds);
            if ((int)clients[i] > maxfd) maxfd = (int)clients[i];
        }

        tv.tv_sec  = 1;
        tv.tv_usec = 0;

        if (select(maxfd + 1, &rfds, NULL, NULL, &tv) < 0) break;

        /* accept new connections */
        if (FD_ISSET(listen_sock, &rfds)) {
            SOCKET cs = accept(listen_sock, NULL, NULL);
            if (cs != INVALID_SOCKET) {
                if (nclients < MAX_CLIENTS) {
                    clients[nclients++] = cs;
                    print_ts();
                    printf("client connected (%d total)\n", nclients);
                    fflush(stdout);
                } else {
                    closesocket(cs);
                }
            }
        }

        /* read from clients */
        for (i = 0; i < nclients; i++) {
            if (!FD_ISSET(clients[i], &rfds)) continue;

            char buf[BUF_SIZE];
            int n = recv(clients[i], buf, BUF_SIZE - 1, 0);
            if (n <= 0) {
                /* client gone */
                closesocket(clients[i]);
                clients[i] = clients[nclients - 1];
                nclients--;
                i--;
                print_ts();
                printf("client disconnected (%d total)\n", nclients);
                fflush(stdout);
                continue;
            }
            buf[n] = '\0';

            /* split into lines and dispatch */
            {
                char* p = buf;
                char* nl;
                while ((nl = strchr(p, '\n')) != NULL) {
                    *nl = '\0';
                    if (nl > p && *(nl-1) == '\r') *(nl-1) = '\0';
                    if (*p) dispatch_line(p);
                    p = nl + 1;
                }
                if (*p) dispatch_line(p);
            }
        }
    }

    /* cleanup */
    for (i = 0; i < nclients; i++) closesocket(clients[i]);
    closesocket(listen_sock);
    WSACleanup();
    print_ts();
    printf("bridge stopped\n");
    fflush(stdout);
    return 0;
}
