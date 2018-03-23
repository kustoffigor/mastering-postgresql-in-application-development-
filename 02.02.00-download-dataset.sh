#!/bin/bash
set -e

# http://www.nyxdata.com/nysedata/asp/factbook/viewer_edition.asp?mode=table&key=3141&category=3

# get data
wget -q -O factbook.xls 'http://www.nyxdata.com/nysedata/asp/factbook/table_export_csv.asp?mode=table&key=3141'
cat factbook.xls | grep '^201[0-7]'$'\t''[0-9]' > factbook.csv
rm factbook.xls
