
#!/bin/bash

whiptail --title "Cambiador de permisos" --msgbox "Bienvenido al cambiador de permisos de archivos" 8 50

archivo=$(whiptail --inputbox "Ingrese el nombre del archivo:" 8 50 3>&1 1>&2 2>&3)

if [ -e "$archivo" ]; then
    permisos=$(whiptail --inputbox "Ingrese los permisos en formato numérico (ejemplo: 755):" 8 50 3>&1 1>&2 2>&3)
    
    if chmod "$permisos" "$archivo"; then
        whiptail --title "Éxito" --msgbox "Permisos de $archivo cambiados a $permisos" 8 50
    else
        whiptail --title "Error" --msgbox "Hubo un problema al cambiar los permisos." 8 50
    fi
else
    whiptail --title "Error" --msgbox "El archivo no existe." 8 50
fi
