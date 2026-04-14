/*
 * Minimal winsock2.h for TCC - only the subset needed by bridge project.
 * Links against ws2_32.dll at runtime.
 */
#ifndef _WINSOCK2_H
#define _WINSOCK2_H

#include <windows.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ---- types ---- */
typedef unsigned int   SOCKET;
#define INVALID_SOCKET ((SOCKET)(~0))
#define SOCKET_ERROR   (-1)

/* ---- address families ---- */
#define AF_INET     2
#define SOCK_STREAM 1
#define IPPROTO_TCP 6

/* ---- shutdown modes ---- */
#define SD_RECEIVE 0
#define SD_SEND    1
#define SD_BOTH    2

/* ---- structures ---- */
struct in_addr {
    union {
        struct { unsigned char s_b1, s_b2, s_b3, s_b4; } S_un_b;
        struct { unsigned short s_w1, s_w2; }            S_un_w;
        unsigned long                                    S_addr;
    } S_un;
#define s_addr S_un.S_addr
};

struct sockaddr_in {
    short          sin_family;
    unsigned short sin_port;
    struct in_addr sin_addr;
    char           sin_zero[8];
};

struct sockaddr {
    unsigned short sa_family;
    char           sa_data[14];
};

typedef struct WSAData {
    WORD    wVersion;
    WORD    wHighVersion;
    char    szDescription[257];
    char    szSystemStatus[129];
    unsigned short iMaxSockets;
    unsigned short iMaxUdpDg;
    char*   lpVendorInfo;
} WSADATA;

/* ---- fd_set for select() ---- */
#ifndef FD_SETSIZE
#define FD_SETSIZE 64
#endif

typedef struct fd_set {
    unsigned int fd_count;
    SOCKET       fd_array[FD_SETSIZE];
} fd_set;

#define FD_ZERO(set)       ((set)->fd_count = 0)

#define FD_SET(fd, set) do { \
    unsigned int __i; \
    for (__i = 0; __i < (set)->fd_count; __i++) \
        if ((set)->fd_array[__i] == (fd)) break; \
    if (__i == (set)->fd_count && (set)->fd_count < FD_SETSIZE) \
        (set)->fd_array[(set)->fd_count++] = (fd); \
} while(0)

#define FD_ISSET(fd, set) __WSAFDIsSet((SOCKET)(fd), (fd_set*)(set))

struct timeval {
    long tv_sec;
    long tv_usec;
};

/* ---- function declarations (from ws2_32.dll) ---- */
int   __stdcall WSAStartup(WORD, WSADATA*);
int   __stdcall WSACleanup(void);
int   __stdcall WSAGetLastError(void);

SOCKET __stdcall socket(int, int, int);
int    __stdcall bind(SOCKET, const struct sockaddr*, int);
int    __stdcall listen(SOCKET, int);
SOCKET __stdcall accept(SOCKET, struct sockaddr*, int*);
int    __stdcall connect(SOCKET, const struct sockaddr*, int);
int    __stdcall send(SOCKET, const char*, int, int);
int    __stdcall recv(SOCKET, char*, int, int);
int    __stdcall closesocket(SOCKET);
int    __stdcall shutdown(SOCKET, int);
int    __stdcall select(int, fd_set*, fd_set*, fd_set*, const struct timeval*);

unsigned short __stdcall htons(unsigned short);
unsigned short __stdcall ntohs(unsigned short);
unsigned long  __stdcall inet_addr(const char*);
int            __stdcall __WSAFDIsSet(SOCKET, fd_set*);

#ifndef MAKEWORD
#define MAKEWORD(a,b) ((WORD)(((BYTE)(a))|(((WORD)((BYTE)(b)))<<8)))
#endif

#ifdef __cplusplus
}
#endif

#endif /* _WINSOCK2_H */
