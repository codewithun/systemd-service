#!/usr/bin/env bash

set -u

while true; do
    echo "Dummy service is running..."
    logger -t dummy "Dummy service is running..."
    sleep 10
done
