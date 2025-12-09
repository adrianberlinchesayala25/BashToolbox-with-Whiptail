#!/bin/bash

# Mostrar cuadro de mensaje de bienvenida
whiptail --title "LOGIN" --msgbox "Bienvenido. Por favor, ingresa tus credenciales." 8 50

# Pedir usuario
user=$(whiptail --title "Ingreso de Usuario" --inputbox "Introduce tu nombre de usuario:" 8 50 3>&1 1>&2 2>&3)

# Pedir contraseña (se oculta la entrada)
password=$(whiptail --title "Ingreso de Contraseña" --passwordbox "Introduce tu contraseña:" 8 50 3>&1 1>&2 2>&3)

# Verificar si el usuario existe usando getent (más robusto que grep en /etc/passwd)
if ! getent passwd "$user" > /dev/null; then
    # Mostrar mensaje de error
    whiptail --title "Error" --msgbox "El usuario no existe." 8 50

    # Preguntar si desean registrarse
    registro=$(whiptail --title "Registro" --yesno "¿Deseas registrarte?" 8 50)

    if [ "$?" -eq 0 ]; then
        # Si elige sí, redirigir al registro
        whiptail --title "Redirección" --msgbox "Redirigiendo al registro..." 8 50
        sudo ./pruebascriptregistro.sh
        exit 0
    else
        # Si elige no, salir
        exit 1
    fi
fi
	whiptail --title "Redireccion" --msgbox "Redirigiendo a la aplicación" 8 50
	./maestroapp.sh
