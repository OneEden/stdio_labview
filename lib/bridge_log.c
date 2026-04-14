#define BRIDGE_LOG_EXPORTS
#include <winsock2.h>
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include "bridge_log.h"

static SOCKET g_sock = INVALID_SOCKET;
static int    g_wsa_init = 0;

/* ---- internal helpers ---- */

static int ensure_wsa(void) {
    WSADATA wsa;
    if (g_wsa_init) return 0;
    if (WSAStartup(MAKEWORD(2,2), &wsa) != 0) return -1;
    g_wsa_init = 1;
    return 0;
}

static int send_all(const char* buf, int len) {
    int sent = 0;
    while (sent < len) {
        int n = send(g_sock, buf + sent, len - sent, 0);
        if (n <= 0) return LOG_ERR_WRITE;
        sent += n;
    }
    return LOG_OK;
}

/* ---- public API ---- */

BRIDGE_API int log_open(const char* endpoint) {
    struct sockaddr_in addr;
    char host[256];
    int port = LOG_DEFAULT_PORT;
    char* colon;

    if (g_sock != INVALID_SOCKET) return LOG_OK;
    if (ensure_wsa() != 0) return LOG_ERR_INIT;

    /* parse endpoint */
    strcpy(host, "127.0.0.1");
    if (endpoint && endpoint[0]) {
        strncpy(host, endpoint, sizeof(host) - 1);
        host[sizeof(host) - 1] = '\0';
        colon = strchr(host, ':');
        if (colon) {
            *colon = '\0';
            port = atoi(colon + 1);
            if (port <= 0 || port > 65535) return LOG_ERR_PARAM;
        }
    }

    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_port   = htons((unsigned short)port);
    addr.sin_addr.s_addr = inet_addr(host);

    /* retry loop — bridge may not be listening yet */
    {
        int attempt;
        for (attempt = 0; attempt < 10; attempt++) {
            g_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
            if (g_sock == INVALID_SOCKET) return LOG_ERR_CONN;

            if (connect(g_sock, (struct sockaddr*)&addr, sizeof(addr)) == 0) {
                return LOG_OK;
            }
            closesocket(g_sock);
            g_sock = INVALID_SOCKET;
            Sleep(500);
        }
    }

    return LOG_ERR_CONN;
}

BRIDGE_API int log_write(const char* text) {
    return log_write_level(text, LOG_INFO);
}

BRIDGE_API int log_write_level(const char* text, int level) {
    char buf[4096];
    const char* prefix;
    int len;

    if (g_sock == INVALID_SOCKET) return LOG_ERR_CONN;
    if (!text) return LOG_ERR_PARAM;

    switch (level) {
        case LOG_WARN:  prefix = "WARN";  break;
        case LOG_ERROR: prefix = "ERROR"; break;
        default:        prefix = "INFO";  break;
    }

    len = _snprintf(buf, sizeof(buf) - 1, "%s: %s\n", prefix, text);
    if (len < 0) len = sizeof(buf) - 1;
    buf[len] = '\0';

    return send_all(buf, len);
}

BRIDGE_API int log_close(void) {
    if (g_sock != INVALID_SOCKET) {
        shutdown(g_sock, SD_BOTH);
        closesocket(g_sock);
        g_sock = INVALID_SOCKET;
    }
    if (g_wsa_init) {
        WSACleanup();
        g_wsa_init = 0;
    }
    return LOG_OK;
}

BOOL APIENTRY DllMain(HMODULE h, DWORD reason, LPVOID r) {
    if (reason == DLL_PROCESS_DETACH) log_close();
    return TRUE;
}
