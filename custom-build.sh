#!/bin/bash

# Check if argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: ./build_seal.sh ON|OFF"
    exit 1
fi

BRANCHING="$1"

# Validate input
if [ "$BRANCHING" != "ON" ] && [ "$BRANCHING" != "OFF" ]; then
    echo "Error: Argument must be ON or OFF"
    exit 1
fi

# Configure
cmake -S . -B build -DSEAL_AVOID_BRANCHING="$BRANCHING" || exit 1

# Build
cmake --build build || exit 1

# Install (requires sudo)
sudo cmake --install build
