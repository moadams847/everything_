##################### 29/05/18 getting started #########################

## stack over flow site for questions and answers
max(2,6,7,8)
min(8,9,3)

help.start() ### to see r documentaion
help("matrix") ## want to know more about matrix
args(matrix) ## want to know the arguments of the fxn matrix
example("matrix") ### gives an example of how the fxn is used
example("function")

help.search("mean")
help(adf.test, package = "tseries")

help(package="hp")
RSiteSearch("tseries")### to search for info on the web directly from R

### rseek.org  important r search engine
#### stackoverflow.com a QnA site for R programming
##chang stats.stackexe.com  questions regarding statistical analysis

install.packages("tseries")

#"How to Ask Questions
#the Smart Way"         book i should read

# ! = not , & = and , | = or

x<-c(1:10)
x>=5 ## logical operator

### %% read on

class(c(TRUE,FALSE)) ## hence the class of logical is true

class(3+1i)
class(1:10)
class(c("adams","ans"))

## categorical data
(gender<-factor(c("male","female","male","female","male")))
args(factor)
?factor
unclass(gender) ### converts it into an integer value

nlevels(gender) 
levels(gender)
## to see the integer values assigned to gender use
as.integer(gender) ## prints the integer values

gen<-sample(c("female","male"), 10000, replace = T)
args(sample)

hh<-as.factor(gen)
object.size(gen)
object.size(hh)

### remember to convert factors to characters to 
# take advantage of string 
## manipilation
as.character(gen) ##converted gender to characters
is.vector(gen) ## logical operator

## as in r is mostly used for coverting variables to other forms
## "is" is a logical operator
class(123)
x<-"123"
as.numeric(x) ### changes the strings to numerics

asd<-c(6,7,9.8)
as.data.frame(asd) ### converts the vector into a data frame

for(i in asd) print(i)

library(MASS)
boxplot(anorexia)
boxplot(anorexia[,3])
graphics.off()
anorexia
View(head(anorexia)) ### displays 1st 6 values in grid lines
str(anorexia)
names(anorexia)

man<-matrix(c(1,2,4, 
              3,35,4, 
              6,8,9), nrow = 3, byrow = T)

rownames(man)<-c("A","B","C")
colnames(man)<-c(10,20,30)
str(man)
rownames(man)[1]<-c("k")
colnames(man)
x<-c(3,7,8)
hs<-cbind(man,x)
d<-c(4,6,7,8)
rbind(hs,d)
y<-names(anorexia)
y[2]<-"cake"
y[3]
y[1]

#### indexing [i,j] i= row and j= column
man[(1:2),c(1:2)]
man[1:2,(2:3)]

### naming a vector
x<-1:8
names(x)<-c("apple","mango","orange","bannana","apple")

##indexing
x[-3]
x[-1:-4]
x[c("apple","orange"),]
x[]

which.max(x) ### tells us about the highest data point
which.min(x) ### tells us about the lowest data point

which(x>6) ## also used for indexing

rep_len(1:10,13)


mt<-matrix(c(1,2,3, 
             7,8,9, 
             9,7,6), nrow =3 )

mr<-matrix(c(6,7,8, 
             8,9,5, 
             7,6,5), nrow = 3)

mt%*%mr ### multiplying mt by mr
mt+mr

t(mr) ## transposes matrix mr
t(mt) ###
?trace

which.max(mr) ### tells us about the max value in the matrix

inv<-solve(mr) ## inverse of mr
inv%*%mr ## the iverse x the matric mr

din<-solve(mt) ## inverse of mt
din%*%mt

################## lists and data frames 02/06/18 #################
## allows us to use same lenth of data but non singular in nature

my_list<-list(mr,mt,x,month.abb)
names(my_list)<-c("adams","mohammed","aziz","bintu")

my_list$adams
is.list(my_list[c(1,3)])
   
my_list[c(1,3)]

### converting between vectors to lists
as.list(x) ### converted vector x to list

unlist(my_list)
## combining list
c(list(a=1,b=3), list(c=8))
### combined my_list with 8,8,9,7
c(my_list, list(c(8,8,9,7)))

#### NULL means empty variable
ls<-list(jan="new yr", feb=NULL, march="6th march")

#### NA is a special missing value and a scalar vale as well
length(NA)==1
length(NULL)==0

ls$jan<-list(NULL) ### replaced new yr with null

### DATA FRAME
args(data.frame)
x<-sample(LETTERS[1:5])
dfr<-data.frame(x=x, 
              y=rnorm(5), z=runif(5)>0.5, 
              row.names = c("adams","sule","esi","ama","aziz"))
### row.names adds labels to each row

rnorm(5, mean = 0, sd = 1)
runif(5)

month.name[1:5] ### months from jan to May

##### data frame manipulation ####
dim(dfr)
row.names(dfr)
colnames(dfr)
dfr[1,2]

set.seed(11)
another_dfr<-data.frame(z=rnorm(5), y=sample(5), x =letters[3:7])
rbind(dfr,another_dfr)


example("merge")

merge(dfr,another_dfr,by="x")
colSums(dfr[-1,2:3])

dfr[-1,2:3]
colMeans(dfr[,2:3])

#### exercise on Data frames ####
library(datasets)
beaver1
length(beaver1)
id<-rep(1,114) ### added id to beaver 1 data set using cbind
seq(1,10,1.5)
be<-cbind(beaver1,id)
colMeans(be[-1,2:3]) ## colmeans of be
colSums(be[-1,2:3]) ## colsums of be

#----------------------------------------------------------

############### Environment 04/06/18 ################
an_environment<-new.env()
an_environment[["pythag"]]<-c(12,15,20,21) ### means put pythag into the global env


exists("pythag",an_environment)

############## writing fxns ###############
hypothanus<-function(x,y){
  sqrt(x^2+y^2)
}
hypothanus(3,4)
hypothanus(y=25,x=7)

formals(hypothanus) ### returns the arguments of the fxn
args(hypothanus)

### a formula to standardise de fxn #########
normalise<-function(x,m=mean(x),s=sd(x)){ ## with 3 arguments
  (x-m)/(s) ### what to do with the argument
}
nomalized<-normalise(c(1,3,6,10,1,5)) ## parameters of the formula
mean(nomalized)
var(nomalized)

price<-c(1,3,6,10,15,45)
data.frame(price,nomalized)  ## tabulated x and normalized

normalise(c(6,5,6,7,9,NA)) #### when it contains missing it returns missing
### values through out

#### here we pass a fxn to remove the missing values
normalise(c(6, 5, 6, NA),na.rm=T)

#### passing fxns to and from other fxns
### note : do.call and rbind fxns are used together mostly
do.call(hypothanus, list(x = 3, y = 3))
### the fxn created together with list

## using rbind with do.call
dfr1<-data.frame(x = 1:5, y = rt(5,1))
dfr2<-data.frame(x = 6:10, y = rf(5,1,1))
dfr2<-data.frame(x = 11:15, y = rbeta(5,1,1))
do.call(rbind, list(dfr1,dfr2,dfr2)) ### put the data frames into rows

x_plus_y<-function(x,y){
  x+y
}
do.call(x_plus_y, list(1:5,5:1)) ## add the values contained in the list

##### gettting data 
library(survival)
??kidney ## obtain details of the data frame
kidney
View(head(kidney))

###inputing data from the keybord ############
mydata<-data.frame(age=numeric(0), gender=character(0), 
                   weight=numeric(0))  #### gives the user spreadsheet for data entry.
mydata<-edit(mydata)
fix(mydata) ### for edit my data

vids<-read.csv(choose.files(), header = TRUE) 

str(vids)
length(vids)
View(vids)
vid<- vids[-c(1),(2:4)]

install.packages("RODBC") ### install package
??RODBC
mode(vids) ### how an object is stored

######## ploting ########
pdf("mygraph.pdf")
attach(mtcars)
plot(wt,mpg)
l.m<-lm(mpg~wt)
abline(l.m)
title("regression of mpg on weight")
graphics.off()

m<-matrix(c(1,0, 
         0,1), nrow = 2)
t(m)

dose<-c(20,30,40,45,60)
drugA<-c(16,20,27,40,50)
drugB<-c(15,18,25,31,40)

myv<-c(dose,drugA,drugB)
mym<-matrix(myv, nrow = 5)

colnames(mym)<-c("Dosage","Response to drug A", "Response to Drug b")

### plot of Drug A and Drug B on one Graph ####
plot(dose, drugA, 
      type = "b", pch =17, col= 2, 
     main = "clinical trial for Drug A", 
     sub = "This is a hypothetical data") ## type connects the dots 
lines(dose, drugB, col= 4, type= "b", pch= 17)

##### Adding text to plots ####
attach(mtcars)
plot(wt, mpg, main = "mileage vs car weight", 
     xlab = "weight", ylab = "mileage", pch = 18, col = "blue")

text(wt, mpg, 
     row.names(mtcars), cex = 0.6, pose = 4, 
     col= "yellow")
detach(mtcars)

#### BASIC DATA MANAGEMENT ###############
manager<-c(1,2,3,4,5)
date<-c("10/24/08", "10/28/08", "10/01/08", "10/12/08", "10/24/08")
country<-c("US", "US", "UK","UK","UK")
gender<-c("M","F", "F","M","F")
age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)

leadership<-data.frame(manager,date,country,gender,
                       age,q1,q2,q3,q4,q5, stringsAsFactors = FALSE)
View(leadership)

myda<-data.frame(x1 = c(2,2,6,4), 
                 x2 = c(3,5,5,8))

myda1<-myda$x1+myda$x2
myda<-(myda$x1+myda$x2)/2

### changing continous variables into categorical variables #####

### here age cat is automatically added as a column

leadership$agecat[leadership$age>75]<-"elder"
leadership$agecat[leadership$age>=55 & leadership$age <=75]<-"middle age"
leadership$agecat[leadership$age<55]<-"young"

leadership<-within(leadership, { ## an alternative approach
  agecat<-NA ###asigned missing values to agecat when 
  ### some interval not met
  agecat[age > 75] <- "elder"
  agecat[age >= 55 & age <= 75] <- "middle aged" 
  agecat[age < 55]<- "young"
  ### when a particular condition is not met it will return NA
  } )   
leadership$age[leadership$age==99] <- NA ## within the age column  
### assign NA to age 99

################### renaming variables ##############
### to do this we can invoke the reshape package or use the fix fxn
library(reshape)
leadership <- rename(leadership,
                     c(manager="managerID", date="testDate")
)

edit(leadership) ## saves as new data
fix(leadership) ### gives u an interface to edit your data 
names(leadership) ### passes the names of the data in a vector
## in a vector format
dim(leadership) ### dimensions 
rownames(leadership)
colnames(leadership)

names(leadership) ###prints the labels of the data frame leadership in a vector 
# frame leadership in a vector means can perform vector manipulation.
names(leadership)[2]<-"testdate" ### changes date to test date
names(leadership)[6:10]<-c("item1", "item2", "item3", "item4", "item5")
## the above changes the q labels to item labels

########### missing values #############

### missing values are reprensented by NA = not available 
### NaN is also represented by "not a number"
 
is.na(leadership) ## tells us where missing values can be found ie
## a logical operator
is.na(leadership[,6:10]) ### focuses on the question section
is.null(leadership[,6:10])
#of the data set

x<-c(1,2,NA,4)
sum(x, na.rm = TRUE) ## removes the missing value
sum(x) ## missing values havent been removed hence returns NA

nwdt<-na.omit(leadership) ### automatically omits rows
## with missing values


################ subseting data from data frame 10/06/18 #################

newdat<-leadership[order(leadership$age),] ## prints age from lowest
## to highest

attach(leadership)
newdat<- leadership[order(item1, -age ),] ### minus indicates 
#decending order
detach(leadership)

newd<-leadership[,c(6:10)] ## subsetting leadership
myva<-paste("item",1:5,sep = "") ## perfroms the same fxn as the above
newd<-leadership[myva]

#### excluding variables
leadership[,-c(8:9)] ### excludes the 8th and 9th observations of columns
newda<-leadership[1:3,] ### selects rows 1 to 3

newda<-leadership[which(leadership$gender=="M" & leadership$age>30),]
## the above is also used in indexing data

### indexing by dates using the fxn which ###
attach(leadership)
leadership$testdate <- as.Date(leadership$testdate, "%m/%d/%y")
startdate <- as.Date("2008-01-01")
enddate <- as.Date("2009-10-31")

newdata <- leadership[which(leadership$testdate >= startdate &
                              leadership$testdate <= enddate),]

#### the subset fxn #####          
newd<-subset(leadership, age >= 35| age < 25,   #another way to subset
             select = c(item1,item2,item3,item4,item5)) 

newd<-subset(leadership, gender=="M" & age > 25,
             select=gender:item4) ##includes item1 to item4

subset(leadership, testdate>start | testdate<=end)

## subset by date
newd<-subset(leadership, leadership$testdate >= startdate & 
               leadership$testdate <= enddate, #another way to subset
             select = c(item1,item2,item3,item4,item5)) 

### the sample fxn ######
mysample<-leadership[sample(1:nrow(leadership), 3, replace = F),]
## important for sampling from large data set
?sample

############# sql ############
library(sqldf)
attach(mtcars)
install.packages("sqldf")
newdf <- sqldf("select * from mtcars where carb=1 order by mpg",
               row.names=TRUE)
## alternatively
subset(mtcars, carb==1)
subset(mtcars, carb==1, select = c(disp,hp)) ## subset from disp and hp

############# advanced data management 10/06/18 ##################
mydata<-data.frame(Sudent=character(0),Maths=numeric(0), science=numeric(0), 
                               English=numeric(0))

students<-c("John Davis", "Angela Williams", "Bullwinkle Moose",
            "David Jones", "Janice Markhammer", "Cheryl Cushing",
            "Reuven Ytzrhak", "Greg Knox", "Joel England",
            "Mary Rayburn")
maths<-c(502,600,412,358,495,512,410,625,573,522)
science<-c(95,99,80,82,75,85,80,95,89,86)
english<-c(25,22,18,15,20,28,15,30,27,18)
mydata<-data.frame(students,maths,science,english, stringsAsFactors = T)

z <- scale(mydata[,2:4])

score <- apply(z, 1, mean)# it means calc mean for each row or student
score <- apply(z, 2, mean) # it means calc mean for each columan or subject

## a vector giving the subscripts which the function will 
## be applied over. E.g., for a matrix 1 indicates rows
roster <- cbind(mydata, score)
mydata$score <- apply(z, 1, mean) #an alternative

y <- quantile(score, c(.8,.6,.4,.2)) # in any way it correct
y <- quantile(score, c(.2,.4,.6,.8)) 


#### converting the continous variables to categorical variables
## which in this case is the scores column of the data set
## here grade is automatically added as a column to the data set

roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

