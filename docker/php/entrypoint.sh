#!/usr/bin/env bash
set -euo pipefail

php-fpm -F

exec "$@"