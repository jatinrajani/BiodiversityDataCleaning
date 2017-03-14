library(rgbif)
library(spocc)
library(geosphere)
  

setwd("~/BiodiversityDataCleaning")


# using a csv file for getting coordinates of country's centroid

countries=read.csv("country_centroids_all.csv",stringsAsFactors = FALSE,sep="\t")


# specifying range in kms 

nearesttoCentroid<-function(country,range,species) 
{      
  # getting centroid coordinates for country
  # i.e latitude and longitude
  
  coordinates<-countries[countries$SHORT_NAME==country,c(1,2)]  
  
  # getting coordinates for species
  # latitude and longitude
  
  spec<-occ_data(scientificName = species,hasCoordinate = TRUE,limit = 1000)
  speccordinates<-spec$data[,c(3,4)]
  
  # traversing loop to get species nearest to centroid coordinate
  
  for(i in 1:length(speccordinates))
  { 
    
    distance<-c()
    
    # using package geosphere 
    # for using functioun distHaverine 
    # to calculate distance from latitude and longitude 
    
    
    dist<-distm(speccordinates[,c("decimalLongitude","decimalLatitude")],coordinates[,c("LONG","LAT")],fun=distHaversine)
    
    # adding dist in distance list
    
    distance<-c(distance,dist)
  }
  
  # converting m into kms
  
  distance=distance/1000 
  
  #index of species lying within a particular range
  
  withinrange<-c(which(distance<range))
  
  # no.of species lying within particular range
  
  len=length(withinrange)
  len
  
}

nearesttoCentroid("India",1000,"Rhinoceros unicornis")
#returnig 9 within 1000kms