attach(roster)
name <- strsplit((students), " ") ## extracts first and last names
lastname <- sapply(name, "[", 2) ## puts last name in 2nd column
firstname <- sapply(name, "[", 1) ## puts first name in 1st column
roster <- cbind(firstname,lastname,roster[,-1])
detach(roster)
roster <- roster[order(lastname, firstname),]


#### writing formula for mean ###
x<-c(2,3,6,7,9) #### lengthy way
n<-length(x)
meanx<-sum(x)/n
css<-sum((x-meanx)^2)
sdx<-sqrt((css/n-1))
meanx
sdx

scale() ##it is used to standardize data sets

###### prob fxns #####
#d = density
#p = distribution function
#q = quantile function
#r = random generation (random deviates)

### ploting the normal dist
x<-pretty(c(-3,3), 30)
y<-dnorm(x)
plot(x,y,type="o",  xlab = "Normal deviates", 
     ylab = "Density", yaxs = "i")

qnorm(.9,mean = 500, sd = 100)
rnorm(50, mean = 50, sd = 10)
cv<-matrix(runif(12),nrow = 3) ## runif generates random 
#numbers from unif dist
log(cv)
round(mean(cv)) ### rounds it to the nearest whole number
mean(cv)

#### how to perform operations on rows and columns 
# of data sets using "apply"#
mydata<-matrix(rnorm(30), nrow = 6)
apply(mydata, 1, mean) ### calculates row means
apply(mydata, 2, mean) ### calculates column means

### the cat fxn works like the print fxn but dif exists

#### control flow 12/06/18 #########
### statements are mostly in braces ie {}
### the for condition executes a statement repeatedly 
### format of the "for condition"
###for(var in seq) {statement}

for(i in 1:10) {
  print("hello world")
}

  
#### the while executes a statement until a condition is not 
### longer true format: while(cond)statement

i<-10
while(i>0){
  print("hello world") ; i<-i-1 ## subtracts 1 from each loop in order 
  ### to gives just 10 loops else would keep on repeating
}

#### conditional execution #####
### with this a statement is executed or printed only 
### if a condition is met
# if-else

# 1 format for; if else
# {if (cond) statement
# if (cond) statement1 else statement2 }

if(is.character(grade)) grade<-as.factor(grade)
if(!is.factor(grade)) grade<- as.factor(grade) else{
  print("Already a factor")
} 

### 2 ifelse 
## is more compact than if-else
#format for ifelse
#ifelse(cond, statement1, statement2)

##prints for passed or failed when the condition is met in each case
ifelse(score > 0.5, print("passed"), print("failed"))

## With this when the condition is satisfied prints either 
#input or output
if(score > 0.5){
  print("passed")
}else{
  print("failed")
}

## an example of mine

outcome<-  ifelse(score > 0.5, "passed","failed") 
## the user requires an outcome

## prints a particular statement when a condition is met
outcome<- if(score > 0.5){
  print("failed")
}else if(y>5)
  print("passed")
}

## 3 using switch
## chooses statement based on a value of an expression

feeling<-c("sad","afraid")
for(i in feeling) 
  print(
    switch(i,
           happy = "i am glad u happy", 
           afraid= "nothing to fear",      ## silly example
           sad= "cheer up", 
           angry = "calm down"
           )
  )

### user wrritten fxn ###

## format: myfunction <- function(arg1, arg2, ... ){
#statements
#return(object) }
### myfunction(parameters)

### Data restructuring and Reshaping ###
cars<-mtcars[1:5,1:4]
t(cars) ## transpose of the data set 
str(mtcars)

options(digits = 3)
attach(mtcars)
aggdata<-aggregate(mtcars, by=list(cyl,gear), FUN = mean, na.rm = TRUE)
aggregate(mtcars$mpg, by = list(cyl,gear), FUN = mean) ## Practice
## gives summary statistics of the data set with 
#cylinder and gear as groups
str(aggdata)
dim(aggdata)
aggdata[,1:4]
names(aggdata)[1:2]<-c("cyl","gear") ## renamed groups 1 and 2 to 
## cyl and gear respectively

############ using the reshape parkage ##############
install.packages("reshape")
library(reshape)
x1<-c(5,6,3,2)
x2<-c(6,5,1,4)
time<-c(1,2,1,2)
ID<-c(1,1,2,2)
myd<-data.frame(ID,time,x1,x2)
md<-melt(myd, id=(c("ID", "time"))) ##data reshaped
cast(md, ID~variable, mean)
counts <- table(Arthritis$Improved)


############# R GRAPHS 14/06/18 ##############
install.packages("vcd")
library(vcd)
library(MASS)
counts <- table(Arthritis$Improved)
str(Arthritis$Improved)

## for categorical variables
smock<-rep("yes",23)
smock1<-rep("non",34)
smock2<-rep("dont know",25)
count<-c(smock, smock1, smock2)

##### 14/10/19

####If the categorical variable to be plotted is a factor or ordered factor,
##you can create a vertical bar plot quickly with the plot() function

plot(Arthritis$Improved, main="Simple Bar Plot",
     xlab="Improved", ylab="Frequency")
plot(Arthritis$Improved, horiz=TRUE, main="Horizontal Bar Plot",
     xlab="Frequency", ylab="Improved")

### my example  7/10/19
pie(count1, col = c(2,3,4)) ### my example  7/10/19

pie3D(count1,explode=0.0001,labels = c("yes","dont know","non"), 
      main="3D Pie Chart ", col = c(5,6,8)) ### my example  7/10/19

fan.plot(count1,labels = c("yes","dont know","non"), main="Fan Plot", col = c(2,3,4))

count1<-table(counts)
barplot(count1, xlab = "smocker", ylab = "frequency", 
      main = "simple bar plot", col = c(3,4,6), 
      horiz = F,legend = rownames(counts)) ## vertical

barplot(count1, xlab = "smocker", ylab = "frequency", 
        main = "simple bar plot", col = c(3,4,6), 
        horiz = T, width = 0.05, legend = rownames(counts)) ## horiz
?barplot

impr<-matrix(c(29,7,7, 
               13,7,21),  ncol = 2, nrow = 3)

colnames(impr)<-c("placebo","treated")
rownames(impr)<-c("none","some","marked")

library(vcd)
counts <- table(Arthritis$Improved, Arthritis$Treatment)

### for a matrix or data frame stacked and group barplot
barplot(counts, ###here beside is set false
        main = "stacked barplot", xlab = "treatment", 
        ylab = "frequency",col = c(5,2,3), legend = rownames(counts), 
        beside = F)

### for a matrix or data frame
barplot(counts, ## beside is set true
        main = "Grouped barplot", xlab = "treatment", 
        ylab = "frequency",col = c(5,2,3), legend = rownames(counts), 
        beside =T) 

##### Bar plot for sorted mean values 16/06/18 ####
states1<-data.frame(cbind(state.region, state.x77)) ### my example
states<-data.frame(state.region, state.x77)
View(states1)
table(state.region)
str(state.region)


means<-aggregate(states1$Illiteracy, ## data set to be colapsed
                 by=list(state.region), ## vector to be colapsed
                 FUN = mean) ## the scalar operation


means <- means[order(means$x),] ## sorts from lowest to highest
barplot(means$x,names.arg = means$Group.1, ### adds names to each bar
        main = "Mean Illiteracy Rate", col = c(4,6,11,10),
        ylab = "AVERAGE RATE")

###Spinograms
library(vcd)
attach(Arthritis)
counts <- table(Treatment, Improved)
aa<-xtabs(~Treatment+Improved, data =Arthritis ) ## an alternative
spine(counts, main="Spinogram Example")
detach(Arthritis)

install.packages("plotrix")
library(plotrix)
par(mfrow=c(2,2))
slices<-c(10,12,4,16,8)
lbls <- c("US", "UK", "Australia", "Germany", "France")

pie(slices, labels = lbls, main = "simple pie chart")

fan.plot(slices, labels = lbls, main="Fan Plot")

pie3D(slices, labels=lbls,explode=0.2,
     main="3D Pie Chart ") 
graphics.off()
??pie3D
### histogram with rug plot and frame ###

### quantitative variable 
par(mfrow=c(2,2))


sd(mtcars$mpg)

summary(mtcars$mpg)
library(psych)

kurtosi(mtcars$mpg)
skew(mtcars$mpg)

hist(mtcars$mpg)

hist(mtcars$mpg,
     breaks=12, 
     col="red",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")

hist(mtcars$mpg,
     freq=FALSE, 
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col="blue", lwd=2)
box()
graphics.off()
##### histogram with a normal curve #####
x <- mtcars$mpg 
h<-hist(x,
        breaks=15,
        col="red",
        xlab="Miles Per Gallon",
        main="Histogram with normal curve and box")
xfit<-seq(min(x), max(x), length=40)
yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=3)
box()
?seq
?dnorm
?diff
### kernel density plot ####

par(mfrow=c(1:2))
dd<-plot(density(mtcars$mpg))

d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
rug(mtcars$mpg, col="brown")
graphics.off()

##### comparative density plot####
### distribution of of mile per gallon of cars with 8 cyl, 6cy and 4cyl

par(lwd=2)
library(sm)
install.packages("sm")
attach(mtcars)
length(cyl.f)
cyl.f <- factor(cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", 
                           "8 cylinder"))
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
colfill<-c(2:(1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)
detach(mtcars)
graphics.off()

###basic stats
library(doBy)
summaryBy(mpg~am, data=mtcars, FUN=mystats)
summaryBy(mpg~cyl, data=mtcars, FUN=mystats)


################# box plots 17/06/18 ################

boxplot(mtcars$mpg, main = "box plot", ylab = "miles per gallon")
ass<-boxplot.stats(mtcars$mpg) ## gives statistics from the box plot
ass$stats ## since the stats is in a list
ass[[3]]
hist(mtcars$mpg) ## the types of skewness
plot(mtcars$mpg~cyl) ##checking the spread by group

##### using box plots to compare groups ####

boxplot.stats(mtcars$mpg) ## five num summary

hist(mtcars$mpg) #comparison with box plot

boxplot(mtcars$mpg, main="Box plot", ylab="Miles per Gallon")

library(doBy)
summaryBy(mpg~am, data=mtcars, FUN=mystats)
summaryBy(mpg~cyl, data=mtcars, FUN=mystats)

boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

boxplot(mpg~cyl, data = mtcars, 
        notch=TRUE, 
        varwidth=T, 
        col="red", 
        main = "cars mileage data", 
        xlab = "number of cylinders",
        ylab = "miles per gallon")

#### factors are for categorical variables

#### box plot for crossed factors #######

mtcars
mtcars$cyl.f<-factor(mtcars$cyl, 
                     levels = c(4,6,8), 
                     labels = c("4 cylinders", "cylinders 6", "8 cylinders"))

mtcars$am.f<-factor(mtcars$am, 
                    levels = c(0,1), 
                    labels = c("auto", "standard"))
# auto = 0, standard = 1

boxplot(mpg~am.f*cyl.f, 
        data = mtcars, varwidth = T, 
        col=c("gold","darkgreen"),
        main="MPG Distribution by Auto Type",
        xlab="Auto Type")

library(reshape) ## the above graph with it statistic
### summmary by group(categorical var)
dstats <- function(x)(c(n=length(x), mean=mean(x), sd=sd(x)))

#### the above is a formula that holds both mean, sd and data size

dfm <- melt(mtcars, measure.var=c("mpg"), 
            id.var=c("am", "cyl"))
cast(dfm, am + cyl + variable ~ ., dstats)


####### Violin plots
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]

vioplot(x1, x2, x3,
        names=c("4 cyl", "6 cyl", "8 cyl"),
        col="gold")
title("Violin Plots of Miles Per Gallon")


attach(mtcars)
### an alternative approch to subset
subset(mpg, cyl==4) 
subset(mpg, cyl==6)
subset(mpg, cyl==8)

###### Dot Plots ######
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=.7, ## the of char 
         ## within the graph
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")

x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"

dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon") ###\n = next line

################ Basic Statistics ####################
var<-c("mpg", "hp", "wt") ### subseting mpg, hp and wt from mtcars
head(mtcars[var])          ## usig a vector
summary(head(mtcars[var]))

