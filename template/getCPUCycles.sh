# !bin/sh
grep "CPU Cycles" $1 | cut -d: -f2 | sed -e 's/^[[:space:]]*//'
