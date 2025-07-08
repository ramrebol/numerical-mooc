# 📥 Instrucciones de Descarga - Caso OpenFOAM: Inyección Agua Hipersalina

## 🎯 Archivos Generados

He creado un caso completo de OpenFOAM listo para usar. Los archivos disponibles son:

1. **`hyperSalineInlet_OpenFOAM_case.tar.gz`** (5.9 KB) - Caso completo comprimido
2. **`install_hyperSaline_case.sh`** - Script de instalación automática

## 📦 Contenido del Caso

El archivo comprimido incluye:
```
hyperSalineInlet/
├── 0/                      # Condiciones iniciales (8 campos)
│   ├── alpha.seawater      # Fracción volumétrica agua de mar
│   ├── gamma              # Concentración de sal
│   ├── p_rgh              # Presión hidrostática
│   ├── U                  # Velocidad
│   ├── T                  # Temperatura
│   ├── k                  # Energía cinética turbulenta
│   ├── epsilon            # Disipación turbulenta
│   └── nut                # Viscosidad turbulenta
├── constant/              # Propiedades físicas
│   ├── transportProperties # Propiedades de los fluidos
│   ├── turbulenceProperties # Configuración turbulencia
│   └── g                  # Gravedad
├── system/                # Configuración numérica
│   ├── controlDict        # Control temporal
│   ├── fvSchemes         # Esquemas numéricos
│   ├── fvSolution        # Configuración solucionadores
│   ├── blockMeshDict     # Definición malla
│   └── decomposeParDict  # Configuración paralela
├── Allrun                 # Script ejecución automática
├── checkCase.sh          # Script verificación
└── README.md             # Documentación completa
```

## 🚀 Métodos de Descarga

### Opción 1: Descarga Individual de Archivos

Si estás usando Cursor/VS Code, puedes:

1. **Hacer clic derecho** en los siguientes archivos y seleccionar "Download":
   - `hyperSalineInlet_OpenFOAM_case.tar.gz`
   - `install_hyperSaline_case.sh`

2. **Descargar el directorio completo**: Clic derecho en `hyperSalineInlet/` → Download

### Opción 2: Usando el Script de Instalación (Recomendado)

1. **Descargar los archivos**:
   ```bash
   # Descargar el archivo comprimido y el instalador
   # (desde Cursor: clic derecho → Download)
   ```

2. **Ejecutar la instalación**:
   ```bash
   chmod +x install_hyperSaline_case.sh
   ./install_hyperSaline_case.sh
   ```

   Esto instalará el caso en: `$HOME/OpenFOAM_cases/hyperSalineInlet/`

### Opción 3: Instalación Manual

1. **Descargar y descomprimir**:
   ```bash
   mkdir -p ~/OpenFOAM_cases
   tar -xzf hyperSalineInlet_OpenFOAM_case.tar.gz -C ~/OpenFOAM_cases/
   ```

2. **Dar permisos**:
   ```bash
   cd ~/OpenFOAM_cases/hyperSalineInlet
   chmod +x Allrun checkCase.sh
   ```

## ⚡ Uso Rápido

Una vez instalado:

```bash
# Navegar al caso
cd ~/OpenFOAM_cases/hyperSalineInlet

# Verificar configuración
./checkCase.sh

# Ejecutar simulación
./Allrun

# Visualizar (con ParaView)
paraFoam
```

## 🔧 Requisitos del Sistema

- **OpenFOAM** instalado y configurado (versión 8+)
- **Solver interMixingFoam** disponible
- **ParaView** para visualización (opcional)
- **Sistema Unix/Linux** (Ubuntu, CentOS, etc.)

## 📋 Verificación de Instalación

Ejecuta el script de verificación:
```bash
./checkCase.sh
```

Deberías ver:
```
✓ Directorios principales presentes
✓ alpha.seawater
✓ gamma
✓ p_rgh
... (todos los campos)
✓ Solver configurado: interMixingFoam
```

## 🎯 Parámetros del Caso

- **Dominio**: 5m × 2m × 1.5m (paralelepípedo)
- **Agua de mar**: 1025 kg/m³, salinidad 3.5%, T=20°C
- **Agua hipersalina**: 1200 kg/m³, salinidad 25%, T=40°C  
- **Velocidad entrada**: 1.5 m/s
- **Tiempo simulación**: 100 segundos
- **Modelo turbulencia**: k-epsilon

## 📞 Soporte

Si tienes problemas:
1. Verifica que OpenFOAM esté correctamente instalado: `which interMixingFoam`
2. Ejecuta `./checkCase.sh` para diagnóstico
3. Revisa el archivo `README.md` dentro del caso

---
**¡El caso está listo para ejecutar inmediatamente!** 🚀