############### formulae for skewness and kurtosis via sapply fxn #######
mystats <- function(x, na.omit=FALSE){
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return(c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

sapply(mtcars[var], mystats) ## sapply fxn passes the formula 
#over the mtcars[var]

#### the Hmisc package ####
library(Hmisc)
install.packages("Hmisc")
describe(mtcars[var])

##### the pastec function ####
library(pastecs)
install.packages("pastecs")
stat.desc(mtcars[var], norm = T)

#### the psych package  #####
library(psych)
install.packages("psych")
describe(mtcars[var])

##### Descriptive statistics by group #########
by=list(cyl=mtcars$cyl, am=mtcars$am)
aggregate(mtcars[var], by, mean) ## my example 06/10/19
### mostly the aggre fxn does the aggregation over a categorical variables

aggregate(mtcars[var], by = list(am=mtcars$am), mean) ## aggregate mostly used over 
# an odered categorical variable
aggregate(mtcars[var], by = list(cylinders=mtcars$cyl), mean) ## aggregate mostly used over 

install.packages("doBy")
### summmary by group(categorical var) 6/10/19 ######
library(doBy)
summaryBy(mpg+hp+wt~am, data=mtcars, FUN=mystats)
summaryBy(mpg+hp+wt~cyl, data=mtcars, FUN=mystats)

library(psych) ## variabeles are described based on sub groups ie number of cylinders
describeBy(mtcars[var], mtcars$cyl) ## stats described with respect to cyl
describeBy(mtcars[var], mtcars$am) ## stats described with respect to am

library(reshape)
### summmary by group(categorical var)
dstats <- function(x)(c(n=length(x), mean=mean(x), sd=sd(x)))
#### the above is a formula that holds both mean, sd and data size
dfm <- melt(mtcars, measure.var=c("mpg", "hp", "wt"), 
            id.var=c("am", "cyl"))
cast(dfm, am + cyl + variable ~ ., dstats)
str(mtcars)
############## examinaton of categorical variables ####################
library(vcd)
install.packages("vcd")
attach(Arthritis)
View(Arthritis)
table(Arthritis$Sex)
str(Arthritis)
head(Arthritis) ##inspection
myta<- with(Arthritis, table(Improved)) 

######## one way table #######
margin.table(myta) ## sums values from table
myta<-with(Arthritis, table(Improved)) ## the right way using 
# the with function

table(Arthritis[,5])  #### an alternative way of doing it
prop.table(myta) ###relative freq

library(ggplot2)
library(lattice)
dat<-c(rep('prop', 38),rep('no prop',22))
as<-prop.table(table(dat))*100
barchart(as ,xlab='%')
pie(as, col=c(2,5))


pie((prop.table(myta)*100)) ## pie chat of data
barplot(prop.table(myta)*100) ## barplot of data
addmargins(myta) ## adds a sum margin to table 

##### Two way table #####
table(Arthritis$Treatment,Arthritis$Improved)### anlternative

mytable <- xtabs(~ Treatment+Improved, data=Arthritis)## the right way
barplot(mytable)

as<-Arthritis[,2] #### an alternative way of doing it, example
asx<-Arthritis[,5]
table(data.frame(as,asx))

margin.table(mytable, 1) ## sums of those who recieved placebo
#and treatment
margin.table(mytable,2)

prop.table(mytable, 1)*100 ## propoertions for those who 
#received placebo and treatment
### 1 indicates the first variable in the table ie treatment
#### you can see that 51 percent of treated individuals had marked improvement
###  compared to 16 percent of those receiving a placebo

margin.table(mytable, 2) ## sums those who had none, some and marked

#### the index (2) refers to the second variable in the table() statement
prop.table(mytable, 2)*100
### 25% of marked improvement received placebo
## 69% of no improvement recieved placebo
### 30% of no improvement recieved treatemnt
## 75% of marked improvement recieved treatment
addmargins(mytable) ### adds to both row and column

######### for cell proportions #######
prop.table(mytable)*100
prop.table(mytable)

addmargins(prop.table(mytable))*100 ## adds a margin to the table

##### adding margins to tables ie row and col sum ######
addmargins(mytable)
### not specific
addmargins(prop.table(mytable)) ## proportion

###### add row sums to variable 1 #####
addmargins(prop.table(mytable, 1), 2) # proportions for treatment only which
### has the index 1 and sum of propotions produced at index 2
addmargins(prop.table(mytable, 1), 2)*100


###### column sums of variable 2#####
addmargins(prop.table(mytable, 2), 1) ## proportion
addmargins(prop.table(mytable, 2), 1)*100 #percentages

# proportions for treatment only which
### has the index 2 and sum of propotions produced at index 1

#### by default the table fxn ignores missing values, for it not 
### to ignore missing values include (useNA="ifany".) 

########## An alternative way of creating 2 way table #####
library(reshape)
data.1<-c(28,24,15,12,10,18,34,37,47,55,18,34,37,47,55)
age.1<-c(rep("t",3),rep("y",3),rep("k",3),rep("u",3),rep("y",3))
move<-c("d","c","m","d","c","m","d","c","m","d","c","m","d","c","m")
data.11<-data.frame(data.1,age.1,move)
as<-data.11[,2] #### an alternative way of doing it
asx<-data.11[,3]
table(data.frame(as,asx))
mytable <- xtabs(~ age.1+move, data=data.11) ## the right way


library(gmodels)
install.packages("gmodels")
CrossTable(Arthritis$Treatment, Arthritis$Improved, chisq = T,
            prop.r=TRUE)
?CrossTable
##### Three way table #####
mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
ftable(mytable) ### gives the table in a compact form

margin.table(mytable, 1) ## sums of treatment
margin.table(mytable, 2) ## sums of sexes 
margin.table(mytable, 3) ## sums of improved
margin.table(mytable, c(1, 3)) ## sums of treatment n sums of improved

#Improve proportions for Treatment and Sex
ftable(prop.table(mytable, c(1, 2)))*100
ftable(addmargins(prop.table(mytable, c(1, 2)), 3)) ## 3 indicates sum 
### sum for improve proportions

##### for percentages 
options(digits = 6)
ftable(addmargins(prop.table(mytable, c(1, 2)), 3))*100

###### Tests of independence #######
# USING CHI SQUARE ##
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)## the right way
chisq.test(mytable) ### result shows that level improvement depends on 
### level of treatment i.e considering improvement and treatment

mytable <- xtabs(~Improved+Sex, data=Arthritis)
chisq.test(mytable) ### result shows that level improvement 
### has nothing to do with gender hence independent 
## i.e considering gender and imprvment

## FISHER'S EXACT TEST
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)## the right way
fisher.test(mytable)
##the fisher.test() function can be applied
##to any two-way table with two or more rows
##and columns, not a 2x2 table.

## COCHRAN-MANTEL-HAENSZEL TEST
####The following code tests the hypothesis that Treatment 
##and Improved variables are independent within each level Sex

mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
###null hypothesis that two nominal variables are 
##conditionally independent
#in each stratum of a third variable

## alternate hypothesis  treatment received and the improvement 
##reported aren't
##independent within each level of sex 

mantelhaen.test(mytable) ## treatment received and the 
#improvement reported aren't
#independent within each level of sex 


###### Measures of association #####
library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
assocstats(mytable) ##shows a strong relationship between level of 
## improvement and treatment

#####Converting a table into a flat file via table2flat
table2flat <- function(mytable) {
  df <- as.data.frame(mytable)
  rows <- dim(df)[1]
  cols <- dim(df)[2]
  x <- NULL
  for (i in 1:rows){
    for (j in 1:df$Freq[i]){row <- df[i,c(1:(cols-1))]
    x <- rbind(x,row)
    }
  }
  row.names(x)<-c(1:dim(x)[1])
  return(x)
}

############## examinaton of Quantitative variables #################
states<- state.x77[,1:6]
View(state)
cov(state) #### produces variances
cor(states)
cor(states, method = "pearson") ## pearson correlation
cor(states, method = "spearman") ## spearman correlation
#### the above results for correlation produces a sqaure a matrix

## for non squre matrix use the codes below
x<-states[,c("Population", "Income", "Illiteracy", "HS Grad")]
y<-states[,c("Life Exp", "Murder")]
cor(x,y)

######## Testing correlations for significance ######
cor.test(states[,3], states[,5],  
         alternative = c("two.sided")) # test of sig between n
##murder rate and high school grad

### since pvalue < alpha value 
## hence cor between murder and high school grad is significant

####partial correlation 12/10/19
library(ggm)
# partial correlation of population and murder rate, controlling
# for income, illiteracy rate, and HS graduation rate
pcor(c(1,5,2,3,6), cov(states))

#####other types of cor
library(polycor)

#### correlation matrix and test of signifance ##
library(psych)
cts<-corr.test(states) ## prints both cor and significance
print(corr.p(cts$r,n=30),short=FALSE)  ## from normal theory
print(cor.ci(cts$r,n=30),short=FALSE) ## bootstrapped results

######Testing a correlation coefficient for significance
cor.test(states[,3], states[,5])

#### Correlation matrix and tests of significance via corr.test
library(psych)
corr.test(states, use="complete")
?r.test
#### independent t-test for 2 variables

#### A test to investigate whether there exist a sig dif between chances
## of imprisonment in the north and south using uscrime data set
##Are you more likely to be imprisoned if 
##you commit a crime in the South?
##The comparison of interest is Southern versus non-Southern states 
#### H0:u1=u2=...=Un
### H1: there exist a significat dif
library(MASS)
attach(UScrime)
str(UScrime)
View(UScrime)
subset(UScrime,So==1) ## subseting
agg<-aggregate(Prob, by=list(so=So),mean) ## mean imprison rate
y<-agg[order(agg$x),] ## 
## bar plot of the data
barplot(agg$x,names.arg = agg$so, col = c(2,5),
        main = toupper("mean imprisonment rate for north and south"), 
        ylab = "average rate")
 
t.test(Prob ~ So, data=UScrime)
summary(UScrime$Prob)
t.test(Prob, So) ## alternative but not running cos so is nominal both 
### must be numeric
### since pvalue is < alpha value we reject null hypothesis
## hence there exist a significant diff betwwen the means

##### Dependent t-test for 2 variables ######
library(MASS)
sapply(UScrime[c("U1", "U2")], function(x)(c(mean=mean(x), sd=sd(x), 
n=length(x), var = sqrt(sd(x)))))

####h0:U1m=U2m
####h1:U1m!=U2m
with(UScrime, t.test(U1, U2, paired=TRUE)) 
#### U1 AND U2 are quantitave var
### we reject the null hypothesis hence there exist a 
### sig diff


##### NON PARA: Assessing if observations are ind identically distributed(iid) ###
#if assumptons under anova and t test are not met we turn to other tests
## example: Wilcoxon rank sum test i.e  Mann-Whitney U test

###### independent Mann-Whitney U test (Non parametric test) ####
with(UScrime, by(Prob, So, median)) ### test mostly hinged on median
### so is a categorical var
wilcox.test(Prob ~ So, data=UScrime)
### we reject the null hypothesis

#independent Mann-Whitney U test (Non parametric test)
sapply(UScrime[c("U1", "U2")], median) ## prints median for u1 and u2 
## sapply was used other than with cos u1 and u2 are quantive var
with(UScrime, wilcox.test(U1, U2, paired=TRUE))
## we reject the null hypothesis

#### comaprng ilitracy rate in 
## Northeast, South, North Central, and West A cate var ###
states <- as.data.frame(cbind(state.region, state.x77))
states1 <- data.frame(state.region, state.x77)
class(states1)

table(state.region)
str(state.region)
View(state.region)
length(states$Income)
length(state.region)
kruskal.test(Illiteracy ~ state.region, data=states1)
## we reject the nul hypothesis i.e illiteracy rate is diff in the 
## 4 regions

######## Nonparametric multiple comparisons ######
class <- state.region
var <- state.x77[,c("Illiteracy")]
mydata <- as.data.frame(cbind(class, var))
rm(class, var)
library(npmr)
summary(npmr(mydata), type="BF")

qnorm(0.05, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(0.025, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)

l
###### Regression Analysis ######
xx11<-cabbages[,(3:4)]
cor(xx11)
plot(xx11)
attach(xx11)
xx.cc<-lm(VitC~HeadWt)
summary(xx.cc)
confint(xx.cc)
length(HeadWt)

attach(ChickWeight)
c.lm<-lm(weight~factor(Diet))
anova(c.lm)
length(Time)


qf(0.05, 2, 9,lower.tail = F)
qt(0.025, 9,lower.tail = F)
qchisq(0.95,16,lower.tail = F)
yy<-c(102,90,95,92,95,98,100,94,98,95,88,96)
x1<-c(5,2,4,2.5,3,3.5,2.5,3,4,1.5,1.8,4)
x2<-c(1.5,2,1.5,2.5,3.3,2.3,4.2,2.5,2,0.5,1,2)
lm.x1<-lm(yy~x1+x2)
summary(lm.x1)
confint(lm.x1)

plot(x,y)
x<-c(20,24,30,28,22,24,21,23)
y<-c(98,102,110,108,100,104,101,102)
data.fr<-data.frame(ag=x,SBP=y)
data.lm<-lm(y~x, data = data.fr)
summary(data.lm)
confint(data.lm)
par(mfrow=c(2,2))
 graphics.off
qf(0.05,1,7,lower.tail = F)
qt(0.025,7, lower.tail = F)
?predict


## Regression with least sqaures i.e simple linear regression.
## Y=Bo+Bx+ei population parameter
### predict weight from height (weight~height)
attach(women)
str(women)
View(women)
?lm
fit<-lm(weight~height, data = women) ##weight explained by height
?lm
summary(fit)
women$weight ## Y actual values
fitted(fit) ## Y^(yhat) predicted values
residuals(fit) ## the erors between the predited ;
##values and actual values

plot(women$height,women$weight,  
     xlab="Height (in inches)",
     ylab="Weight (in pounds)")
lines(women$height, fitted(fit)) # same as abline
abline(fit) ### most of the point are close to the line hence matches 
#Rsquared result from the summary statistics
#### Height = 87.523+45×Height = prediction equation

###The plot suggests that you might be able to improve on 
#the prediction by using a
#line with one bend hence polymomial regression

#### Polynomial regression i.e improved model of weight on height
fit2<-lm(weight~height+I(height^2), data = women)
summary(fit2)
residuals(fit2)
plot(women$height,women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
lines(women$height, fitted(fit2)) ### use this approach 
#instead of abline
#to plot the line since the abline is used 
##in ploting lines on scater not curves 
## of best fit when it involves polynomial regression
#prediction equation: weight=261.87818 - 7.34832*height + 0.08height^2

fit3 <- lm(weight ~ height + I(height^2) +I(height^3), data=women)
summary(fit3)
par(mfrow=c(2,2))
plot(women$height,women$weight, 
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
newfit <- lm(weight~ height + I(height^2), data=women[-c(13,15),])
### 13 and 15 are some are extreme outliers 
summary(newfit)
par(mfrow=c(2,2)) ### diagnostics for the model
plot(newfit)
graphics.off()

#### the scatter plot function for bivariate relationship
### the graph gives us an information as to whether a curve or line fits
## our linear model
library(car)
scatterplot(weight~height, data = women, 
            spread=F, lty.smooth=1,
            pch=19, 
            main="Women Age 30-39",
            xlab="Height (inches)",
            ylab="Weight (lbs.)")
### since the two graphs are roughly symmetric, hence a curved line wil
## better fit the data better than a line

## Multiple linear regression
### exploring relationship between murder rate and population, 
#illiteracy rate, average income, and frost levels (mean
#number of days below freezing)

## since the variables of interest are found in the state.x77 data set 
## we have to subset

state<-data.frame(state.x77[,c("Murder", "Population",
"Illiteracy", "Income", "Frost")])
View(state)

dimnames(state.x77) ## names of the dimension of the data set
str(state.x77)
dat<-(state.x77[,c(5,1,3,2,7)])
# ## both dat and state data sets give same output
options(digits = 3)
cor(state)

library(psych)
corr.test(state, ci = T)

#### scatter plots of the regression variables
library(car)
scatterplotMatrix(state, spread=F, lty.smooth=2, 
                  main="Scatter Plot Matrix")
### A model for the variables
q<-as.data.frame(state.x77)
View(q)
attach(q)

fit4<-lm(Murder ~ Population,
         data=state)
summary(fit4)
residuals(fit4)

fit5<-lm(Murder ~ Population + Illiteracy + Income + Frost,
         data=state)
residuals(fit5)

summary(fit5)
fit5<-lm(Murder ~ 1,
         data=state)
anova(fit4,fit5)
summary(fit4)
confint(fit4)
qf(0.05, 3, 347)


fit7<-lm(Illiteracy ~ Population + Income + Frost, data=state)
summary(fit7)
   ################ my example, contribution of ind variables 9/18/19 ########
#### x1
fit5<-lm(Murder ~ Population, data=state)
summary(fit5)

## x2/x1
fit6<-lm(Murder ~ Population + Illiteracy, data=state)
summary(fit6)
confint(fit6)
#### x3/x1,x2
fit7<-lm(Murder ~ Population + Illiteracy + Income, data=state)
summary(fit7)
qt(0.025,48, lower.tail = F)
###### x3
fit8<-lm(Murder ~ Income, data=state)
summary(fit8)
vif(fit7)

length(state$Murder)
summary(fit4)
confint(fit4)
residuals(fit4)
fitted(fit4)
options(digits = 2)
qt(0.025,45, lower.tail = F, log.p = FALSE)
## Multiple linear regression with interactions
attach(mtcars)
fit<-lm(mpg ~ hp+wt+hp:wt, data = mtcars)
summary(fit)
confint(fit)
### Our model for predicting mpg is 
#mpg=49.81-0.12×hp-8.22×wt+0.03×hp×wt
library(effects)
plot(effect("hp:wt", fit,
            list(wt=c(2.2,3.2,4.2, complete = FALSE))))
?effects

### Regression diagnostics#####################
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, 
          data=state)
confint(fit) ### prints population confidence intervals for 
## for comparing the estimates
par(mfrow=c(2,2))
plot(fit)
summary(fit)
graphics.off()


### testing assumptions for height and weight
## means we testing for Normality, Independence, Linearity
#and Homoscedasticity
fit <- lm(weight ~ height, data=women)
par(mfrow=c(2,2))
plot(fit)

## for normality : since the points are all not on the 45 degree line 
## hence normality assmption violated from normal   Q-Q plot

## linearity : also violated since residuals vs fitted produce a 
## a curve instead of a line, this suggests we add a quadratic term
## to the model

## Homoscedasticity:  the points in
# the Scale-Location graph (bottom left) should be a 
# random band around a horizontal line.

### Diagnostic plots for the regression of weight on height
# and height-squared
fit2 <- lm(weight ~ height + I(height^2), data=women)
par(mfrow=c(2,2))
plot(fit2)
### outlier deleted
newfit <- lm(weight~ height + I(height^2), data=women[-c(13,15),])
plot(newfit)


## Diagnostic plots for the regression of murder rate 
# on state characteristics
options(digits = 2)
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, 
          data=state)
fit <- lm(Population ~  Illiteracy + Income + Frost, 
          data=state)
summary(fit)

summary(fit)
confint(fit)
par(mfrow=c(2,2))
plot(fit)

plot(fitted(fit),residuals(fit))#### plot for inpsecting constant variance
plot(fitted(fit), rstudent(fit))#### plot for inpsecting constant variance
length(residuals(fit))
plot(seq(1,50,1),residuals(fit))
plot(state$Murder,residuals(fit))
graphics.off()
qt(0.025, df=43)

## An enhanced approach for diagnostic test
### testing (normality) using the qqplot from the car package

library(car)
View(states) # inspecting data set
??state.x77 ### ??gives us more information about the data set
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, 
          data=state)
