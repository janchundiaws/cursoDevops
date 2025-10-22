#!/bin/bash
# ==========================================================
# Script de instalación de Docker CE en Rocky Linux 8
# Corrige errores comunes de dependencias (containerd.io)
# Autor: William Anchundia
# Fecha: 2025-10-22
# ==========================================================

set -e

echo "=========================================================="
echo "🚀 Iniciando instalación de Docker CE en Rocky Linux 8"
echo "=========================================================="

# Paso 1: Eliminar instalaciones previas
echo "🧹 Eliminando instalaciones previas de Docker..."
sudo dnf remove -y docker* containerd* || true
sudo dnf clean all
sudo rm -rf /var/lib/docker /var/lib/containerd

# Paso 2: Instalar dependencias necesarias
echo "📦 Instalando paquetes requeridos..."
sudo dnf install -y yum-utils device-mapper-persistent-data lvm2

# Paso 3: Agregar repositorio oficial de Docker
echo "🌐 Agregando repositorio oficial de Docker..."
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# Paso 4: Instalar containerd.io manualmente (resuelve conflictos)
echo "⚙️ Instalando containerd.io compatible..."
sudo dnf install -y https://download.docker.com/linux/centos/8/x86_64/stable/Packages/containerd.io-1.6.24-3.1.el8.x86_64.rpm

# Paso 5: Instalar Docker CE y CLI
echo "🐳 Instalando Docker CE..."
sudo dnf install -y docker-ce docker-ce-cli docker-compose-plugin

# Paso 6: Habilitar e iniciar Docker
echo "🚀 Habilitando y arrancando Docker..."
sudo systemctl enable --now docker

# Paso 7: Validar instalación
echo "🔍 Validando instalación..."
sudo docker --version
sudo systemctl status docker --no-pager

# Paso 8: Probar ejecución básica
echo "🧪 Ejecutando contenedor de prueba..."
sudo docker run hello-world

echo "=========================================================="
echo "✅ Instalación completada con éxito."
echo "Docker está activo y funcionando correctamente."
echo "=========================================================="
