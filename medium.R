quality<-function(species)
{ 
  # creating a list of DataIdentified records of that species
  spec<-occ_data(scientificName =species,limit =100)$data$dateIdentified
  
  #creating an emoty list of combined date
  CDate<-c()
  
  # creating an empty list of day
  day<-c()
  
  #creating an empty list of month
  month<-c()
  
  #creating an empty list of year
  year<-c()
  
  #creating an empty list of flag
  flag<-c()
  
  #traversing loop to check quality of date
  for (i in 1:length(spec)) 
  {    
    #to check
    #if there is NA 
    #in date field
    
    if(is.na(spec[i]))
    {
      #adding 0 to combined date list
      CDate<-c(CDate,0)
      
      #adding "bad" to flag's list
      flag<-c(flag,"bad")
      
      #adding day to day's list
      day<-c(day,0)
      
      #adding 0 to year's list
      year<-c(year,0)
      
      #adding 0 to month'slist
      month<-c(month,0)
    }
    else
    {
      cdate<-format(as.Date(spec[i],format="%Y-%m-%d"))
      
      # to extract date from combined date
      d<-format(as.Date(spec[i],format="%Y-%m-%d"), "%d")
      
      # to extract year from combined date
      y<-format(as.Date(spec[i],format="%Y-%m-%d"), "%Y")
      
      # to extract month from combined date
      m<-format(as.Date(spec[i],format="%Y-%m-%d"), "%m")
      
      if(d==0&&m!=0&&y!=0)
      { 
        #if day==0 ie.not given
        # adding "worse" to flag's list
        flag<-c(flag,"worse")
      }
      else if(d!=0&&m==0&&y!=0)
      {
        #if month==0 i.e not given
        # adding "worse" to flag's list
        flag<-c(flag,"worse")
      }
      else if(d!=0&&m!=0&&y==0)
      {
        #if year==0 i.e not given
        # adding "worse" to flag's list
        flag<-c(flag,"worse")
      }
      else if(d==0&&y==0&&m!=0)
      {
        #if day and year are not given
        # adding "worst" to flag's list
        flag<-c(flag,"worst")
      }
      else if(d==0&&m==0&&y!=0)
      {
        #if day and month are not given
        # adding "worst" to flag's list
        flag<-c(flag,"worst")
      }
      
      else if(d!=0&&m==0&&y==0)
      {
        #if month and year are not given 
        # adding "worst" to flag's list
        flag<-c(flag,"worst")
      }
      else
      {
        flag<-c(flag,"good")
      }
      CDate<-c(CDate,cdate)
      
      #adding day to day's list
      day<-c(day,d)
      
      #adding year to year's list
      year<-c(year,y)
      
      #adding month to month's list
      month<-c(month,m)
    }
    
  }
  
  # creating a data frame 
  df<-data.frame(day,year,month,flag,CDate)
  df
  
}

quality("Eudynamys scolopaceus")

#returning 

#day year month flag      CDate
#1    01 2016    06 good 2016-06-01
#2     0    0     0  bad          0
#3    22 2016    03 good 2016-03-22
#4    02 2016    03 good 2016-03-02
#5     0    0     0  bad          0
#6    12 2016    03 good 2016-03-12
#7     0    0     0  bad          0