##### testing normality assumption
qqPlot(fit, labels=row.names(states), id.method="identify",
       simulate=TRUE, main="Q-Q Plot")

##### from the graph nevada has a large positive residual
## it means  that the model underestimates 
## the murder rate in this state.
state["Nevada",]
fitted(fit)["Nevada"] ### prediction from the model
rstudent(fit)["Nevada"] ## an alternative approach for fitted or 
## in other words corrected fit
residuals(fit)["Nevada"] ## ERROR term for nevada

##### Function for plotting studentized residuals 15/07/18 ####
## normality of error terms

residplot <- function(fit, nbreaks=10) {
  z <- rstudent(fit)
  hist(z, breaks=nbreaks, freq=FALSE,
       xlab="Studentized Residual",
       main="Distribution of Errors")
  rug(jitter(z), col="brown")
  curve(dnorm(x, mean=mean(z), sd=sd(z)),
        add=TRUE, col="blue", lwd=2)
  lines(density(z)$x, density(z)$y,
        col="red", lwd=2, lty=2)
  legend("topright",
         legend = c( "Normal Curve", "Kernel Density Curve"),
         lty=1:2, col=c("blue","red"), cex=.7)
}
residplot(fit)
residuals(fit)
plot(density(residuals(fit))) ## an alternative approach
#  of testing normality
### ERROR terms are quite normally distributed

### Independence of error terms
durbinWatsonTest(fit)
## INDEPENDENCE OF ERRORS
# Ho: rho = 0
# H1: rho ! = 0  rho = autocorellation 

# p-value (p=0.282) suggests a lack of autocorrelation, and conversely
## the p value > the alpha valuue hence we fail to reject Ho
# an independence of errors. 

## LINEARITY
library(car)
crPlots(fit)

## linearity assumptions met
## since the broken lines are quite straight

## HOMOSCEDASTICITY = constant variance of error terms
library(car)
ncvTest(fit)
## produces a score test of the hypothesis of constant
# error variance against the alternative that the error 
# variance changes with the level of
# the fitted values.

## We fail to reject the null hypothesis hence the error terms have
## constant variability

# Spread-level 
# plot for assessing constant
#error variance

## the function below plots fitted values against residuals 
## also tells us about contant variance
spreadLevelPlot(fit)

# The suggested power
# transformation in listing 8.7 is the 
# suggested power p (Y p) that would stabilize the
# nonconstant error variance.

## Global validation of linear model assumptions
install.packages("gvlma")
library(gvlma)
gvm<-gvlma(fit)
summary(gvm)
## If the decision line had
# indicated that the assumptions were violated

# you'd have had to explore
# the data set to see which assumptions were violated
 
### perform this test  first b4 the diagnostic test

#### Multicollinearity #####
options(digits = 2)
library(car)
vif(fit)
sqrt(vif(fit)) > 2
# The results indicate that multicollinearity isn't a problem 
#with our predictor variables

######### End of diagnostics ############

# Unusual observations
## here we looking at  outliers, high-leverage observations, 
# and influential observations.

# 1 outliers
library(car)
outlierTest(fit)
?outlierTest
### it means nevada is an outlier among the data set
## hence requires deletion

# 2 High leverage points
## we looking at outliers with regards to the predictor varaibles 
## i.e the explanatory variables
## response var not included

hat.plot <- function(fit) {
  p <- length(coefficients(fit))
  n <- length(fitted(fit))
  plot(hatvalues(fit), main="Index Plot of Hat Values")
  abline(h=c(2,3)*p/n, col="red", lty=2)
  identify(1:n, hatvalues(fit), names(hatvalues(fit)))
}
hat.plot(fit)
View(state)
## Influential observations
?nrow
#  Imagine finding that your model 
# changes dramatically with the removal of 
# a single observation. It's this concern that leads you to examine
# your data for influential points.
# formula 4/(n-k-1)

cutoff <- 4/(nrow(state)-length(fit$coefficients)-2)
plot(fit, which=4, cook.levels=cutoff)
abline(h=cutoff, lty=2, col="red")
?plot
# The graph identifies Alaska, Hawaii, and Nevada as 
# influential observations.

#Added-variable plots for assessing the impact of influential
#observations 
## this plot tells us more about influential observation.

# For one response variable and k predictor variables
library(car)
avPlots(fit, ask=FALSE, onepage=TRUE, id.method="identify")

# You can combine the information from 
# outlier, leverage, and influence plots

library(car)
influencePlot(fit, id.method="identify", main="Influence Plot",
              sub="Circle size is proportional to Cook's distance")

# The resulting plot shows that 
# Nevada and Rhode Island are outliers; New
# York, California, Hawaii, and Washington have 
# high leverage; and Nevada, Alaska, and
# Hawaii are influential observations.

## how to read graph

#Influence plot. States above +2 or below -2 on the vertical axis
#are considered outliers. States above 0.2 or 0.3 on 
#the horizontal axis have high
#leverage (unusual combinations of predictor values). 
#Circle size is proportional
#to influence. Observations depicted by large circles 
#may have disproportionate
#influence on the parameters estimates of the model.

###### Corrective measures #######

 #four approaches to dealing with
 #violations of regression assumptions:

 #Deleting observations
 #Transforming variables
 #Adding or deleting variables
 #Using another regression approach

# Box-Cox transformation to normality
library(car)
summary(powerTransform(states$Murder))
### murder is the dependent variable of the model

# hypothesis that l=1 can't be
# rejected (p = 0.145), so there's no strong 
# evidence that a transformation is actually
# needed in this case. 

# When the assumption of linearity is violated,
# a transformation of the predictor
# variables can often help.
# for this we use variables that are signifcant with the model.
library(car)
summary(powerTransform(state$Murder))
boxTidwell(Murder~Population+Illiteracy,data=state) ##for linerarity asssumption

#The results suggest trying the transformations Population 
#and Illiteracy to
#achieve greater linearity. But the score tests 
#for Population (p = .75) and Illiteracy (p = .54) hence no trans required

#### Trying a different approach ####

## when one want to deal with the problem of multicolinearity try 
## ridge regression in this case

## If there are outliers and/or influential observations
##  you could fit a robust regression model rather than an OLS regression.

## If you've violated the normality assumption
## you can fit a nonparametric regression model

## If there's significant nonlinearity, 
## you can try a nonlinear regression model.

#### Comparing models #####

#Comparing nested models using the anova() function
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=state)
summary(fit1)
fit2 <- lm(Murder ~ Population + Illiteracy, data=state)
anova(fit1, fit2)
summary(fit1)
summary(fit2)

##we conclude that they don't
#add to the linear prediction and we're justified in dropping them from our model.
## significant with regards to the model(income and frost)

#Comparing models with the AIC
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=state)
fit2 <- lm(Murder ~ Population + Illiteracy, data=state)
AIC(fit1, fit2)
#Models with smaller AIC values-indicating
#adequate fit with fewer parameters-are preferred. 
#the results confirms droping the income and frost from the model.

#Comparing two models is relatively straightforward, but what do you do when there
#are four, or ten, or a hundred possible models to consider?
#That's the topic of the next
section

####  Variable selection ####
library(MASS)
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=state)
stepAIC(fit1, direction="backward")
stepAIC(fit1, direction='backward')

#Stepwise regression is controversial. 
#Although it may find a good model, there's no
#guarantee that it will find the best
# model. This is because not every possible model is
#evaluated. An approach that attempts
#to overcome this limitation is all subsets regression.

###### ALL SUBSETS REGRESSION #####
#For example, if nbest=2, the two best one-predictor
#models are displayed, followed by the two best two-predictor models,
#followed by the
#two best three-predictor models, up to a model with all predictors.

install.packages("leaps")
library(leaps)
leaps <-regsubsets(Murder ~ Population + Illiteracy + Income +
                     Frost, data=state, nbest=4)
plot(leaps, scale="adjr2")
# The graph suggests that the two-predictor model (Population
# and Illiteracy) is the best.

#Better models will fall close to a line with intercept 1 and slope 1. 
library(car)
subsets(leaps, statistic="cp",
        main="Cp Plot for All Subsets Regression")
abline(1,1,lty=2,col="red")
## A well-fitting model that doesn't
##make sense doesn't help you. Ultimately, it's your
##knowledge of the subject matter that should guide you.

######## Taking the analysis further ############
#Cross-validation
# accessing the performance of a model with new data set ie generability.
install.packages("bootstrap")
library(bootstrap)
shrinkage <- function(fit, k=10){
  require(bootstrap)
  theta.fit <- function(x,y){lsfit(x,y)}
  theta.predict <- function(fit,x){cbind(1,x)%*%fit$coef}
  x <- fit$model[,2:ncol(fit$model)]
  y <- fit$model[,1]
  results <- crossval(x, y, theta.fit, theta.predict, ngroup=k)
  r2 <- cor(y, fit$fitted.values)^2
  r2cv <- cor(y, results$cv.fit)^2
  cat("Original R-square =", r2, "\n")
  cat(k, "Fold Cross-Validated R-square =", r2cv, "\n")
  cat("Change =", r2-r2cv, "\n")
}
  
fit <- lm(Murder ~ Population + Income + Illiteracy + Frost, data=state)
shrinkage(fit)

# cross val function for var selection
fit2 <- lm(Murder~Population+Illiteracy,data=state)
shrinkage(fit2)
# a model with two predictors
# (Population and Illiteracy) shows less R-square shrinkage 
# (.03 versus .12) than the full  model

#Relative importance
## here we want to know how much each predictor is contributing to our model
#  ch predictor variable is important with reagards to the other
# this section looks at which predictor variable is very important 
# if the researchers aim is basically prediction

#Note that because
#the scale() function returns a matrix and the 
#lm() function requires a data frame,
#you convert between the two in an intermediate step)

options(digits = 2)
zstates<-as.data.frame(scale(state)) ## standardised data set
zfit <- lm(Murder~Population + Income + Illiteracy + Frost, data=zstates)
coef(zfit)
#Using standardized regression coefficients as our guide, Illiteracy is the
#most important predictor and Frost is the least.

## An alternative approach for checking important predictor variable
relweights <- function(fit,...){
  R <- cor(fit$model)
  nvar <- ncol(R)
  rxx <- R[2:nvar, 2:nvar]
  rxy <- R[2:nvar, 1]
  svd <- eigen(rxx)
  evec <- svd$vectors
  ev <- svd$values
  delta <- diag(sqrt(ev))
  lambda <- evec %*% delta %*% t(evec)
  lambdasq <- lambda ^ 2
  beta <- solve(lambda) %*% rxy
  rsquare <- colSums(beta ^ 2)
  rawwgt <- lambdasq %*% beta ^ 2
  import <- (rawwgt / rsquare) * 100
  lbls <- names(fit$model[2:nvar])
  rownames(import) <- lbls
  colnames(import) <- "Weights"
  barplot(t(import),names.arg=lbls,
          ylab="% of R-Square",
          xlab="Predictor Variables",
          main="Relative Importance of Predictor Variables",
          sub=paste("R-Square=", round(rsquare, digits=3)),
          ...)
  return(import)
}
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=state)
relweights(fit, col="lightgrey")
# Based on the method of relative weights, Illiteracy has 
# the greatest relative importance,
# followed by Frost, Population, and Income, in that order.

### Analysis Of variance #####
# Using R to model basic experimental designs

## One-way ANOVA
help(Anova, package="car")

install.packages("multcomp")
library(multcomp)
attach(cholesterol)
View(cholesterol)
table(trt)

aggregate(response, by=list(TRT=trt), FUN = mean) ##group means
aggregate(response, by=list(TRT=trt), FUN = sd)  ##group standard deviation
fit <- aov(response ~ trt) ## model of response explained by treatment
# since the p<alapha value we reject Ho.
# it provides evidence that the five treatments
# aren't all equally effective
summary(fit)

## plot of the result
installed.packages("gplots")
library(gplots)

#Treatment group means with 95 percent confidence intervals
#for five cholesterol-reducing drug regiments
plotmeans(response ~ trt, xlab="Treatment", ylab="Response",
          main="Mean Plot\nwith 95% CI")
detach(cholesterol)
detach("package:HH")

### pairwise comparison of the model (fit)
TukeyHSD(fit)
## Plot of Tukey HSD pairwise mean comparisons
par(las=2) ## rotates the labels of the x-axis
par(mar=c(5,8,4,2)) ## the with of the graph
plot(TukeyHSD(fit))

# Tukey HSD tests provided by the multcomp package
library(multcomp)
par(mar=c(5,4,6,2))
tuk <- glht(fit, linfct=mcp(trt="Tukey"))
plot(cld(tuk, level=.05),col="lightgrey")

