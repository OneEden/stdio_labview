#ifndef BRIDGE_LOG_H
#define BRIDGE_LOG_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef BRIDGE_LOG_EXPORTS
#define BRIDGE_API __declspec(dllexport)
#else
#define BRIDGE_API
#endif

/* Return codes */
#define LOG_OK           0
#define LOG_ERR_INIT    -1
#define LOG_ERR_CONN    -2
#define LOG_ERR_WRITE   -3
#define LOG_ERR_PARAM   -4

/* Log levels */
#define LOG_INFO     0
#define LOG_WARN     1
#define LOG_ERROR    2

/* Default endpoint */
#define LOG_DEFAULT_PORT 9500

/*
 * log_open  - connect to bridge
 *   endpoint: "host:port", e.g. "127.0.0.1:9500"
 *             NULL or "" uses default 127.0.0.1:9500
 *   returns:  LOG_OK on success
 */
BRIDGE_API int log_open(const char* endpoint);

/*
 * log_write - send a log line (level = LOG_INFO)
 *   text:    message string
 *   returns: LOG_OK on success
 */
BRIDGE_API int log_write(const char* text);

/*
 * log_write_level - send a log line with explicit level
 *   text:    message string
 *   level:   LOG_INFO / LOG_WARN / LOG_ERROR
 *   returns: LOG_OK on success
 */
BRIDGE_API int log_write_level(const char* text, int level);

/*
 * log_close - disconnect from bridge
 *   returns: LOG_OK on success
 */
BRIDGE_API int log_close(void);

#ifdef __cplusplus
}
#endif

#endif /* BRIDGE_LOG_H */
