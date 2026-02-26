#!/bin/bash

set -euo pipefail

DIAS=$1
HORAS=$2
SEGUNDOS=$3

TOTAL=$(( DIAS*24*3600 + HORAS*3600 + SEGUNDOS ))

echo "Total de segundos: $TOTAL"