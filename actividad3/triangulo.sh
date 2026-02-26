#!/bin/bash

set -euo pipefail

read -p "introduzca la base: " base
read -p "introduzca la altura: " altura

area=$((base * altura / 2))

echo ""
echo "area del triangulo: $area"
echo ""
echo "dibujo del triangulo:"
echo ""

for ((i=1; i<=altura; i++))
do
    for ((j=1; j<=i; j++))
    do
        echo -n "#"
    done
    echo ""
done