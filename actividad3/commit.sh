#!/usr/bin/bash

set -euo pipefail

MENSAJE="$1"

echo "Añadiendo cambios..."
git add .

echo "Haciendo commit..."
git commit -m "$1"

echo "Haciendo push..."
git push

echo "Commit y push completados"