# Groups (represented by box plots) that 
# have the same letter don't have significantly
# different means. 

# Assessing test assumptions
# assumptions under one way ANOVA
# 1the dependent variable is assumed to be normally distributed
# 2 have equal variance in each group. 

#1 Test of normality
library(car)
qqPlot(lm(response ~ trt, data=cholesterol),
       simulate=TRUE, main="Q-Q Plot", labels=FALSE)

#since data fall within the 95 percent confidence envelope 
#suggesting that the
#normality assumption has been met fairly well.

# 2 Test for equal variance in each group. 
bartlett.test(response ~ trt, data=cholesterol)

# Bartlett's test indicates that the variances
# in the five groups don't differ significantly

# test for outliers
library(car)
outlierTest(fit)

#from the output, you can see that there's no 
#indication of outliers in the cholesterol
#data (NA occurs when p > 1).



##### one way table ######

### anova
library(multcomp)
attach(cholesterol)
str(cholesterol)
table(trt)
fit <- aov(response ~ trt)

ass#### Experimental design 29/04/10 #########
### CRD Design
A<-c(31,28,39,42,36,30,NA)
B<-c(41,35,41,48,44,39,38)
C<-c(44,47,35,38,51,NA,NA)
UN<-c(1,2,3,4,5,6,7)
dit.ra<-data.frame(A,B,C,UN)
dit.ra1<-melt(dit.ra,id=(c("UN")))
attach(dit.ra1)
fit.ra1<-aov(value~variable)
summary(fit.ra1)

qchisq(0.01, df=11, lower.tail = F)
qf(0.05, 3, 6, lower.tail = F)

### ECONS
A<-c(3,6,7,4,5,9,5,NA,NA)
B<-c(10,12,11,14,18,12,9,15,13)
C<-c(8,3,6,5,9,10,8,NA,NA)
D<-c(9,10,9,12,8,10,NA,NA,NA)
NU<-c(1,2,3,4,5,6,7,8,9)
dit<-data.frame(A,B,C,D,NU)
dit1<-melt(dit,id=(c("NU")))
attach(dit1)
table(variable)
fit.dit<-aov(value~variable)
summary(fit.dit)

### stats methods example
qt(0.05, 8, lower.tail = F)
qchisq(0.975,14,lower.tail =F)
fcrit<-qf(0.05, df1=2, df2=57,lower.tail= F)
qf(0.025,9,11,lower.tail = F)
qnorm(0.025, mean = 0, sd = 1, lower.tail = F)
TukeyHSD(fit.dit,conf.level = 0.995)
par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD(fit.dit))
library(gplots)
plotmeans(value~variable, xlab="Treatment", ylab="Response",
          main="Mean Plot\nwith 995% CI", p=0.995)
library(car)
qqPlot(lm(value~variable, data=dit),  
       simulate=TRUE, main="Q-Q Plot",labels=FALSE)
qchisq(0.05, df=3, lower.tail = T)

library(reshape)
ID2<-c(1,2,3,4,5)
A<-c(77,81,71,76,80)
B<-c(72,58,74,66,70)
C<-c(76,85,82,80,77)
myda22<-data.frame(ID2,A,B,C)
MD2<-melt(myda22,id=(c("ID2"))) ### reshape the data
attach(MD2)
table(MD2$variable)

fit<-aov(MD2$value~MD2$variable)
summary(fit)
fcrit<-qf(0.01, df1=2, df2=12,lower.tail =FALSE)
### hence REJECT THE NULL THE HYPOTHESIS

### assessing the effective treatment
library(gplots)
?plotmeans
plotmeans(MD2$value~MD2$variable, xlab="Treatment", ylab="Response",
          main="Mean Plot\nwith 90% CI", p=0.90)
### THEREFORE TREATMENT C GIVES THE HIGHEST EFFECT AND CAN ALSO SEE FROM
## THE MEAN PLOT THAT 3 TREATMENT ARE NOT EFFECTIVE
## WE PROCEED TO PERFROM MULTIPLE COMPARISON

### POST HOC TEST
?TukeyHSD
TukeyHSD(fit,conf.level = 0.90)
par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD(fit))
### FROM THE PLOT AND TURKEYHSD WE CAN CONCLUDE THAT B-A AND C-B are
## where as C-B is not significant

### alt way of looking for sigdif trt
library(multcomp)
par(mar=c(5,4,6,2))
tuk <- glht(aov(MD2$value~MD2$variable), linfct=mcp(MD2$variable="Tukey"))
plot(cld(tuk, level=.01),col="lightgrey")

###### Assessing test assumptions
library(car)
qqPlot(lm(MD2$value~MD2$variable, data=MD2),  
       simulate=TRUE, main="Q-Q Plot",labels=FALSE)
####The data fall within the 95 percent confidence envelope, 
##suggesting that the
##normality assumption has been met fairly well.

### test for constance of variance
?bartlett.test
bartlett.test(MD2$value~MD2$variable, data=MD2)

### test for outliers
library(car)
outlierTest(fit)

### rcbd design 29/04/19

#### figure it out later (error)
t<-c("t1","t2","t3")
b<-c(1,2,3)
T1<-c(64,72,74)
T2<-c(55,57,47)
T3<-c(59,66,58)
T4<-c(58,57,53)
mydd<-data.frame(t,b,T1,T2,T3,T4)
MD22<-melt(mydd,id=(c("t","b"))) ### reshape the data
attach(MD22)
table(MD22$variable)
table(MD22$b)
fit11<-lm(MD22$value~MD22$variable)
anova(fit11)

### An alt way of doing rcbd (an easy way)
m<-c(64,72,74,55,57,47,59,66,58,58,57,53)
Tt<-c(rep("t1",3),rep("t2",3),rep("t3",3),rep("t4",3))
bb<-c("b1","b2","b3","b1","b1","b3","b1","b2","b3","b2","b2","b3")
mmdd<-data.frame(m,Tt,bb)
res2<-lm(m~Tt+bb,data = mmdd)
res3<-anova(res2)

### latin sqare Design
rw<-c(rep(1,5),rep(2,5),rep(3,5),rep(4,5),rep(5,5))
cl<-c("m","t","w","th","fri","m","t","w","th","fri","m","t","w","th","fri",
      "m","t","w","th","fri", "m","t","w","th","fri")
tr<-c("d","c","a","b","e","c","b","e","a","d","a","d","b","e","c","e","a", 
      "c","d","b","b","e","d","c","a")
value1<-c(18,17,14,21,17,13,34,21,16,15,7,29,32,27,13,17,13,24,31,25,21, 
          26,31,31,7)

df33<-data.frame(cl,tr,rw,value1)
value1.lm<-lm(value1~factor(cl)+factor(tr)+factor(rw))
anova(value1.lm)
### since the anova fxn evaluates at 5% by default
##but am calculating at 10%, there is the need to calculate at 10%
qf(0.01, df1=4, df2=12,lower.tail = F) ### CRITICAL VALUES

## ANOTHER EXAMPLE OF LATIN SQURE
r<-c(rep(1,3),rep(2,3),rep(3,3))
c<-c(1,2,3,1,2,3,1,2,3)
t<-c("d","o","n","n","d","o","o","n","d")
w<-c(51,119,60,98,43,31,99,87,49)
lm.w<-lm(w~factor(r)+factor(c)+factor(t))
anova(lm.w)
qf(.01, df1=2, df2=2,lower.tail =F ) ### fcrit

### another eXAMPLE LATIN SQ
x<-c(rep(1,4),rep(2,4),rep(3,4),rep(4,4))
y<-c(1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4)
z<-c(10,14,7,8,7,18,11,8,5,10,11,9,10,10,12,14)
tr<-c("c","d","a","b","b","c","d","a","a","b","c","d","d","a","b","c")
dat.44<-c(x,y,z)
lm.44<-lm(z~factor(x)+factor(y)+factor(tr))
anova(lm.44)
qf(.05, df1=3, df2=6,lower.tail  =F) ### fcrit
### Factorial design eg1
gen<-c(rep("f",18),rep("m",18))
t<-c(rep("a",6),rep("b",6),rep("c",6),rep("a",6),rep("b",6),rep("c",6))
value22<-c(29,35,28,36,33,38,14,8,10,5,7,16,22,20,23,25,30,32, 
           35,31,26,25,32,34,3,8,4,5,9,6,18,15,8,7,11,10)
df111<-data.frame(gen,t,value22)
table(gen,t)
aggregate(value22, by=list(t=t,gen=gen), FUN=mean)
fit.hos<-aov(value22~gen*t)
summary(fit.hos)
qf(.05, df1=1, df2=30,lower.tail = F) ### fcrit
qf(.05, df1=2, df2=30,lower.tail = F) ### fcrit

#### FD eg2
mt<-c(rep(1,12),rep(2,12),rep(3,12))
tmp<-c(rep(15,4),rep(70,4),rep(125,4),rep(15,4),rep(70,4),rep(125,4), 
       rep(15,4),rep(70,4),rep(125,4))
bat<-c(130,74,155,180,34,80,40,75,20,82,70,58, 
       150,188,159,126,126,106,122,115,25,70,58,45,  
       138,110,168,160,174,120,150,139,96,104,82,60)
table(mt,tmp)
df.bat<-data.frame(mt,tmp,bat)
aggregate(bat, by=list(tmp=tmp,mt=mt), FUN=mean)
fit.bat<-aov(bat~mt*tmp)
summary(fit.bat)
qf(.05, df1=1, df2=32,lower.tail = F) ### fcrit


# One-way ANCOVA 26/07/18 ####
data(litter, package="multcomp")
attach(litter)
str(litter)
View(litter)
table(litter$dose)
options(digits=4)
aggregate(litter$weight, by=list(litter$dose), FUN=mean)
fit <- aov(litter$weight ~ gesttime + litter$dose)
summary(fit)
library(effects)
ls<-as.list(litter)
attach(ls)
effect("dose", fit)
# Multiple comparisons employing user-supplied contrasts 27/07/18
library(multcomp)
contrast <- rbind("no drug vs. drug" = c(3, -1, -1, -1))
summary(glht(fit, linfct=mcp(dose=contrast)))

# Assessing test assumptions
# standard ANCOVA designs assumes homogeneity of regression slopes.
# means slopes must be equal (we use gesttime*dose)
library(multcomp)
fit2 <- aov(weight ~ gesttime*dose, data=litter)
summary(fit2)
#The interaction is nonsignificant, supporting 
#the assumption of equality of slopes.

# Visualizing the results
# Plot of the relationship between gestation time
# and birth weight for each of four
# drug treatment groups
library(HH)
ancova(weight ~ gesttime + dose, data=litter)

#####Two-way factorial ANOVA #######
attach(ToothGrowth)
table(supp, ToothGrowth$dose)
aggregate(len, by=list(Sup=supp, Dose=ToothGrowth$dose), FUN=mean)
aggregate(len, by=list(supp, ToothGrowth$dose), FUN=sd)
fit <- aov(len ~ supp*ToothGrowth$dose)
summary(fit)

#Interaction between dose and delivery mechanism on tooth growth.
interaction.plot(ToothGrowth$dose, supp, len, type="b",
                 col=c("red","blue"), pch=c(16, 18),
                 main = "Interaction between Dose and Supplement Type")

library(gplots)
plotmeans(len ~ interaction(supp, ToothGrowth$dose, sep=" "),
          connect=list(c(1,3,5),c(2,4,6)),
          col=c("red", "darkgreen"),
          main = "Interaction Plot with 95% CIs",
          xlab="Treatment and Dose Combination")

# Main effects
# and two-way interaction for
# the ToothGrowth dataset.
library(HH)
interaction2wt(len~supp*ToothGrowth$dose)

###### Repeated measures ANOVA 30/07/18 ######
#Repeated measures ANOVA with one between- and within-groups factor
# common design

#The dependent variable is carbon
#dioxide uptake (uptake)

#the independent variables are Type (Quebec
#versus Mississippi) and ambient CO2 concentration (conc) 

w1b1 <- subset(CO2, Treatment=="chilled")## indexed where treatment is 
# chilled from the CO2 data set

#format ; y ~ B * W + Error(Subject/W)
attach(w1b1)
fit <- aov(uptake ~ conc*Type + Error(Plant/(conc), w1b1))
summary(fit)

#plots
par(las=2)
par(mar=c(10,4,4,2))
with(w1b1, interaction.plot(conc,Type,uptake,
        type="b", col=c("red","blue"), pch=c(16,18),
        main="Interaction Plot for Plant Type and Concentration"))

## alternative approach
interaction.plot(w1b1$conc,w1b1$Type,w1b1$uptake,
                 type="b", col=c("red","blue"), pch=c(16,18),
                 main="Interaction Plot for Plant Type and Concentration")

boxplot(uptake ~ Type*conc, data=w1b1, col=(c("gold", "green")),
        main= "Chilled Quebec and Mississippi Plants",
        ylab= "Carbon dioxide uptake rate (umol/m^2 sec)")

#From either graph, you can see that there's a 
#greater carbon dioxide uptake in plants
#from Quebec compared to Mississippi. 
#The difference is more pronounced at higher
#ambient CO2 concentrations.


##### Multivariate analysis of variance (MANOVA) 30/07/18 ######
# One-way MANOVA, more than one outcome variable(dependent).
library(MASS)
attach(UScereal)
View(UScereal)
## indexing but not good for this analysis
var<-c("calories", "fat", "sugars")
UScereal[var]

## indexed from the UScereal data frame
y <- cbind(calories, fat, sugars) ## form a matrix of the 
# three dependent variables (calories, fat, and sugars)

x<-aggregate(y, by=list(shelf), FUN=mean)

cov(y)
fit <- manova(y ~ shelf)
summary(fit)
#univariate results
z<-summary.aov(fit)
k<-z$` Response calories`
TukeyHSD(k)
 
 ## post hoc test(pair wise comparison)
fit.1<-manova(y ~ shelf,subset=shelf %in% c("1","2"))
summary(fit.1)
fit.2<-manova(y ~ shelf,subset=shelf %in% c("1","3"))
summary(fit.2)
fit.3<-manova(y ~ shelf,subset=shelf %in% c("2","3"))
summary(fit.3)
  
##1 testing multivariate normality
# A Q-Q plot for assessing multivariate normality
center <- colMeans(y)
n <- nrow(y)
p <- ncol(y)
cov <- cov(y)
d <- mahalanobis(y,center,cov)

coord <- qqplot(qchisq(ppoints(n),df=p),
                d, main="Q-Q Plot Assessing Multivariate Normality",
                ylab="Mahalanobis D2")
abline(a=0,b=1)
identify(coord$x, coord$y, labels=row.names(UScereal))

# multivariate outliers
library(mvoutlier)
outliers <- aq.plot(y)

#### Robust or nonparametric MANOVA  1/08/18 ######
library(rrcov)
Wilks.test(y,shelf,method="mcd")

