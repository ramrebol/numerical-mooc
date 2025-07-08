#!/bin/bash

echo "========================================"
echo "  Verificación del Caso OpenFOAM"
echo "  interMixingFoam - Agua Hipersalina"
echo "========================================"

# Verificar estructura de directorios
echo "1. Verificando estructura de directorios..."
if [ -d "0" ] && [ -d "constant" ] && [ -d "system" ]; then
    echo "   ✓ Directorios principales presentes"
else
    echo "   ✗ Faltan directorios principales"
    exit 1
fi

# Verificar archivos de campos iniciales
echo "2. Verificando campos iniciales..."
required_fields=("alpha.seawater" "gamma" "p_rgh" "U" "T" "k" "epsilon" "nut")
for field in "${required_fields[@]}"; do
    if [ -f "0/$field" ]; then
        echo "   ✓ $field"
    else
        echo "   ✗ Falta $field"
    fi
done

# Verificar archivos de propiedades
echo "3. Verificando propiedades..."
if [ -f "constant/transportProperties" ]; then
    echo "   ✓ transportProperties"
else
    echo "   ✗ Falta transportProperties"
fi

if [ -f "constant/turbulenceProperties" ]; then
    echo "   ✓ turbulenceProperties"
else
    echo "   ✗ Falta turbulenceProperties"
fi

if [ -f "constant/g" ]; then
    echo "   ✓ g (gravedad)"
else
    echo "   ✗ Falta archivo g"
fi

# Verificar configuración del sistema
echo "4. Verificando configuración del sistema..."
system_files=("controlDict" "fvSchemes" "fvSolution" "blockMeshDict")
for file in "${system_files[@]}"; do
    if [ -f "system/$file" ]; then
        echo "   ✓ $file"
    else
        echo "   ✗ Falta $file"
    fi
done

# Verificar solver en controlDict
echo "5. Verificando solver..."
if grep -q "interMixingFoam" system/controlDict; then
    echo "   ✓ Solver configurado: interMixingFoam"
else
    echo "   ✗ Solver no configurado correctamente"
fi

echo ""
echo "========================================"
echo "  Resumen del Caso:"
echo "  - Dominio: 5m x 2m x 1.5m"
echo "  - Agua de mar: 1025 kg/m³, 3.5% sal"
echo "  - Agua hipersalina: 1200 kg/m³, 25% sal"
echo "  - Entrada: 1.5 m/s velocidad"
echo "  - Tiempo simulación: 100 s"
echo "========================================"
echo ""
echo "Para ejecutar:"
echo "  ./Allrun"
echo ""
echo "Para visualizar:"
echo "  paraFoam"
echo "========================================"