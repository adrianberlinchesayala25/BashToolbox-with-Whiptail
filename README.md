# 🛠️ Bash System Utility Menu (BashToolbox)

> Un conjunto de scripts de administración de sistemas y utilidades comunes empaquetados en un menú interactivo usando `whiptail` para facilitar las tareas en la línea de comandos.
> # ✨ Características Principales

Este proyecto utiliza el poder de **Bash** y la interfaz `whiptail` para ofrecer un menú de administración interactivo que incluye las siguientes utilidades:

* **📂 Gestión Básica de Archivos:** Ejecución de operaciones comunes con archivos y directorios.
* **🔍 Monitoreo de Procesos:** Visualización de procesos activos y consumo de recursos.
* **🔐 Cambio de Permisos:** Utilidad para modificar fácilmente los permisos de archivos y carpetas (`chmod`).
* **📜 Visualización de Logs:** Acceso rápido a archivos de registro (logs) del sistema o de la aplicación.

* ## ⚙️ Requisitos y Uso

### Requisitos

Necesitas tener instalado el paquete `whiptail` en tu distribución de Linux.

* **Debian/Ubuntu:** `sudo apt update && sudo apt install whiptail`
* **Red Hat/CentOS/Fedora:** `sudo dnf install newt` (newt incluye whiptail)

### Instalación y Ejecución

1.  Clona el repositorio:
    ```bash
    git clone [https://github.com/TuUsuario/bash-system-utility-menu.git](https://github.com/TuUsuario/bash-system-utility-menu.git)
    cd bash-system-utility-menu
    ```
2.  Asegúrate de que el script principal y los scripts de opciones tengan permisos de ejecución:
    ```bash
    chmod +x tu_script_principal.sh option*.sh
    ```
3.  Ejecuta el script principal (generalmente requiere `sudo` si las operaciones internas lo requieren, como en tu ejemplo):
    ```bash
    ./tu_script_principal.sh
    ```