# ANOVA as regression
library(multcomp)
levels(cholesterol$trt)
fit.aov <- aov(response ~ trt, data=cholesterol)
summary(fit.aov)

# A regression approach to the ANOVA problem in section 9.3
fit.lm <- lm(response ~ trt, data=cholesterol)
summary(fit.lm)

###### Implementing power analysis with the pwr package #####
library(pwr)

# T test
pwr.t.test(d=.8, sig.level=.05, power=.9, type="two.sample",
             alternative="two.sided")

pwr.t.test(n=20, d=.5, sig.level=.01, type="two.sample",
           alternative="two.sided")

# If the sample sizes for the two groups are unequal.
## encountered a problem
pwr.t2n.test(n1=20, n2= 25, d=0.05, sig.level=0.01, power=.9)

                # ANOVA

#calculate the sample size needed in each group 
#to obtain a power of 0.80, when the effect size is 0.25
#and and a significance level of 0.05 is employed. 

pwr.anova.test(k=5, f=.25, sig.level=.05, power=.8)

# conclusion: The total sample size is therefore 5 × 39, or 195. 

             # Test of correlation coefficients.

# Your null and research hypotheses are
#H0: ??	??? 0.25 versus H1: ?? > 0.25

pwr.r.test(r=.25, sig.level=.05, power=.90, alternative="greater")

# you need to assess depression and loneliness in 
# 134 participants in order to be
#90 percent confident that you'll reject the null hypothesis if it's false


               # Linear models
pwr.f2.test(u=3, f2=0.0769, sig.level=0.05, power=0.90)

# which means the required sample size is N = 185 + 7 + 1 = 193.

             #Tests of proportions
pwr.2p.test(h=ES.h(.65, .6), sig.level=.05, power=.9,
            alternative="greater")

# you'll need to conduct a study with 1,605 individuals
#  receiving the new drug

            # Chi-square tests
prob <- matrix(c(.42, .28, .03, .07, .10, .10), byrow=TRUE, nrow=3)
ES.w2(prob)
# Using this information, you can calculate the 
# necessary sample size like this:
pwr.chisq.test(w=.1853, df=2, sig.level=.05, power=.9)

# The results suggest that a study with 369 participants
# will be adequate to detect a
# relationship between ethnicity and promotion 


# Choosing an appropriate effect size in novel situations.

#Sample sizes for detecting significant effects in a one-way ANOVA
library(pwr)
es <- seq(.1, .5, .01)
nes <- length(es)

samsize <- NULL
for (i in 1:nes){
  result <- pwr.anova.test(k=5, f=es[i], sig.level=.05, power=.9)
  samsize[i] <- ceiling(result$n)
}
plot(samsize,es, type="l", lwd=2, col="red",
     ylab="Effect Size",
     xlab="Sample Size (per cell)",
     main="One Way ANOVA with Power=.90 and Alpha=.05")

# Creating power analysis plots
# Sample size curves for detecting correlations of various sizes

library(pwr)
r <- seq(.1,.5,.01)
nr <- length(r)

p <- seq(.4,.9,.1)
np <- length(p)

samsize <- array(numeric(nr*np), dim=c(nr,np))
for (i in 1:np){
  for (j in 1:nr){
    result <- pwr.r.test(n = NULL, r = r[j],
                         sig.level = .05, power = p[i],
                         alternative = "two.sided")
    samsize[j,i] <- ceiling(result$n)
    
  }
}
xrange <- range(r)
yrange <- round(range(samsize))
colors <- rainbow(length(p))
plot(xrange, yrange, type="n",
     xlab="Correlation Coefficient (r)",
     ylab="Sample Size (n)" )

for (i in 1:np){
lines(r, samsize[,i], type="l", lwd=2, col=colors[i])
}

abline(v=0, h=seq(0,yrange[2],50), lty=2, col="grey89")
abline(h=0, v=seq(xrange[1],xrange[2],.02), lty=2,
       col="gray89")
title("Sample Size Estimation for Correlation Studies\n
      Sig=0.05 (Two-tailed)")
legend("topright", title="Power", as.character(p),
       fill=colors)

## Other packages
install.packages("piface", repos="http://R-Forge.R-project.org")
library(piface)
piface()

## important parkage  for power analysis for sciences
install.packages("MBESS")
library(MBESS)

##### intermediate graphs ######
#Visualizing bivariate and multivariate relationships

attach(mtcars)
plot(wt, mpg,
     main="Basic Scatter plot of MPG vs. Weight",
     xlab="Car Weight (lbs/1000)",
     ylab="Miles Per Gallon ", pch=19)
abline(lm(mpg~wt), col="red", lwd=2, lty=1)
lines(lowess(wt,mpg), col="blue", lwd=2, lty=2)

## my example
l.fit<-lm(mpg~wt)
ft<-l.fit$fitted.values
lines(wt,ft)


## Scatter plot with subgroups and separately estimated fit lines

#Scatter plots help you visualize relationships 
#between quantitative variables, two at a time.
library(car)
# not running figure it out 
scatterplot(mpg ~ wt | cyl, data=mtcars, lwd=2,
            main="Scatter Plot of MPG vs. Weight by # Cylinders",
            xlab="Weight of Car (lbs/1000)",
            ylab="Miles Per Gallon",
            legend.plot=TRUE,
            id.method="identify",
            labels=row.names(mtcars),
            boxplots="xy"
)

#Scatter plot matrices, gives relationships among data set at a glance
?pairs
pairs(~mpg+disp+drat+wt, data=mtcars,
      main="Basic Scatter Plot Matrix")
#the scatter plot between mpg and disp is found at the row and column
#intersection of those two variables.

                 #Scatter plot matrix

#The graph includes kernel density and rug plots in the
#principal diagonal and linear and loess fit lines.
library(car)
?scatterplotMatrix
scatterplotMatrix(~ mpg + disp + drat + wt, data=mtcars, spread=FALSE,
             lty.smooth=2, main="Scatter Plot Matrix via car Package")


library(car)
## not the output I expected 
scatterplotMatrix(~ mpg + disp + drat + wt | cyl, data=mtcars,
                  spread=F, diagonal="histogram",by.groups = TRUE, 
                  main="Scatter Plot Matrix via car Package")
## the above plot tells us about the realtionship that exist bet
## various variables in the data set(correlation)

# correlations among mpg, wt, disp, and drat
# the results for the correlation confirms what we have for the plots
cor(mtcars[c("mpg", "wt", "disp", "drat")])

# Scatter plot matrix produced with the cpairs() function in 
# the gclus package.
# Variables closer to the principal diagonal are more highly correlated.
attach(mtcars) ## my example
x<-cbind(mpg, disp, drat,wt) ## indexed a matrix from data frame
as.data.frame(x)

install.packages("gclus")
library(gclus)
mydata <- mtcars[c(1, 3, 5, 6)]
mydata.corr <- abs(cor(mydata))
## abs stands for absolue values
mycolors <- dmat.color(mydata.corr)
## dmat.colour adds colour to a symmetric matrix
myorder <- order.single(mydata.corr)
cpairs(mydata,
       myorder,
       panel.colors=mycolors,
       gap=.5,
       main="Variables Ordered and Colored by Correlation"
)
plot(mtcars$disp, mtcars$mpg)
## High-density scatter plots
set.seed(1234)
n <- 1000
?matrix0
a<-rnorm(n, mean=0, sd=.5)
class(a)
data.class(a)
c1 <- matrix(rnorm(n, mean=0, sd=.5), ncol=2) ## normal
c2 <- matrix(rnorm(n, mean=3, sd=2), ncol=2) ## normal
mydata <- rbind(c1, c2)
mydata <- as.data.frame(mydata) ## converted to data frame
names(mydata) <- c("x", "y") ## passes a name to the data frame
View(mydata)
with(mydata,
     plot(x, y, pch=19, main="Scatter Plot with 10,000 Observations", 
          col = "red" ))



#Scatterplot using
#smoothScatter() to plot
#smoothed density estimates.
with(mydata,
     smoothScatter(x, y, main="Scatterplot Colored by Smoothed Densities"))

#Scatter plot using
#hexagonal binning to display the
#number of observations at each point

install.packages("hexbin")
library(hexbin)
with(mydata, {
  bin <- hexbin(x, y, xbins=50)
  plot(bin, main="Hexagonal Binning with 10,000 Observations")
})

#Scatter plot of 10,000 observations, where density is indicated by color.
install.packages("IDPmisc")
library(IDPmisc)
with(mydata,
     iplot(x, y, main="Image Scatter Plot with Color Indicating Density"))

?smoothScatter 
?ipairs

## sactterplot for very large data set
n <- 10000
x1  <- matrix(rnorm(n), ncol = 2)
x2  <- matrix(rnorm(n, mean = 3, sd = 1.5), ncol = 2)
x   <- rbind(x1, x2)

oldpar <- par(mfrow = c(2, 2), mar=.1+c(3,3,1,1), mgp = c(1.5, 0.5, 0))
smoothScatter(x, nrpoints = 0)
smoothScatter(x)

## a different color scheme:
Lab.palette <- colorRampPalette(c("blue", "orange", "red"), space = "Lab")
i.s <- smoothScatter(x, colramp = Lab.palette,
                     ## pch=NA: do not draw them
                     nrpoints = 250, ret.selection=TRUE)

## label the 20 very lowest-density points,the "outliers"
i.20 <- i.s[1:20]
text(x[i.20,], labels = i.20, cex= 0.75)

## use with pairs:
par(mfrow = c(1, 1))
y <- matrix(rnorm(40000), ncol = 4) + 3*rnorm(10000)
y[, c(2,4)] <-  -y[, c(2,4)]
pairs(y, panel = function(...) smoothScatter(..., nrpoints = 0, add = TRUE),
      gap = 0.2)
graphics.off()

##### 3D scatter plots 07/08/18 ######
#3D scatter plot of miles per gallon, auto weight, and displacement
install.packages("scatterplot3d")
library(scatterplot3d)
attach(mtcars)
par("mar")
par(mar=c(1,1,1,1))
scatterplot3d(wt, disp, mpg,
              main="Basic 3D Scatter Plot")

#3D scatter plot with vertical lines and shading
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt, disp, mpg,
              pch=16,
              highlight.3d=TRUE,
              type="h",
              main="3D Scatter Plot with Vertical Lines")

#3D scatter plot with vertical lines, shading, and overlaid regression plane
library(scatterplot3d)
attach(mtcars)
s3d <-scatterplot3d(wt, disp, mpg,
                    pch=16,
                    highlight.3d=TRUE,
                    type="h",
        main="3D Scatter Plot with Vertical Lines and Regression Plane")
fit <- lm(mpg ~ wt+disp)
s3d$plane3d(fit)


####### SPINNING 3D SCATTER PLOTS ######

#Rotating 3D scatter plot produced by the plot3d()
#function in the rgl packag
install.packages('rgl',repos='https://www.r-project.org')### installing a
install.packages("rgl")
library(rgl)
attach(mtcars)
plot3d(wt, disp, mpg, col="red", size=5)

#Spinning 3D scatter plot produced by the scatter3d()
#function in the Rcmdr packag
install.packages("Rcmdr")
library(Rcmdr) 
attach(mtcars)
scatter3d(wt, disp, mpg)

##more on 3d plots 26/09/18
View(iris)
??plot3d
attach(iris)
with(iris,plot3d(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length, 
                 type = "s", col=as.integer(Species)))

with(iris,plot3d(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length, 
                 type = "h", col=as.integer(Species)))

persp3d(volcano, col="red")
rglwidget()

install.packages("plot3D")
install.packages("plot3Drgl")
library(plot3D)
library(plot3Drgl)
with(volc,scatter3d(x=var1,y=var2,z=value,ticktype="detailed"))

## Globe-surface creation and animation
lat<-matrix(seq(90,-90,len=50)*pi/180,50,50,byrow=T)
long<-matrix(seq(-180,180,len=50)*pi/180,50,50)
r<-6378.1 ## radius of earth
x<- r*cos(lat)*cos(long)
y<- r*cos(lat)*sin(long)
z<- r*sin(lat)

open3d()
persp3d(x,y,z,col="white", 
        texture=system.file("textures/world.png", package="rgl"),
        specular="black", axes=F,box=F,xlab="", ylab ="", normal_x=x,  
        normal_y=y, normal_z=z )

###### data expolration 19/19/19 ###############
install.packages("mlbench")
install.packages("DataExplorer")
library(mlbench)
data("BostonHousing", package = "mlbench")

install.packages("ggplot2")
library(ggplot2)
library(DataExplorer)
?plot_missing
plot_missing(BostonHousing) ## Are there missing values, and what is the missing data profile?
plot_bar(BostonHousing) ## How does the categorical frequency for each discrete variable look like?
plot_histogram(BostonHousing) ## What is the distribution of each continuous variables


##### Creating side-by-side scatter and line plots #####

opar <- par(no.readonly=TRUE)

par(mfrow=c(1,2))
t1 <- subset(Orange, Tree==1) ## from orange data set subset tree where is 1
plot(t1$age, t1$circumference,
     xlab="Age (days)",
     ylab="Circumference (mm)",
     main="Orange Tree 1 Growth")
plot(t1$age, t1$circumference,
     xlab="Age (days)",
     ylab="Circumference (mm)",
     main="Orange Tree 1 Growth",
     type="b") ##### type connects the dots
graphics.off()


#### analysis to verify if tree circumference depends on age
hist(Orange$age)
hist(Orange$circumference)

summary(Orange$age)
sd(Orange$age)
library(psych)
skew(Orange$age)
skew(Orange$circumference)
kurtosi(Orange$age)
kurtosi(Orange$circumference)

boxplot(Orange$age~Orange$Tree)
boxplot(Orange$circumference~Orange$Tree)

plot(Orange$age,Orange$circumference)
plot(Orange$circumference~Orange$Tree)
plot(Orange$age~Orange$Tree)

dstats <- function(x)(c(n=length(x), mean=mean(x), sd=sd(x)))

#### the above is a formula that holds both mean, sd and data size

dfm <- melt(Orange, measure.var=c("age"), 
            id.var=c("Tree"))
cast(dfm, Tree +variable ~ ., dstats)

dfm <- melt(Orange, measure.var=c("circumference"), 
            id.var=c("Tree"))
cast(dfm, Tree +variable ~ ., dstats)

attach(Orange)
cor(Orange$age,Orange$circumference)
cor.test(Orange$age,Orange$circumference)

tree<-lm(Orange$circumference ~ Orange$age, data = Orange)
summary(tree)
par(mfrow=c(2,2))
plot(tree)

library(gvlma)
gvm<-gvlma(tree)
library(car)
outlierTest(tree)
crPlots(tree)
#### end of analysis

#### Line chart displaying the growth of five orange trees over time #####
Orange$Tree <- as.numeric(Orange$Tree) ## converted to numeric in order to 
## take advantage of numeric manipulation
ntrees <- max(Orange$Tree)
str(Orange)

