#!/bin/sh
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# wait-for-postgres.sh

set -e
  
host="$1"
shift
cmd="$@"
  
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$BOUNDARY_PG_URL" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
exec $cmd