#!/bin/sh
curl "$1" 2>&1 | grep "moved" | cut -d "\"" -f2
