archivomerge="estados/merge_todo.shp"
idx=1
for filename in estados/*.geojson; do
    echo "agregando $idx° --->$filename"
    #PRIMERO CONVERTIR A SHP PORQUE CADA QUE QUIERO HACER APPEND DE JSON A SHP NUNCA VAN A COINCIDIR LOS CAMPOS
    #PORQUE SHP SIEMPRE VA A  TENER LOS NOMBRES CORTOS
    current_pero_shp="${filename}_yaen.shp"
    ogr2ogr -f "ESRI Shapefile"  "${current_pero_shp}" "${filename}" -lco ENCODING=UTF-8
    echo "juntando [${current_pero_shp}]"
    if [ -f $archivomerge ];
    then
        ogr2ogr -f "ESRI Shapefile" -update -append  $archivomerge "${current_pero_shp}" -lco ENCODING=UTF-8 
    else
        ogr2ogr -f "ESRI Shapefile"  $archivomerge "${current_pero_shp}" -lco ENCODING=UTF-8
    fi
    idx=$(($idx+1))
done