#Chatham University SUS 508: Environmental statistics
#1.2 Why learn statistics?
##########

##### Part 1: Explore sea ice extent in the Arctic #####

sea.ice=read.csv('https://www.ncdc.noaa.gov/snow-and-ice/extent/sea-ice/N/10.csv', skip=3)

require(ggplot2)

#Make a histogram of the data

ggplot(sea.ice, aes(x=Value))+
  geom_histogram(bins=20,color='black',fill='gray75')+
  labs(x=expression('Sea ice extent, million km'^2),y='Frequency')+
  scale_y_continuous(expand=c(0,0))+
  theme_classic()

#####
       