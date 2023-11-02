#!/bin/bash

# ngxdismod - Script para deshabilitar módulos en Nginx

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

# Directorio donde se encuentran los módulos habilitados
MOD_ENABLED_DIR="/etc/nginx/sites-enabled"

# Función para deshabilitar un módulo
disable_module() {
  local module_name="$1"
  local link_path="$MOD_ENABLED_DIR/$module_name"

  # Verificar si el módulo está habilitado
  if [ ! -L "$link_path" ]; then
    echo "El módulo '$module_name' no está habilitado"
    return 0
  fi

  # Eliminar el enlace simbólico para deshabilitar el módulo
  rm "$link_path"
  echo "Módulo '$module_name' deshabilitado"
}

# Deshabilitar cada módulo proporcionado como argumento
for module in "$@"; do
  disable_module "$module"
done

# Recargar Nginx para aplicar los cambios
systemctl reload nginx
echo "Nginx recargado"

