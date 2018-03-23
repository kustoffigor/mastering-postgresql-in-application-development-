#!/bin/bash
set -e
unset c
cat \
    ${c# params} \
    <(echo "\set start '2017-02-01'") \
    ${c# query} \
    02.02.04-all-entries.sql \
| ./run-sql.sh
