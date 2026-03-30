#!/bin/bash

echo "Updating filelist.f"

find ../bench -name "*.v" | tee filelist.f
find ../rtl   -name "*.v" | tee -a filelist.f