xrange <- range(Orange$age)
yrange <- range(Orange$circumference)

## type n only sets the x and y axes
plot(xrange, yrange,
     type="n", ## tpye = n only sets up the xy plane 
     xlab="Age (days)",
     ylab="Circumference (mm)"
)
colors <- rainbow(ntrees) ## gives the five levesls 1st 5 rainbow colours
linetype <- c(1:ntrees) ## ntress = 5
plotchar <- seq(18, 18+ntrees, 1) ## counting 18 to 23

for (i in 1:ntrees) { ## i is a counter 
  ## using the for loop  to the execute the graph
  tree <- subset(Orange, Tree==i) #indexed trees=i where i=1,2,3,4,5
  ## from the orange data set
  lines(tree$age, tree$circumference,
        type="b",
        lwd=2,
        lty=linetype[i],
        col=colors[i],
        pch=plotchar[i]
  )
}

title("Tree Growth", "example of line plot")
legend(xrange[1], yrange[2],
       1:ntrees,
       cex=0.8,
       col=colors,
       pch=plotchar,
       lty=linetype,
       title="Tree"
)





########## 29/09/18 Correlograms ##############
options(digits=2)
cor(mtcars[,-c(12,13)])
install.packages("corrgram")
install.packages('corrgram',repos='https://www.r-project.org')### installing a
library(ggplot2)
library(corrgram)
corrgram(mtcars[,-c(12,13)], order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt, 
         main="Correlogram of mtcars intercorrelations")

## alt approach
library(corrgram)
corrgram(mtcars[,-c(12,13)], order=TRUE, lower.panel=panel.ellipse,
         upper.panel=panel.pts, text.panel=panel.txt,
         diag.panel=panel.minmax,
         main="Correlogram of mtcars data using scatter plots and ellipses")

###
library(corrgram)
corrgram(mtcars[,-c(12,13)], lower.panel=panel.shade,
         upper.panel=NULL, text.panel=panel.txt,
         main="Car Mileage Data (unsorted)")

## colour customization
library(corrgram)
col.corrgram <- function(ncol){
  colorRampPalette(c("darkgoldenrod4", "burlywood1",
                     "darkkhaki", "darkgreen"))(ncol)}
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="A Corrgram (or Horse) of a Different Color")

## Mosaic plots
ftable(Titanic)
str(Titanic)
mosaic(table)
library(vcd)
mosaic(Titanic, shade=TRUE, legend=TRUE)
## ALT
library(vcd)
mosaic(~Class+Sex+Age+Survived, data=Titanic, shade=TRUE, legend=TRUE)
example(mosaic)

