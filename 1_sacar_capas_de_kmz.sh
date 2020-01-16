#!/bin/bash

kmz_file="agebs_pobreza_2015.kmz"
listafile="lista_${kmz_file}.txt" 
ogrinfo $kmz_file > $listafile

carpeta_salida="estados"
mkdir $carpeta_salida
#modificar el 3,38p es el rango de las lineas que deseo tomar del archivo que enlista las capas del kmz
#igual y podria ser un patron, pero para rapidez solo le digo que lineas son las que representan capa en el archivo lista
sed -n 4,38p $listafile | while read line;
do
echo "leyendo $line"
set -- $line

layer_espacios="$2 $3 $4 $5"
#quitando espacios  al nombre de layer
layer=`echo $layer_espacios | sed 's/ *$//g'`
echo "capa: [$layer]"
ogr2ogr -f "KML" "$carpeta_salida/$layer.kml" $kmz_file "$layer"

done

