#!/bin/bash

set -euo pipefail

read -p "Introduzca la base: " base
read -p "Introduzca la altura: " altura

area=$((base * altura))

echo ""
echo "Área del rectángulo: $area"
echo ""
echo "Dibujo del rectángulo:"
echo ""

for ((i=1; i<=altura; i++))
do
    for ((j=1; j<=base; j++))
    do
        echo -n "#"
    done
    echo ""
done