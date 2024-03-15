#!/bin/bash

# Configuración de variables
MSYS2_PATH="/c/msys64"  # Ruta de instalación de MSYS2
PROJECT_NAME="gcj_debian"  # Nombre del proyecto

# Generar el archivo de solución de Visual Studio
echo "Generando proyecto para Visual Studio..."
mkdir -p vs_project
cd vs_project || exit
cmake -G "Visual Studio 16 2019" -S .. -B . -DCMAKE_BUILD_TYPE=Debug -DMSYS2_PATH="$MSYS2_PATH" -DPROJECT_NAME="$PROJECT_NAME"
echo "Proyecto generado en el directorio 'vs_project'."
