#!/bin/bash

THEME_DIR="$HOME/.emulationstation/themes/slate-es-de"

CONSOLES_DIR="$THEME_DIR/_inc/consoles"
CONTROLLER_DIR="$THEME_DIR/_inc/controller"
LOGOS_DIR="$THEME_DIR/_inc/logos"

mkdir -p "$CONSOLES_DIR" "$CONTROLLER_DIR" "$LOGOS_DIR"

for system in "$THEME_DIR"/*; do
    [ -d "$system" ] || continue

    system_name=$(basename "$system")

    # evitar carpetas internas (_inc, layout, etc.)
    [[ "$system_name" == _* ]] && continue

    images_dir="$system/images"
    [ -d "$images_dir" ] || continue

    # Consola
    if [ -f "$images_dir/consolegame.svg" ]; then
        mv "$images_dir/consolegame.svg" \
           "$CONSOLES_DIR/${system_name}.svg"
    fi

    # Controller
    if [ -f "$images_dir/controller.svg" ]; then
        mv "$images_dir/controller.svg" \
           "$CONTROLLER_DIR/${system_name}.svg"
    fi

    # Logo (opcional, por si existe)
    if [ -f "$images_dir/logo.svg" ]; then
        mv "$images_dir/logo.svg" \
           "$LOGOS_DIR/${system_name}.svg"
    fi
done

echo "Extracción a _inc finalizada."
