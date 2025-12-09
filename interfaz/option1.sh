#!/bin/bash

directorio="$PWD"

# Mostrar menú de opciones usando whiptail
opcion=$(whiptail --title "Menú de Archivos" --menu "Seleccione una opción:" 15 60 3 \
    "1" "Crear un archivo" \
    "2" "Eliminar un archivo" \
    "3" "Listar archivos en el directorio" 3>&1 1>&2 2>&3)

case "$opcion" in
    1)
        # Crear archivo
        archivo=$(whiptail --title "Crear archivo" --inputbox "Ingrese el nombre del archivo a crear:" 8 50 3>&1 1>&2 2>&3)
        if [ -n "$archivo" ]; then
            mkdir -p "$directorio/$archivo"
            whiptail --title "Éxito" --msgbox "Archivo $archivo creado en $directorio." 8 50
        else
            whiptail --title "Error" --msgbox "El nombre del archivo no puede estar vacío." 8 50
        fi
        ;;
    2)
        # Eliminar archivo
        archivo=$(whiptail --title "Eliminar archivo" --inputbox "Ingrese el nombre del archivo a eliminar:" 8 50 3>&1 1>&2 2>&3)
        if [ -e "$directorio/$archivo" ]; then
            rm "$directorio/$archivo"
            whiptail --title "Éxito" --msgbox "Archivo $archivo eliminado." 8 50
        else
            whiptail --title "Error" --msgbox "El archivo no existe en $directorio." 8 50
        fi
        ;;
    3)
        # Listar archivos
        archivos=$(ls "$directorio")
        whiptail --title "Archivos en $directorio" --msgbox "$archivos" 15 60
        ;;
    *)
        # Opción no válida
        whiptail --title "Error" --msgbox "Opción no válida." 8 50
        ;;
esac
