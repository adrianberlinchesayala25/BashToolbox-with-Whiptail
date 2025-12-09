#!/bin/bash

# Solicitar usuario y contraseña
user=$(whiptail --inputbox "Ingrese su nombre de usuario:" 8 50 3>&1 1>&2 2>&3)
password=$(whiptail --passwordbox "Ingrese su contraseña:" 8 50 3>&1 1>&2 2>&3)

# Verificar que la contraseña no contenga el nombre de usuario (opcional)
if [[ "$password" == *"$user"* ]]; then
    whiptail --title "Error" --msgbox "La contraseña no debe contener el nombre de usuario." 8 50
    exit 1
fi

# Crear el usuario y asignar la contraseña
if sudo adduser --allow-all-names --disabled-password --gecos "" "$user" > /dev/null 2>&1; then
    echo "$user:$password" | sudo chpasswd > /dev/null 2>&1
    whiptail --title "Éxito" --msgbox "¡Registro completado con éxito!" 8 50
else
    whiptail --title "Error" --msgbox "Error al crear el usuario." 8 50
    exit 1
fi

# Volver al proceso de inicio de sesión
sudo ./login.sh
