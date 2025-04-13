#!/bin/bash
echo "Creando archivo mytext.txt con 'Hola Mundo'"
echo "Hola Mundo" > mytext.txt
echo "Mostrando contenido de mytext.txt:"
cat mytext.txt
echo "Creando carpeta backup"
mkdir backup
echo "Moviendo archivo a backup/"
mv mytext.txt backup/
echo "Contenido de backup:"
ls backup
echo "Eliminando archivo de backup"
rm backup/mytext.txt
echo "Eliminando carpeta backup"
rmdir backup
