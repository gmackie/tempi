#!/bin/bash

rtl_433 -C customary -F influx://localhost:8086/write?db=smoker
