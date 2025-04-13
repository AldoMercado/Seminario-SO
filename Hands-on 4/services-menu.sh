#!/bin/bash

while true; do
  echo "==== MENÚ ===="
  echo "1. Listar archivos de una carpeta"
  echo "2. Crear un archivo con texto"
  echo "3. Comparar dos archivos"
  echo "4. Mostrar uso de awk"
  echo "5. Buscar con grep"
  echo "6. Salir"
  read -p "Elige una opción: " opcion

  case $opcion in
    1)
      read -p "Introduce la ruta absoluta: " ruta
      ls -l "$ruta"
      ;;
    2)
      read -p "Nombre del archivo: " archivo
      read -p "Texto a guardar: " texto
      echo "$texto" > "$archivo"
      echo "Archivo '$archivo' creado."
      ;;
    3)
      read -p "Primer archivo: " a1
      read -p "Segundo archivo: " a2
      diff "$a1" "$a2"
      ;;
    4)
      read -p "Archivo para awk: " awkfile
      awk '{print $1}' "$awkfile"
      ;;
    5)
      read -p "Palabra a buscar: " palabra
      read -p "Archivo: " grepfile
      grep "$palabra" "$grepfile"
      ;;
    6)
      echo "Saliendo..."
      break
      ;;
    *)
      echo "Opción inválida"
      ;;
  esac
  echo "" # Línea en blanco para mejor lectura
done
