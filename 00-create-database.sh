#!/bin/bash
# See: <https://github.com/jackdb/pg-app-dev-vm/blob/master/Vagrant-setup/bootstrap.sh>
set -e

print_db_usage () {
  echo "Your PostgreSQL database has been setup"
  echo "  Host: localhost"
  echo "  Port: 5432"
  echo "  Database: $APP_DB_NAME"
  echo "  Username: $APP_DB_USER"
  echo "  Password: $APP_DB_PASS"
  echo ""
  echo "Admin access to postgres:"
  echo "  sudo su - postgres"
  echo ""
  echo "psql access to app database user"
  echo "  sudo su - postgres"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost $APP_DB_NAME"
  echo ""
  echo "Env variable for application development:"
  echo "  DATABASE_URL=postgresql://$APP_DB_USER:$APP_DB_PASS@localhost:5432/$APP_DB_NAME"
  echo ""
  echo "Local command to access the database via psql:"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost -p 5432 $APP_DB_NAME"
}

APP_DB_NAME=mpiad
APP_DB_USER=mpiad
APP_DB_PASS=mypassword

cat << EOF | sudo su - postgres -c psql
-- Create the database user:
CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';
-- Create the database:
CREATE DATABASE $APP_DB_NAME WITH
    OWNER=$APP_DB_USER
    LC_COLLATE='en_US.utf8'
    LC_CTYPE='en_US.utf8'
    ENCODING='UTF8'
    TEMPLATE=template0;
EOF

print_db_usage
