#!/bin/bash

set -euo pipefail

while true
do
    echo "Introduce contraseña:"
    read pass1

    echo "Confirma contraseña:"
    read pass2

    if [ "$pass1" = "$pass2" ]; then
        echo "OK"
        break
    else
        echo "Error no coinciden"
    fi
done