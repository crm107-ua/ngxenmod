#!/bin/bash

# ngxenmod - Script para habilitar módulos en Nginx de forma similar a a2enmod en Apache

# Verificar que se esté ejecutando como root
if [ "$(id -u)" != "0" ]; then
  echo "Este script debe ser ejecutado como root" 1>&2
  exit 1
fi

# Verificar que se haya proporcionado al menos un argumento
if [ "$#" -lt 1 ]; then
  echo "Uso: $0 modulo1 [modulo2 ...]"
  exit 1
fi

# Directorio donde se encuentran los módulos disponibles
MOD_AVAILABLE_DIR="/etc/nginx/sites-available"

# Directorio donde se crearán los enlaces simbólicos para habilitar los módulos
MOD_ENABLED_DIR="/etc/nginx/sites-enabled"

# Crear el directorio de módulos habilitados si no existe
if [ ! -d "$MOD_ENABLED_DIR" ]; then
  mkdir -p "$MOD_ENABLED_DIR"
fi

# Función para habilitar un módulo
enable_module() {
  local module_name="$1"
  local module_path="$MOD_AVAILABLE_DIR/$module_name"
  local link_path="$MOD_ENABLED_DIR/$module_name"

  # Verificar si el módulo existe
  if [ ! -f "$module_path" ]; then
    echo "Error: El módulo '$module_name' no existe en '$MOD_AVAILABLE_DIR'"
    return 1
  fi

  # Verificar si el módulo ya está habilitado
  if [ -L "$link_path" ]; then
    echo "El módulo '$module_name' ya está habilitado"
    return 0
  fi

  # Crear el enlace simbólico para habilitar el módulo
  ln -s "$module_path" "$link_path"
  echo "Módulo '$module_name' habilitado"
}

# Habilitar cada módulo proporcionado como argumento
for module in "$@"; do
  enable_module "$module"
done

# Recargar Nginx para aplicar los cambios
systemctl reload nginx
echo "Nginx recargado"

