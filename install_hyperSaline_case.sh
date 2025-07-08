#!/bin/bash

echo "============================================================"
echo "  Instalador del Caso OpenFOAM: Inyección Agua Hipersalina"
echo "  Solver: interMixingFoam"
echo "============================================================"

# Verificar si el archivo comprimido existe
if [ ! -f "hyperSalineInlet_OpenFOAM_case.tar.gz" ]; then
    echo "Error: No se encuentra el archivo hyperSalineInlet_OpenFOAM_case.tar.gz"
    echo "Asegúrate de que el archivo esté en el directorio actual."
    exit 1
fi

# Crear directorio de destino
INSTALL_DIR="$HOME/OpenFOAM_cases"
echo "Instalando en: $INSTALL_DIR"

mkdir -p "$INSTALL_DIR"

# Descomprimir el caso
echo "Descomprimiendo el caso..."
tar -xzf hyperSalineInlet_OpenFOAM_case.tar.gz -C "$INSTALL_DIR"

# Verificar instalación
if [ -d "$INSTALL_DIR/hyperSalineInlet" ]; then
    echo "✓ Caso instalado exitosamente en: $INSTALL_DIR/hyperSalineInlet"
    
    # Dar permisos de ejecución a los scripts
    chmod +x "$INSTALL_DIR/hyperSalineInlet/Allrun"
    chmod +x "$INSTALL_DIR/hyperSalineInlet/checkCase.sh"
    
    echo ""
    echo "============================================================"
    echo "  INSTALACIÓN COMPLETADA"
    echo "============================================================"
    echo ""
    echo "Para usar el caso:"
    echo "1. Navegar al directorio:"
    echo "   cd $INSTALL_DIR/hyperSalineInlet"
    echo ""
    echo "2. Verificar el caso:"
    echo "   ./checkCase.sh"
    echo ""
    echo "3. Ejecutar la simulación:"
    echo "   ./Allrun"
    echo ""
    echo "4. Visualizar resultados:"
    echo "   paraFoam"
    echo ""
    echo "============================================================"
    echo "  REQUISITOS:"
    echo "  - OpenFOAM instalado y configurado"
    echo "  - Solver interMixingFoam disponible"
    echo "  - ParaView para visualización (opcional)"
    echo "============================================================"
    
else
    echo "✗ Error en la instalación"
    exit 1
fi