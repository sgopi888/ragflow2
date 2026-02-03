#!/usr/bin/env bash
set -e

: "${PORT:=8080}"
envsubst '$PORT' < /etc/nginx/conf.d/ragflow.conf.template > /etc/nginx/conf.d/ragflow.conf

exec /ragflow/entrypoint.sh
