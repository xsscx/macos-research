#!/bin/zsh

find . -type f \( -name "*.sh" -o -name "*.zsh" \) -mtime -60 -exec stat -f "%Sm %N" -t "%Y-%m-%d" {} \; | sort -r
