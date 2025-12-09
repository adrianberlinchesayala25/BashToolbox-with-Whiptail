#!/bin/bash

# Mostrar menú de opciones usando whiptail
opcion=$(whiptail --title "Gestión de Procesos" --menu "Seleccione una opción:" 15 60 2 \
    "1" "Ver procesos en ejecución" \
    "2" "Terminar un proceso" 3>&1 1>&2 2>&3)

case "$opcion" in
    1)
        # Mostrar listado de procesos en ejecución
        procesos=$(ps -u "$USER" -o pid,comm)
        whiptail --title "Procesos en Ejecución" --msgbox "$procesos" 15 60
        ;;
    2)
        # Pedir PID del proceso a terminar
        pid=$(whiptail --title "Terminar Proceso" --inputbox "Ingrese el PID del proceso a terminar:" 8 50 3>&1 1>&2 2>&3)
        if kill -9 "$pid" 2>/dev/null; then
            whiptail --title "Éxito" --msgbox "Proceso $pid terminado." 8 50
        else
            whiptail --title "Error" --msgbox "Error: No se pudo terminar el proceso. Verifique el PID." 8 50
        fi
        ;;
    *)
        # Opción no válida
        whiptail --title "Error" --msgbox "Opción no válida." 8 50
        ;;
esac
