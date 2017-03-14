library(spocc)
library(mapr)
library(leaflet)
library(rgbif)

# List of Scientific name of Bird Species
spp<-c("Eudynamys scolopaceus","Pavo cristatus","Accipiter_striatus") 

#Search for occurrences

data<-occ(spp,from="gbif",has_coords =TRUE,limit=100)

#for plotting map
map1<-map_leaflet(data,size=3,color = c("#000000","#FF0000","#FFFF00"))

# creating label which will be used for legend

label1<-c("Asian Koel","Peacock","Sharp-shinned hawk") 

#adding legend of map
addLegend(map1,position="bottomright",colors = c("#000000","#FF0000","#FFFF00"),title="Bird Species",labels = label1)

