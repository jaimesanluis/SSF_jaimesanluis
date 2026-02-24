#!/bin/bash

directorio_actual=$(pwd)

mkdir -p "$directorio_actual"/IMGS
mkdir -p "$directorio_actual"/DOCS
mkdir -p "$directorio_actual"/TXTS
mkdir -p "$directorio_actual"/PDFS
mkdir -p "$directorio_actual"/VACIOS

imgs=0
docs=0
txts=0
pdfs=0
vacios=0

for archivo in "$directorio_actual"/*; do

    if [[ -f "$archivo" ]]; then

        if [[ ! -s "$archivo" ]]; then
            mv "$archivo" "$directorio_actual"/VACIOS/
            ((vacios++))
            continue
        fi

        case "$archivo" in
            *.jpg|*.png|*.gif)
                mv "$archivo" "$directorio_actual"/IMGS/
                ((imgs++))
                ;;
            *.docx|*.odt)
                mv "$archivo" "$directorio_actual"/DOCS/
                ((docs++))
                ;;
            *.txt)
                mv "$archivo" "$directorio_actual"/TXTS/
                ((txts++))
                ;;
            *.pdf)
                mv "$archivo" "$directorio_actual"/PDFS/
                ((pdfs++))
                ;;
        esac
    fi
done

echo "Imágenes: $imgs"
echo "Documentos: $docs"
echo "Textos: $txts"
echo "PDFs: $pdfs"
echo "Vacíos: $vacios"
echo
read -p "¿Deseas eliminar definitivamente los archivos y carpetas vacías? (s/n): " respuesta

if [[ "$respuesta" =~ ^[Ss]$ ]]; then
    
    find "$directorio_actual" -type f -empty -delete
    
    find "$directorio_actual" -type d -empty -delete
    
    echo "Elementos vacíos eliminados."
else
    echo "No se eliminaron elementos vacíos."
fi