#!/bin/bash

cleanup() {
    echo "Cleaning up..."
    exit
}

trap cleanup INT TERM

while :; do
    sleep 1s
done