qnorm(0.025, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qf(0.05,3,347,lower.tail =F) 
#### permutation test 25/10/18 ###### 
## traditional method
library(coin)
score <- c(40, 57, 45, 55, 58, 57, 64, 55, 62, 65)
treatment <- factor(c(rep("A",5), rep("B",5)))
mydata <- data.frame(treatment, score)
t.test(score~treatment, data=mydata, var.equal=TRUE)
## Since p value < alpha value we teject the null hypothesis i.e we conclude 
## the two means are significantly diff

# modern approach
oneway_test(score~treatment, data=mydata, distribution="exact")
## with the modern method it can be concluded that the pvalue > alpha value
## hence have equal means

library(MASS)
UScrime <- transform(UScrime, So = factor(So))
wilcox_test(Prob ~ So, data=UScrime, distribution="exact")

#Anova
library(multcomp)
set.seed(1234)
oneway_test(response~trt, data=cholesterol,
              distribution=approximate(B=9999))

# Independence in contingency tables
library(coin)
library(vcd)
Arthritis <- transform(Arthritis,
                         Improved=as.factor(as.numeric(Improved)))
set.seed(1234)
chisq_test(Treatment~Improved, data=Arthritis,
             distribution=approximate(B=9999))

#Independence between numeric variables
states <- as.data.frame(state.x77)
set.seed(1234)
spearman_test(Illiteracy~Murder, data=states,
                distribution=approximate(B=9999))
## illiteracy depends on murder rate

# Dependent two-sample and k-sample tests
library(coin)
library(MASS)
wilcoxsign_test(U1~U2, data=UScrime, distribution="exact")
## mans not equal

###Permutation tests for simple linear regression
library(lmPerm)
set.seed(1234)
str(women)
fit <- lmp(women$weight~women$height, data=women, perm="Prob")
summary(fit)

### Permutation tests for polynomial regression
library(lmPerm)
set.seed(1234)
fit <- lmp(weight~height + I(height^2), data=women, perm="Prob")
summary(fit)

## Permutation tests for multiple regression
library(lmPerm)
set.seed(1234)
states <- as.data.frame(state.x77)
fit <- lmp(Murder~Population + Illiteracy+Income+Frost,
             data=states, perm="Prob")
summary(fit)

## Permutation test for One-Way ANOVA
library(lmPerm)
library(multcomp)
set.seed(1234)
fit <- aovp(response~trt, data=cholesterol, perm="Prob")
summary(fit)

####

library(lmPerm)
set.seed(1234)
fit <- aovp(weight ~ gesttime + dose, data=litter, perm="Prob")
summary(fit)

###Permutation test for two-way ANOVA
library(lmPerm)
set.seed(1234)
fit <- aovp(len~supp*dose, data=ToothGrowth, perm="Prob")
summary(fit)

###### Bootsrapping 29/10/18 ########
rsq <- function(formula, data, indices) {
  d <- data[indices,]
  fit <- lm(formula, data=d)
  return(summary(fit)$r.square)
}

library(boot)
set.seed(1234)
results <- boot(data=mtcars, statistic=rsq,
                R=1000, formula=mpg~wt+disp)
print(results)
boot.ci(results, type=c("perc", "bca"))

## Bootstrapping several statistics
bs <- function(formula, data, indices) {
  d <- data[indices,]
  fit <- lm(formula, data=d)
  return(coef(fit))
}
library(boot)
set.seed(1234)
results <- boot(data=mtcars, statistic=bs,
                R=1000, formula=mpg~wt+disp)
print(results)
plot(results, index=1)
plot(results, index=2)
plot(results, index=3)
boot.ci(results, type="bca", index=2)

A#### Logistic regression ####
install.packages("AER")
data(Affairs, package="AER")
summary(Affairs)
View(Affairs) ## inspecting data set
Affairs$ynaffair[Affairs$affairs > 0] <- 1 ## add yn affairs to de data set
Affairs$ynaffair[Affairs$affairs == 0] <- 0 ## and assign 1 to it
Affairs$ynaffair <- factor(Affairs$ynaffair,
                             levels=c(0,1),
                             labels=c("No","Yes"))
table(Affairs$ynaffair)

## affairs explained by some variables in the model
fit.full <- glm(ynaffair ~ gender + age + yearsmarried + children +
                  religiousness + education + occupation +rating,
                data=Affairs,family=binomial())
summary(fit.full)

fit.reduced <- glm(ynaffair ~ age + yearsmarried + religiousness +
                     rating, data=Affairs, family=binomial())
summary(fit.reduced)
coef(fit.reduced)
exp(coef(fit.reduced))

#### model comparison 
anova(fit.reduced, fit.full, test="Chisq")

#The nonsignificant chi-square value (p=0.21) suggests that the reduced model with
#four predictors fits as well as the full model with nine predictors, 

##Interpreting the model parameters
coef(fit.reduced)

exp(coef(fit.reduced))

exp(confint(fit.reduced))

##Assessing the impact of predictors on the probability of an outcome
testdata <- data.frame(rating=c(1, 2, 3, 4, 5), age=mean(Affairs$age),
                       yearsmarried=mean(Affairs$yearsmarried),
                       religiousness=mean(Affairs$religiousness))


testdata$prob <- predict(fit.reduced, newdata=testdata, type="response")
testdata

testdata1 <- data.frame(religiousness=c(1, 2, 3, 4, 5), age=mean(Affairs$age),
                       yearsmarried=mean(Affairs$yearsmarried),
                       rating=mean(Affairs$rating))


testdata1$prob <- predict(fit.reduced, newdata=testdata1, type="response")
testdata1

##Overdispersion
fit <- glm(ynaffair ~ age + yearsmarried + religiousness +
             rating, family = binomial(), data = Affairs)

fit.od <- glm(ynaffair ~ age + yearsmarried + religiousness +
                  rating, family = quasibinomial(), data = Affairs)
# H0: f = 1 
# H1: f ??? 1

pchisq(summary(fit.od)$dispersion * fit$df.residual,
         fit$df.residual, lower = F)
## from the result we do not reject null hyp hence Overdispersion 
## is not a problem

#### Poisson regression ###
install.packages("robust")
data(breslow.dat, package="robust")
names(breslow.dat)
summary(breslow.dat[c(6,7,8,10)])

opar <- par(no.readonly=TRUE)
par(mfrow=c(1,2))
attach(breslow.dat)
hist(sumY, breaks = 20)
boxplot(sumY ~ Trt)
par(opar)
plot(sumY)
fit <- glm(sumY ~ Base + Age + Trt, data=breslow.dat, family=poisson())
summary(fit)
coef(fit)
exp(coef(fit))

install.packages("qcc")
library(qcc)
qcc.overdispersion.test(breslow.dat$sumY, type="poisson")
fit.od <- glm(sumY ~ Base + Age + Trt, data=breslow.dat,
              family=quasipoisson())
summary(fit.od)


###### Principal components and factor analysis in R 11/11/18 ######
library(psych)
fa.parallel(USJudgeRatings[,-1], fa="PC", ntrials=100,sim=TRUE, 
            show.legend=FALSE, main="Scree plot with parallel analysis")
library(psych)
pc <- principal(USJudgeRatings[,-1], nfactors=1)

qt(0.025, 347,lower.tail = F, log.p = FALSE)


########## Advanced graphics in R #########################
library(lattice)
histogram(~height | voice.part, data = singer,
          main="Distribution of Heights by Voice Pitch",
          xlab="Height (inches)")

head(singer, n=20)
attach(mtcars)
#### remember since cyl is categorical var it will have to be converted 
#### to a factor with level
#### my example
histogram(~mpg |cyl.f, data = mtcars, 
          main= 'Distribution of mpg by cylinder' , xlab='mpg')

#### lattice plot examples 
library(lattice)
attach(mtcars)
gear <- factor(gear, levels=c(3, 4, 5),
               labels=c("3 gears", "4 gears", "5 gears"))

cyl <- factor(cyl, levels=c(4, 6, 8),
              labels=c("4 cylinders", "6 cylinders", "8 cylinders"))

#### density plot of dist of mtcar
attach(mtcars)
densityplot(~mpg,
            main="Density Plot",
            xlab="Miles per Gallon")

####  dist by number of cylinder
#### make sure to convert cyl which is given as num in the data set to factor
densityplot(~mpg | cyl.f,
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

#### box of my per gallon by cyl
str(mtcars)
bwplot(cyl.f~ mpg,
       main="Box Plots by Cylinders and Gears",
       xlab="Miles per Gallon", ylab="Cylinders")

#### mine
xyplot(mpg ~ wt | cyl.f ,
       main="Scatter Plots by Cylinders and Gears",
       xlab="Car Weight", ylab="Miles per Gallon")

#### mine
xyplot( ~ mpg | gear,
       main="Scatter Plots by Cylinders and Gears",
       xlab="Car Weight", ylab="Miles per Gallon")

#### mine
xyplot( ~ mpg | cyl * gear,
        main="Scatter Plots by Cylinders and Gears",
        xlab="Car Weight", ylab="Miles per Gallon")

#### the realtionship between mpg wt and qsec by cyl levels
cloud(mpg ~ wt * qsec | cyl,
      main="3D Scatter Plots by Cylinders")

#### mpg and gear cat by cyl
dotplot(cyl.f ~ mpg | gear,
        main="Dot Plots by Number of Gears and Cylinders",
        xlab="Miles Per Gallon")

#### bar chart for a lattice plot
barchart(mpg~cyl.f)

#### mine
wireframe(mpg~gear*hp)
stripplot(mpg~cyl.f)
contourplot(mpg~cyl.f*hp)
histogram(~mpg)

#### scarter plot of some selected var in mtcars
splom(mtcars[c(1, 3, 4, 5, 6)],
      main="Scatter Plot Matrix for mtcars Data")
detach(mtcars)

#### manipulation in lattice package
library(lattice)
mygraph <- densityplot(~height|voice.part, data=singer)

#### it adds features to the graph
update(mygraph, col=5 , pch=16, cex=.8, jitter=.05, lwd=2)

####conditioning by categorical variables but first it has to be converted
#### we want to use a continous var to group disp
displacement <- equal.count(mtcars$disp, number=3, overlap=0) #### disp now cat var

xyplot(mpg~wt|displacement, data=mtcars,
       main = "Miles per Gallon vs. Weight by Engine Displacement",
       xlab = "Weight", ylab = "Miles per Gallon",
       layout=c(3, 1), aspect=2)

#### panel fxn
xyplot(mpg~wt|displacement, data=mtcars)
#### default is panel.xyplot

#### same as the above let go ahead and change the default
xyplot(mpg~wt|displacement, data=mtcars, panel=panel.xyplot)

################ customization of graphs ################
#### xyplot with custom panel function
mypanel <- function(x,y) {
  panel.xyplot(x, y, pch=19)
  panel.rug(x, y)
  panel.grid(h=-1.5, v=-1.5) 
  panel.lmline(x, y, col="red", lwd=1, lty=2)
}
xyplot(mpg~wt|displacement, data=mtcars,
       layout=c(3, 1),
       aspect=1.5,
       main = "Miles per Gallon vs. Weight by Engine Displacement",
       xlab = "Weight",
       ylab = "Miles per Gallon",
       panel = mypanel)

#### xyplot with custom panel function and additional options
library(lattice)
mtcars$transmission <- factor(mtcars$am, levels=c(0,1),
                              labels=c("Automatic", "Manual"))
panel.smoother <- function(x, y) {
  panel.grid(h=-1, v=-1)
  panel.xyplot(x, y)
  panel.loess(x, y)
  panel.abline(h=mean(y), lwd=2, lty=2, col="green")
}
xyplot(mpg~disp|transmission,data=mtcars,
       scales=list(cex=.9, col="red"), #### features od the xy axis
       panel=panel.smoother,
       xlab="Displacement", ylab="Miles per Gallon",
       main="MGP vs Displacement by Transmission Type",
       sub = "Dotted lines are Group Means", aspect=1)
help(xyplot)
?densityplot

#### this creates a separate chart 
densityplot(~mtcars$mpg | mtcars$transmission,
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")
 
library(lattice)
mtcars$transmission <- factor(mtcars$am, levels=c(0, 1),
labels=c("Automatic", "Manual"))

#### grouping by superimpose
densityplot(~mpg, data=mtcars,
            group=transmission, ####  where the superimposition happens
            main="MPG Distribution by Transmission Type",
            xlab="Miles per Gallon",
            auto.key=T)

####  additional features for the legend but basic
densityplot(~mpg, data=mtcars,
            group=transmission, ####  where the superimposition happens
            main="MPG Distribution by Transmission Type",
            xlab="Miles per Gallon",
            auto.key=list(space='bottom',  columns=2, title= 'Transmission'))

####  Kernel density plot with a group variable and customized legend
library(lattice)
mtcars$transmission <- factor(mtcars$am, levels=c(0, 1),
                              labels=c("Automatic", "Manual"))
colors = c("red", "blue")
lines = c(1,2) 
points = c(16,17)

key.trans <- list(title="Trasmission",
                  space="bottom", columns=2, 
                  text=list(levels(mtcars$transmission)),
                  points=list(pch=points, col=colors),
                  lines=list(col=colors, lty=lines),
                  cex.title=1, cex=.9)

densityplot(~mpg, data=mtcars,
           group=transmission,
           main="MPG Distribution by Transmission Type",
           xlab="Miles per Gallon",
           pch=points, lty=lines, col=colors,
           lwd=2, jitter=.005, 
           key=key.trans)

####  xyplot with group and conditioning variables and customized legend

library(lattice)
colors <- "darkgreen"
symbols <- c(1:12)
linetype <- c(1:3)

key.species <- list(title="Plant",
                    space="right",
                    text=list(levels(CO2$Plant)),
                    points=list(pch=symbols, col=colors))

xyplot(uptake~conc|Type*Treatment, data=CO2,
       group=Plant,
       type="o",
       pch=symbols, col=colors, lty=linetype,
       main="Carbon Dioxide Uptake\nin Grass Plants",
       ylab=expression(paste("Uptake ",
                             bgroup("(", italic(frac("umol","m"^2)), ")"))),
       xlab=expression(paste("Concentration ",
                             bgroup("(", italic(frac(mL,L)), ")"))),
       sub = "Grass Species: Echinochloa crus-galli",
       key=key.species)

#### Page arrangement
library(lattice)
graph1 <- histogram(~height|voice.part, data=singer,
                    main="Heights of Choral Singers by Voice Part")

graph2 <- densityplot(~height, data=singer, group=voice.part,
                      plot.points=FALSE, auto.key=list(columns=4))

#### bcos par mfrow cant be recognized by par then use plot and split
plot(graph1, split=c(1, 1, 1, 2))
plot(graph2, split=c(1, 2, 1, 2), newpage=F)

######################### The ggplot2 package 18 10 19 #########################
library(ggplot2)
?qplot()
####### boxplot of mpg defined by cylinder using ggplot
library(ggplot2)
attach(mtcars)
mtcars$cyl.f <- as.factor(mtcars$cyl.f)
qplot(mtcars$cyl.f, mtcars$mpg, data=mtcars, geom=c("boxplot", "jitter"),
      main="Box plots with superimposed data points",
      xlab= "Number of Cylinders",
      ylab="Miles per Gallon",  fill=mtcars$cyl.f   ######adds colour by group
)


####scatter plot matrix with a fitted line 
attach(mtcars)
library(ggplot2)
transmission <- factor(mtcars$am, levels=c(0, 1),
                       labels=c("Automatic", "Manual"))
qplot(wt,mpg, data=mtcars,
      color=transmission, shape=transmission,
      geom=c("point",'smooth'),
      method="lm", formula=y~x,  #### fit a reg line
      xlab="Weight", ylab="Miles Per Gallon",
      main="Regression Example")

####(trellis) graph
library(ggplot2)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
mtcars$am <- factor(mtcars$am, levels=c(0, 1),
                    labels=c("Automatic", "Manual"))
qplot(wt,mpg, data=mtcars, facets=am~cyl, size=hp)

### density plot
library(ggplot2)
data(singer, package="lattice")
qplot(height, data=singer, geom=c("density"),
      facets=voice.part~., fill=voice.part)


########### graphs from edureka 26 10 19   ######----------------------------
View(iris)
str(iris)
table(iris$species)

par(mfrow=c(1,2))
graphics.off()
attach(iris)
plot(iris$Sepal.Length,iris$Petal.Length)
plot(iris$Sepal.Length~iris$Petal.Length, col = 2, pch = 16)

hist(Sepal.Width, col= c(seq(1,11,1)))
hist(Sepal.Width, col= 'aquamarine3')
mean(Sepal.Width)
var(Sepal.Width)

library(psych)
skew(Sepal.Width)
kurtosi(Sepal.Width)

boxplot(Sepal.Length~Species)

install.packages('ggplot2')
library(ggplot2)
######## aesthetics
attach(iris)
ggplot(iris)
ggplot(iris,aes(x=Petal.Length, y=Sepal.Length,col=Species))+geom_point()
ggplot(iris,aes(x=Petal.Length, y=Sepal.Length, shape = Species))+geom_point()
ggplot(iris,aes(x=Petal.Length, y=Sepal.Length))+geom_point()
ggplot(iris,aes(x=Petal.Length, y=Sepal.Length, col = Species, shape=Species))+geom_point()

######## geometry
install.packages('dplyr')
library(dplyr)
setwd("E:/Data Analytics/data set")
housing <- read.csv("Housing.csv", 
                    stringsAsFactors = FALSE, header = T)# load the data
str(housing)
View(housing)

housing<-housing[,-1]
str(housing)
attach(housing)
######## aesthetic is mostly used for conditioning over categorical var
ggplot(housing,aes(x=price))+geom_histogram()

######## fill as atrribute
ggplot(housing,aes(x=price))+geom_histogram(bins = 50, fill='palegreen4')
ggplot(housing,aes(x=price))+geom_histogram(bins = 50, fill='palegreen4', 
                                            col= 'green')########  colour to boundary


######## fill as estheic
ggplot(housing,aes(x=price,fill=airco))+geom_histogram()

######## fill as estheic
ggplot(housing,aes(x=price,fill=airco))+geom_histogram(position = 'fill')
ggplot(housing,aes(x=airco,y=price,fill=airco))+geom_boxplot()

######## barplot
ggplot(housing,aes(x=airco, fill=airco))+geom_bar()

######## map airco over rec room
ggplot(housing,aes(x=recroom,fill=airco))+geom_bar(position = 'fill')+theme_bw()

######## frequency dist viewing the dist of cont distribution
ggplot(housing,aes(x=housing$price))+geom_freqpoly(bins=20) 
ggplot(housing,aes(x=housing$price))+geom_freqpoly(bins=60) 
ggplot(housing,aes(x=housing$price))+geom_freqpoly(bins=100) 
ggplot(housing,aes(x=housing$price,col=airco))+geom_freqpoly(bins=60) 

######## how are continous var change with the help of a cat var
######## box plot
str(housing)
ggplot(housing,aes(x=factor(bedrooms),y = price))+geom_boxplot()
ggplot(housing,aes(x=factor(recroom),y = price))+geom_boxplot()

######## mapped colour over stories and bedroom
ggplot(housing,aes(x=factor(stories),y = price, fill=factor(stories)))+geom_boxplot()

######## multivariate analysis, comparing stories and recroom with price
######## comparing cont with cat vars
ggplot(housing,aes(x=factor(bedrooms),y = price, fill=airco))+geom_boxplot()
ggplot(housing,aes(x=factor(stories),y = price, fill=recroom))+geom_boxplot()

######## comparing two continous var with geom_smooth
ggplot(housing,aes(x=lotsize,y=price))+geom_smooth()

######## including a cat var
par(mfrow=c(1,2))
ggplot(housing,aes(x=lotsize,y=price, fill=airco))+geom_smooth()

ggplot(housing,aes(x=lotsize,y=price, fill=airco))+geom_smooth(se=F)

ggplot(housing,aes(x=lotsize,y=price, fill=airco))+geom_smooth()

######## added a method which is a linear model
ggplot(housing,aes(x=lotsize,y=price, col=airco))+geom_smooth(se=F, method = 'lm')

######## combining geoms
ggplot(housing,aes(x=lotsize,y=price, col=recroom))+geom_point()+geom_smooth(se=F, method = 'lm')

ggplot(housing,aes(x=lotsize,y=price))+geom_point()+geom_smooth(se=F, method = 'lm')

ggplot(housing,aes(x=lotsize,y=price))+geom_point()+geom_smooth(method = 'lm')

ggplot(housing,aes(x=lotsize,y=price))+geom_point()+geom_smooth()

ggplot(housing,aes(x=lotsize,y=price))+geom_point()

######## faceting data 
######## over recroom
str(housing)
ggplot(housing,aes(x=lotsize,y=price, col=recroom))+geom_point()+geom_smooth(se=F, method = 'lm')+facet_grid(~recroom)

######## adding themes ################ 
ggplot(housing,aes(x=factor(bedrooms),y = price, fill=airco))+geom_boxplot()

obj1<-ggplot(housing,aes(x=factor(stories),y = price, fill=factor(stories)))+geom_boxplot()

########  adding label
obj2<-obj1+labs(title = 'price wrt stories', x= 'stories', fill = 'stories')
obj3<-obj2+theme(panel.background = element_rect(fill = 'palegreen1'))
obj4<-obj3+theme(plot.title = element_text(hjust = 0.5, face = 'bold', colour = 'cadetblue'))
obj4+scale_y_continuous(labels = dollar) ######## for adding units to y labels

######## adding themes to facet plot
obj5<-ggplot(housing,aes(x=lotsize,y=price, col=recroom))+geom_point()+geom_smooth(se=F, method = 'lm')+facet_grid(~recroom)
obj6<-obj5+theme(panel.background = element_rect(fill='lemonchiffon2'))
obj6+theme(legend.background = element_rect(fill = 'lightcyan4'))


############    Interacting with graphs: identifying points #########  

###   unfortunately the identify fxn doesnt work with latice and ggplot
###  we use other methods such as play with and iplots
plot(mtcars$wt, mtcars$mpg)
identify(mtcars$wt, mtcars$mpg, labels=row.names(mtcars))

install.packages("playwith", depend=TRUE) ###  couldnt install package
library(playwith)
library(lattice)
playwith(
  xyplot(mpg~wt|factor(cyl.f)*factor(am),
         data=mtcars, subscripts=TRUE,
         type=c("r", "p"))
)



library(latticist)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$gear <- factor(mtcars$gear)
latticist(mtcars, use.playwith=TRUE)

### iplots demonstration
find.java <- function() {
  for (root in c("HLM", "HCU")) for (key in c("Software\\JavaSoft\\Java Runtime Environment", 
                                              "Software\\JavaSoft\\Java Development Kit")) {
    hive <- try(utils::readRegistry(key, root, 2), 
                silent = TRUE)
    if (!inherits(hive, "try-error")) 
      return(hive)
  }
  hive
}
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_231') ### this worked

install.packages('rJava')
library(rJava)

library(iplots)
attach(mtcars)
cylinders <- factor(cyl)
gears <- factor(gear)
transmission <- factor(am)
ihist(mpg)
ibar(gears)
iplot(mpg, wt)
ibox(mtcars[c("mpg", "wt", "qsec", "disp", "hp")])
ipcp(mtcars[c("mpg", "wt", "qsec", "disp", "hp")])
imosaic(transmission, cylinders)
detach(mtcars)


install.packages("rggobi", depend=TRUE)
library(rggobi)
Sys.setenv(GGobi_HOME='C:/Program Files/ggobi') ### this worked
g <- ggobi(mtcars)

###########Advanced method for missing data 13/09/19#########################
y<-c(2,3,4,NA)
mean(y, na.rm =T)

install.packages(c("VIM", "mice")) 
data(sleep, package="VIM")

# list the rows that do not have missing values in data sleep data set
attach(sleep)
md<-sleep[complete.cases(sleep),]
length(md$BrainWgt)
str(sleep)

md<-mtcars[complete.cases(mtcars),] #every row has missing data set


# list the rows that have one or more missing values
md1<-sleep[!complete.cases(sleep),]

# TRUE and FALSE are equivalent to the numeric values 1 and 0,
sum(is.na(sleep$Dream))   #there are 12 missing values for the variable Dream

mean(is.na(sleep$Dream))

mean(!complete.cases(sleep))

sum(!complete.cases(sleep)) ### non missing values

sum(complete.cases(sleep)) ### missing values

### Exploring missing values patterns
### Tabulating missing values
install.packages('tidyr') ### install it as well
install.packages('mice')
library(mice)
data(sleep, package="VIM")
md.pattern(sleep)

### Exploring missing data visually
library("VIM")
aggr(sleep, prop=FALSE, numbers=TRUE)
aggr(sleep, prop=T, numbers=TRUE)

matrixplot(sleep)
### Here, you can see that there are no missing
### values on sleep variables (Dream, NonD, Sleep) 
### for low values of body or brain weight
### (BodyWgt, BrainWgt).

marginplot(sleep[c("Gest","Dream")], pch=c(20),
           col=c("darkgray", "red", "blue"))

x <- as.data.frame(abs(is.na(sleep))) ### return absolute values
aaa<-cor(x)
cl<-aaa[-c(1,2,8,9,10),-c(1,2,8,9,10)]

### Finally, you can look at the relationship between 
### the presence of missing values in a
### variable and the observed values on other variables:

options(digits = 2)
cl1<-cor(sleep, x, use="pairwise.complete.obs") ### not what i want
cl1[,-c(1,2,8,9,10)]

### Understanding the sources and impact of missing data

############ listwise deletion:############

### The function c omplete.cases() can be used to save the cases 
### (rows) of a matrix
### or data frame without missing data:

newdata <- mydata[complete.cases(mydata),]

### The same result can be accomplished with the n a.omit function:
newdata <- na.omit(mydata)

###  example
ptions(digits=1)
cor(na.omit(sleep)) ### withouth missing values
cor(sleep, use='complete.obs')   ### yields the same result

fit <- lm(Dream ~ Span + Gest, data=na.omit(sleep))
summary(fit)

##############   Multiple imputation 23/10/19 ##############   

library(mice)
data(sleep, package="VIM")
imp <- mice(sleep, m=5, maxit = 50, printFlag = T)

fit <- with(imp, lm(Dream ~ Span + Gest))
pooled <- pool(fit)
summary(pooled)

############  mine  ############
install.packages('gclus',repos='https://www.r-project.org')### installing a
### package from a specified resipotory
update.packages() ## package upadate


sum(is.na(data1$Dream))##tells us where u where data is missing in a (dream)
## column of the data set in total
mean(is.na(data1$Dream))
mean(!complete.cases(sleep)) ## mean of complete cases of missing value
sum(complete.cases(sleep)) ### number of non missing values
sum(!complete.cases(sleep)) ### cases of missing values



### how to read data--------------------------
read.delim(file.choose(),header = T)

































