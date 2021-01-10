#Chatham University SUS 508: Environmental statistics
#1.1 Introduction to R
##########

##### Part 1: R Basics #####

2+2

# What is two plus two?

2+2 #The answer is four, it seems.

# Create examples of a SCALAR: a singular numeric entity

a = 2+2
a <- 2+2
b = 5*15
a*b

#Create an example of a VECTOR: a series of numbers

d = c(1,2,3,4,5,6,7,8,9,10) #Creates a vector of numbers from 1 to 10

d.also = (1:10) #Does the same thing, but in a different way (and with fewer digits!)

e = (-10:5)

#Use [] to ask R for specific parts of a vector

e[5]

e[2:6]

#Learn about a very basic but useful function: mean()

mean(d) #Calculates the mean of d

mean(d[1:5]) #Calculates the mean of just the first 5 numbers in d

#####

##### Part 2: Importing data into R ######

#Read the data introduced on page 97 into your R environment.

lecturerData = read.delim('https://studysites.sagepub.com/dsur/study/DSUR%20Data%20Files/Chapter%203/Lecturer%20Data.dat')

#Read the data from the above as a downloaded file

lecturerData <- read.delim("C:/Users/RUtz/Desktop/Lecturer Data.dat") #YOUR PATH WILL BE DIFFERENT THAN MINE!

#####

##### Part 3: Data frames and types ######

#Making a dummy dataframe of salamander samples

plots = c('A','A','A','A','B','B','B','B') #Plots from my fake study
species = (c('Ds','Ds','Pg','Pg','Ag','Ds','Ds','Pg'))
weights = c(1.2,1.4,1.5,1.2,1.9,1.4,1.0,1.5)
disease = c(F,F,F,T,F,F,T,F)
#Note: clearly, R is NOT for entering data!!

sal.data=data.frame(plots,species,weights,disease)

#Check out the structure of our new dataframe

str(sal.data)

#Find the mean of all salamanders:

mean(sal.data$weights)

#Ask for the third through fifth rows and first column of salamanders:

sal.data[3:5,1]

#Calculate the mean weight for salamanders in the Ds species:

mean(sal.data$weights[sal.data$species=='Ds'])

#Create a dataframe of only undiseased salamanders:

disease = sal.data[sal.data$disease==F,]

#Eliminate a bit of data from the dataframe to make a point:

sal.data[2,3]=NA #Vaporize the second weight reading

mean(sal.data$weights)
mean(sal.data$weights, na.rm = T)

#The subset() function

lecturerOnly=subset(lecturerData, job==2)

richLecturerOnly=subset(lecturerData, job==2 & income>1000)

richOrNeuroticLecturerOnly=subset(lecturerData, job==2 & income>1000 | neurotic>20)

#####

##### Part 4: Coding strategies #####

#If you overwrite something, R will totally forget the old meaning!

sals.large = sal.data[sal.data$weights>1.3,] #creates a dataset of salamanders bigger than 1.3 g

table(sals.large$species) #creates a table of counts by species for large salamanders

sals.large = 5000 #overwrites what sals.large means; now it means the scalar 5000

table(sals.large$species) #doesn't work!!

#Suppose I want to take the 4th salamander weight and multiply it by the maximum weight in the dataset BUT ONLY for salamanders from plot A (it's weird, I know, but it can be done in a single line).

sal.data$weights[4]*max(sal.data$weights[sal.data$plots==A]) #What's wrong?

sal.data$weights[4]*max(sal.data$weights[sal.data$plots=='A'])

##### Part 5: Packages #####

#Install three packages you'll surely need this semester:

install.packages(c('ggplot2','vegan','readxl'))

library(ggplot2) #Activates the ggplot2 package
require(vegan) #Activates the vegan package
