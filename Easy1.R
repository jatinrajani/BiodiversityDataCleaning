library(rgbif)
library(spocc)
library(maps)
library(mapdata)
map('worldHires','India')
# for Himalayan Tiger
tiger<-occ(query="Tetraogallus himalayensis",from="gbif",has_coords = TRUE,limit=10) # for Himalayan Tiger
datatig<-tiger$gbif$data$Tetraogallus_himalayensis

# longitude and latitude of Himalyan Tiger
datatigx<-as.numeric(data$longitude)
datatigy<-as.numeric(data$latitude)

# plotting  tiger's points on map
points(datatigx,datatigy,col="yellow",pch=3)

# occurences of Indian Rhinoceros 
rhino<-occ(query="Rhinoceros unicornis",from="gbif",has_coords = TRUE,limit=10) 

# longitude and latitude of Indian Rhinoceros 
datarhino<-rhino$gbif$data$Rhinoceros_unicornis
datarhinox<-as.numeric(datarhino$longitude)
datarhinoy<-as.numeric(datarhino$latitude)

# plotting Indian Rhinoceros points on map
points(datarhinox,datarhinoy,col="red",pch=7)

#occurrences of Black Buck

blackbuck<-occ(query ="Antilope cervicapra",from="gbif",has_coords = TRUE,limit=10)

# longitude and latitude of BlackBuck 
databuck<-blackbuck$gbif$data$Antilope_cervicapra
databuckx<-as.numeric(databuck$longitude)
databucky<-as.numeric(databuck$latitude)

#plotting BlackBuck on map
points(databuckx,databucky,col="green",pch=5)

#adding legend to map
legend('topright',c("Himalayan Tiger","Indian rhinoceros","Blackbuck"),
lty=1, col=c('yellow', 'red', 'green'), bty='n', cex=.75)