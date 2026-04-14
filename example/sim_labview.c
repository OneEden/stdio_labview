/*
 * sim_labview.c - simulates a LabVIEW process that sends logs via bridge_log
 *
 * Non-blocking: this process launches, does its work, and exits.
 * Mimics the real scenario where LabVIEW is started by a script,
 * runs independently, and sends log messages through bridge_log.dll.
 */
#include <windows.h>
#include <stdio.h>
#include "bridge_log.h"

int main(void) {
    int rc;

    /* simulate LabVIEW startup delay */
    Sleep(1000);

    rc = log_open(NULL);
    if (rc != LOG_OK) {
        fprintf(stderr, "sim_labview: log_open failed (%d)\n", rc);
        return 1;
    }

    log_write("LabVIEW starting up...");
    Sleep(500);

    log_write("Loading VI: test_sequence.vi");
    Sleep(300);

    log_write("Initializing hardware...");
    Sleep(800);

    log_write("Running test sequence step 1/3");
    Sleep(600);

    log_write("Running test sequence step 2/3");
    Sleep(600);

    log_write("Running test sequence step 3/3");
    Sleep(400);

    log_write_level("Measurement out of range on channel 2", LOG_WARN);
    Sleep(200);

    log_write("Saving results to report.csv");
    Sleep(300);

    log_write("LabVIEW Task Done");

    log_close();
    return 0;
}
