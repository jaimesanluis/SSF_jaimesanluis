#!/bin/bash

set -euo pipefail

read -p "introduzca la base: " base
read -p "introduzca la altura: " altura

area=$((base * altura))

echo ""
echo "area del rectangulo: $area"
echo ""
echo "dibujo del rectangulo:"
echo ""

for ((i=1; i<=altura; i++))
do
    for ((j=1; j<=base; j++))
    do
        echo -n "#"
    done
    echo ""
done