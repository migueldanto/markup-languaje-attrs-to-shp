# transformador de atributos html de kml a shp

Este script se realizo prensado en un caso especifico, pero prodria adecuarse a cualquier kml que tenga atributos en una tabla embedida de html, identificando cada proceso realizado

Datos de [CONEVAL](https://www.coneval.org.mx/Medicion/Paginas/POBREZA-URBANA-EN-MEXICO-2015.aspx)

- El kmz es un archivo comprimido que tiene 32 capas dentro y solo son accesibles mediante Google Earth o un GIS, el escript **1** saca las capas y las convierte a kml un formato ya sin compresion pero que aun puede albergar una tabla html dentro de uno de los atributos de la capa
-  el script **2** se encarga de scrapear el html del atributo que contiene la tabla y las convierte a atributos de la capa, por razones de codificacion se guardan en geojson en lugar de guardarlas directo a shp
- el **3**er script solo arma el rompecabezas, y va convirtiendo en `.shp` a partir de GDAL.. 

