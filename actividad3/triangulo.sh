#!/bin/bash

set -euo pipefail

read -p "Introduzca la base: " base
read -p "Introduzca la altura: " altura

area=$((base * altura / 2))

echo ""
echo "Area del triangulo: $area"
echo ""
echo "Dibujo del triangulo:"
echo ""

for ((i=1; i<=altura; i++))
do
    for ((j=1; j<=i; j++))
    do
        echo -n "#"
    done
    echo ""
done