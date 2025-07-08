# Simulación de Inyección de Agua Hipersalina en Agua de Mar

## Descripción

Este caso de OpenFOAM simula la inyección de agua hipersalina en un dominio lleno de agua de mar utilizando el solver `interMixingFoam`. El setup incluye:

- **Dominio**: Paralelepípedo (caja) de 5m x 2m x 1.5m
- **Fluido principal**: Agua de mar (densidad: 1025 kg/m³, salinidad: 3.5%)
- **Fluido inyectado**: Agua hipersalina (densidad: 1200 kg/m³, salinidad: 25%)
- **Geometría**: Tubería de entrada lateral para agua hipersalina

## Parámetros Físicos

### Agua de Mar (seawater)
- Densidad: 1025 kg/m³
- Viscosidad cinemática: 1.05×10⁻⁶ m²/s
- Concentración de sal: 3.5%
- Temperatura: 20°C (293.15 K)

### Agua Hipersalina (hypersaline)
- Densidad: 1200 kg/m³
- Viscosidad cinemática: 1.8×10⁻⁶ m²/s
- Concentración de sal: 25%
- Temperatura: 40°C (313.15 K)
- Velocidad de inyección: 1.5 m/s

## Estructura del Caso

```
hyperSalineInlet/
├── 0/                  # Condiciones iniciales
│   ├── alpha.seawater  # Fracción volumétrica agua de mar
│   ├── gamma           # Concentración de sal
│   ├── p_rgh          # Presión hidrostática
│   ├── U              # Velocidad
│   ├── T              # Temperatura
│   ├── k              # Energía cinética turbulenta
│   ├── epsilon        # Disipación turbulenta
│   └── nut            # Viscosidad turbulenta
├── constant/           # Propiedades constantes
│   ├── transportProperties  # Propiedades de los fluidos
│   ├── turbulenceProperties # Configuración turbulencia
│   └── g              # Gravedad
└── system/            # Configuración del solver
    ├── controlDict    # Control temporal
    ├── fvSchemes     # Esquemas numéricos
    ├── fvSolution    # Configuración solucionadores
    └── blockMeshDict # Definición de la malla
```

## Instrucciones de Uso

### 1. Preparación
```bash
cd hyperSalineInlet
```

### 2. Ejecutar la simulación completa
```bash
./Allrun
```

### 3. Ejecutar paso a paso
```bash
# Generar malla
blockMesh

# Verificar malla
checkMesh

# Ejecutar simulación
interMixingFoam
```

### 4. Visualización
```bash
# Abrir en ParaView
paraFoam
```

## Variables de Interés

- **alpha.seawater**: Fracción volumétrica del agua de mar (1 = agua de mar pura, 0 = agua hipersalina pura)
- **gamma**: Concentración de sal (0.035 = agua de mar, 0.25 = agua hipersalina)
- **U**: Campo de velocidades
- **T**: Campo de temperatura
- **p_rgh**: Presión hidrostática

## Fenómenos Físicos Simulados

1. **Mezcla convectiva**: Debido a diferencias de densidad
2. **Transferencia de calor**: Agua hipersalina más caliente
3. **Difusión de sal**: Gradientes de concentración
4. **Efectos de flotabilidad**: Agua hipersalina más densa se hunde
5. **Turbulencia**: Modelo k-epsilon para capturar la mezcla turbulenta

## Parámetros de Simulación

- **Tiempo total**: 100 segundos
- **Paso de tiempo**: Adaptativo (max ΔT = 0.1s)
- **Números de Courant**: maxCo = 0.5, maxAlphaCo = 0.5
- **Esquemas**: Principalmente limitedLinear y vanLeer para estabilidad
- **Modelo de turbulencia**: k-epsilon RAS

## Aplicaciones

Este tipo de simulación es relevante para:
- Descargas de plantas desalinizadoras
- Inyección de salmueras en acuíferos
- Estudios de impacto ambiental marino
- Optimización de sistemas de descarga
- Análisis de mezcla en reservorios salinos