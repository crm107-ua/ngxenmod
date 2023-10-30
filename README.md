#ngxenmod

 `ngxenmod` es un script de Bash diseñado para facilitar la habilitación de módulos en el servidor web Nginx, de una manera similar a cómo `a2enmod` funciona para Apache. Este script crea enlaces simbólicos en el directorio de módulos habilitados de Nginx, y recarga la configuración del servidor para aplicar los cambios.

 ## Requisitos

 - El script debe ser ejecutado como usuario root o con permisos de sudo.
 - Nginx debe estar instalado y configurado correctamente en el sistema.
 - Los módulos que se desean habilitar deben estar presentes en el directorio de módulos disponibles.

 ## Instalación

 1. Copia el script en tu sistema.
 2. Asigna permisos de ejecución al script: `chmod +x ngxenmod`.
 3. (Opcional) Mueve el script al directorio `/usr/local/bin/` para poder ejecutarlo desde cualquier lugar: `mv ngxenmod /usr/local/bin/`.

 ## Uso

 ```bash
 sudo ngxenmod modulo1 [modulo2 ...]
 ```

 - `modulo1, modulo2, ...`: Nombres de los módulos que deseas habilitar. Estos deben coincidir con los nombres de los archivos de módulos en el directorio de módulos disponibles.

 ## Directorios

 - **Módulos Disponibles**: `/etc/nginx/modules-available/`  
   Este directorio debe contener los archivos de módulos que se pueden habilitar.

 - **Módulos Habilitados**: `/etc/nginx/modules-enabled/`  
   Este directorio contendrá enlaces simbólicos a los módulos habilitados.

 ## Funcionamiento

 1. **Verificación de Permisos**: El script verifica si se está ejecutando con permisos de root, ya que se requieren para crear enlaces simbólicos y recargar la configuración de Nginx.

 2. **Verificación de Argumentos**: El script requiere al menos un nombre de módulo como argumento.

 3. **Creación de Enlaces Simbólicos**: Para cada módulo proporcionado como argumento, el script crea un enlace simbólico en el directorio de módulos habilitados.

 4. **Recarga de Nginx**: Finalmente, el script recarga la configuración de Nginx para aplicar los cambios.

 ## Salida

 El script proporciona mensajes de salida para informar al usuario sobre las acciones realizadas, incluyendo la habilitación de módulos, errores si un módulo no existe, y la confirmación de que Nginx se ha recargado correctamente.

 ## Errores Comunes

 - **Módulo no Existe**: Si intentas habilitar un módulo que no está presente en el directorio de módulos disponibles, recibirás un mensaje de error.

 - **Módulo ya Habilitado**: Si intentas habilitar un módulo que ya está habilitado, recibirás un mensaje informándote de ello.

 ## Ejemplos

 Habilitar un único módulo:

 ```bash
 sudo ngxenmod modulo1
 ```

 Habilitar múltiples módulos a la vez:

 ```bash
 sudo ngxenmod modulo1 modulo2 modulo3
 ```



# ngxdismod

`ngxdismod` es un script de Bash diseñado para facilitar la deshabilitación de módulos en el servidor web Nginx. Este script elimina enlaces simbólicos en el directorio de módulos habilitados de Nginx y recarga la configuración del servidor para aplicar los cambios.

## Requisitos

- El script debe ser ejecutado como usuario root o con permisos de sudo.
- Nginx debe estar instalado y configurado correctamente en el sistema.

## Instalación

1. Copia el script en tu sistema.
2. Asigna permisos de ejecución al script: `chmod +x ngxdismod`.
3. (Opcional) Mueve el script al directorio `/usr/local/bin/` para poder ejecutarlo desde cualquier lugar: `mv ngxdismod /usr/local/bin/`.

## Uso

```bash
sudo ngxdismod modulo1 [modulo2 ...]
```

- `modulo1, modulo2, ...`: Nombres de los módulos que deseas deshabilitar. Estos deben coincidir con los nombres de los enlaces simbólicos en el directorio de módulos habilitados.

## Directorios

- **Módulos Habilitados**: `/etc/nginx/modules-enabled/`  
  Este directorio contendrá enlaces simbólicos a los módulos habilitados. Los enlaces simbólicos de los módulos que deseas deshabilitar serán eliminados de este directorio.

## Funcionamiento

1. **Verificación de Permisos**: El script verifica si se está ejecutando con permisos de root, ya que se requieren para eliminar enlaces simbólicos y recargar la configuración de Nginx.

2. **Verificación de Argumentos**: El script requiere al menos un nombre de módulo como argumento.

3. **Eliminación de Enlaces Simbólicos**: Para cada módulo proporcionado como argumento, el script elimina el enlace simbólico correspondiente en el directorio de módulos habilitados.

4. **Recarga de Nginx**: Finalmente, el script recarga la configuración de Nginx para aplicar los cambios.

## Salida

El script proporciona mensajes de salida para informar al usuario sobre las acciones realizadas, incluyendo la deshabilitación de módulos y la confirmación de que Nginx se ha recargado correctamente.

## Errores Comunes

- **Módulo no Está Habilitado**: Si intentas deshabilitar un módulo que no está habilitado, recibirás un mensaje informándote de ello.

## Ejemplos

Deshabilitar un único módulo:

```bash
sudo ngxdismod modulo1
```

Deshabilitar múltiples módulos a la vez:

```bash
sudo ngxdismod modulo1 modulo2 modulo3
```
