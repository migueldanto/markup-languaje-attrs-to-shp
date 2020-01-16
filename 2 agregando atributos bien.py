#!/usr/bin/env python
# coding: utf-8

# In[1]:


import geopandas as geopd
import pandas as pd
geopd.io.file.fiona.drvsupport.supported_drivers['KML'] = 'rw'

def sacar_Atributos(row):
    el_html=row["Description"]
    description1=pd.read_html(el_html)[1]
    dict1={"geometry":row["geometry"],"Name":row["Name"]}
    for i,rr in description1.fillna("NA").iterrows():
        dict1[rr[0]]=rr[1]
    return pd.Series(dict1)


# In[2]:


from os import listdir
from unidecode import unidecode
for kml in listdir("estados/"):
    print(kml)
    layer1=geopd.read_file("estados/"+kml,driver="KML")
    obtenirdo=layer1.apply(lambda x:sacar_Atributos(x) ,axis=1)
    layer2= obtenirdo#geopd.GeoDataFrame(obtenirdo,geometry="geometry")
    name_new_file=unidecode(kml[:-4])
    name_new_file="estados/"+name_new_file+"_atr_ok.geojson"
    print("-->"+name_new_file)
    layer2.to_file(name_new_file,driver='GeoJSON',encoding="utf-8")


# In[1]:


from os import listdir
listdir("./")


# In[ ]:




