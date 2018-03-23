#!/bin/bash
set -e
PGUSER=mpiad PGPASSWORD=mypassword psql -h localhost -p 5432 mpiad
