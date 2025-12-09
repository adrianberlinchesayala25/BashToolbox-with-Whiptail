#!/bin/bash

opcion=$(whiptail --title "Historial de comandos" --menu "Seleccione una opción:" 15 50 3 \
"1" "Ver historial de comandos" \
"2" "Guardar historial en un archivo" \
"3" "Borrar historial" 3>&1 1>&2 2>&3)

case "$opcion" in
    1)
        historial=$(history | tail -n 20)
        whiptail --title "Historial" --msgbox "$historial" 20 70
    ;;
    2)
        archivo=$(whiptail --inputbox "Ingrese el nombre del archivo para guardar el historial:" 8 50 3>&1 1>&2 2>&3)
        historial=$(history | tail -n 20)
        direc="$PWD"
        historial_txt="$direc/$archivo.txt"
        echo "$historial" > "$historial_txt"
        whiptail --title "Éxito" --msgbox "Historial guardado en $archivo.txt" 8 50
    ;;
    3)
        history -c
        whiptail --title "Éxito" --msgbox "Historial borrado." 8 50
    ;;
    *)
        whiptail --title "Error" --msgbox "Opción no válida." 8 50
    ;;
esac
