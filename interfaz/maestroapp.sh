#!/bin/bash

# Mostrar menú de opciones usando whiptail
option=$(whiptail --title "Menú de Opciones" --menu "Seleccione una opción:" 15 60 4 \
    "1" "Operaciones básicas con archivos" \
    "2" "Ver procesos en ejecución" \
    "3" "Cambio de permisos" \
    "4" "Ver log de actividad" 3>&1 1>&2 2>&3)

# Comprobar la opción seleccionada y ejecutar el correspondiente script
case "$option" in
  1)
    whiptail --title "Operaciones Básicas" --msgbox "Has elegido - Operaciones básicas con archivos" 8 50
    sudo ./option1.sh
    ;;
  2)
    whiptail --title "Procesos en Ejecución" --msgbox "Has elegido - Ver procesos en ejecución" 8 50
    sudo ./option2.sh
    ;;
  3)
    whiptail --title "Cambio de Permisos" --msgbox "Has elegido - Cambio de permisos" 8 50
    sudo ./option3.sh
    ;;
  4)
    whiptail --title "Log de Actividad" --msgbox "Has elegido - Ver log de actividad" 8 50
    sudo ./option4.sh
    ;;
  *)
    whiptail --title "Error" --msgbox "Opción no válida." 8 50
    ;;
esac
