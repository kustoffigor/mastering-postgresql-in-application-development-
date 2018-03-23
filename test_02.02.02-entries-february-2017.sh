#!/bin/bash
set -e
unset c
cat \
    ${c# query} \
    02.02.02-entries-february-2017.sql \
| ./run-sql.sh
