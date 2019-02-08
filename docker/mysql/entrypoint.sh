#!/bin/bash
set -eo pipefail

mysqld

exec "$@"
