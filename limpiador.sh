#!/bin/bash

DIR="${1:-$(pwd)}"

if [ ! -d "$DIR" ]; then
    echo "Error: el directorio no existe."
    exit 1
fi

cd "$DIR" || exit

echo "Ordenando archivos en: $DIR"

mkdir -p IMGS DOCS TXTS PDFS VACIOS

imgs=0
docs=0
txts=0
pdfs=0
vacios=0

for f in *; do
    [ -e "$f" ] || continue

    case "$f" in
        IMGS|DOCS|TXTS|PDFS|VACIOS|kaos.sh)
            continue
        ;;
    esac

    if [ -f "$f" ]; then
        
        if [ ! -s "$f" ]; then
            mv "$f" VACIOS/
            ((vacios++))
            continue
        fi

        case "${f,,}" in
            *.jpg|*.png|*.gif)
                mv "$f" IMGS/
                ((imgs++))
            ;;
            *.docx|*.odt)
                mv "$f" DOCS/
                ((docs++))
            ;;
            *.txt)
                mv "$f" TXTS/
                ((txts++))
            ;;
            *.pdf)
                mv "$f" PDFS/
                ((pdfs++))
            ;;
        esac
    fi
done

echo
echo "Buscando elementos vacíos..."

empty_files=$(find . -type f -empty)
empty_dirs=$(find . -type d -empty)

total_empty=$(echo "$empty_files $empty_dirs" | wc -w)


echo "Imagenes movidas : $imgs"
echo "Documentos movidos : $docs"
echo "TXT movidos : $txts"
echo "PDF movidos : $pdfs"
echo "Archivos vacíos movidos : $vacios"
echo "Elementos vacíos encontrados : $total_empty"

if [ "$total_empty" -gt 0 ]; then

    echo
    echo "Elementos vacíos encontrados:"

    [ -n "$empty_files" ] && \
        echo "Archivos vacíos:" && echo "$empty_files"

    [ -n "$empty_dirs" ] && \
        echo "Carpetas vacías:" && echo "$empty_dirs"

    echo
    read -p "¿Deseas eliminarlos? (s/n): " resp

    if [[ "$resp" =~ ^[sS]$ ]]; then
        find . -type f -empty -delete
        find . -type d -empty -delete
        echo "Elementos vacíos eliminados."
    else
        echo "No se eliminaron elementos."
    fi
fi

echo
echo "Proceso finalizado"