/*
 * test_client.c - quick smoke test for bridge + bridge_log
 *
 * Connects to bridge, sends a few messages, disconnects.
 * Non-interactive, exits quickly. Safe for SSH / agent use.
 */
#include <stdio.h>
#include <windows.h>
#include "bridge_log.h"

int main(void) {
    int rc;

    printf("log_open ... ");
    rc = log_open(NULL);
    printf("%d\n", rc);
    if (rc != LOG_OK) return 1;

    printf("log_write x3 ... ");
    log_write("hello from test_client");
    log_write("second message");
    log_write_level("a warning", LOG_WARN);
    printf("done\n");

    printf("log_close ... ");
    rc = log_close();
    printf("%d\n", rc);

    printf("test passed\n");
    return 0;
}
