#!/usr/bin/bash


set -euo pipefail

MENSAJE="$1"

git add .

git commit -m "$1"

git push
echo "agregar, commit y push han sido realizados con exito"