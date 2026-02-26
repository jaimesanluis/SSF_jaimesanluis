#!/bin/bash

set -euo pipefail

imc=$(echo "$2 / (($1/100)*($1/100))" | bc -l)

echo "IMC: $imc"

if (( $(echo "$imc < 18.5" | bc -l) )); then
    echo "Bajo de peso"
elif (( $(echo "$imc < 25" | bc -l) )); then
    echo "Peso normal"
elif (( $(echo "$imc < 30" | bc -l) )); then
    echo "Sobrepeso"
else
    echo "Obesidad"
fi