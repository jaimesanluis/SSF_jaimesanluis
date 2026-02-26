#!/bin/bash

set -euo pipefail

while true
do
    echo "introduce contraseña:"
    read -s pass1

    echo "confirma contraseña:"
    read -s pass2

    if [ "$pass1" = "$pass2" ]; then
        echo "ok"
        break
    else
        echo "error no coinciden"
    fi
done