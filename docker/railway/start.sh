#!/usr/bin/env bash
set -e

: "${PORT:=8080}"
python3 - <<'PY'
import os
from pathlib import Path

port = os.environ.get("PORT", "8080")
template = Path("/etc/nginx/conf.d/ragflow.conf.template").read_text()
Path("/etc/nginx/conf.d/ragflow.conf").write_text(template.replace("${PORT}", port))
PY

exec /ragflow/entrypoint.sh
