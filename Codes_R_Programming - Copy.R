#Print 1 to 10 numbers
1:10
#Find avg
mean(1:10)

#Variable assignment
a = 5
a <- 5x=
5+2 -> a
a
b <- 4
a+b
# Vector is a 1 dimensional object & it should have same element
x <- 1:10
x
class(x) # Integer

x1 <- c(6.7,4,6,7,8,9)
x1

class(x1) # Numeric

a <- 5L
class(a)

x3 <- c("Guru", "Madhu", "Deepankar")
class(x3) # Character

x1[4] # to access a element of Vector

x1[1:4]

x1[c(2,4,6)] # to access 2nd, 4th and 6th element

length(x1) # to find out the length of vector

#Logical Vector

x4 <- c(TRUE, FALSE, TRUE, FALSE)
class(x4)
x4 <- c(TRUE, FALSE, TRUE, FALSE, T, F)

#Complex Vector

x5 <- c(2+3i, 3+1i, 1+2i)
class(x5)

x6 <- c(1,2, "Guru", "Madhu")
class(x6)
class(x6[1])

x1 <- c(1,2, TRUE, FALSE)
class(x1)

# Explicit Coercion

# Objects can be explicitly coerced from one class to another using the as.* functions, if available.

x <- 0:6
class(x)

as.numeric(x)

as.logical(x)

as.character(x)

x <- c("a", "b", "c")
as.numeric(x)

as.logical(x)

as.complex(x)

# Vectorised Operation

1:4
6:10

1:4 + 6:10

c(1,2,3,4,5) + c(6,7,8,9,10)
c(2,4,6,8) + c(1,2,3,4)

C(1,2,3,4,5) + c(6,7,8,9)
1:10 + 6:10
C(1,2,3,4,5,6,7,8,9,10) + c(6,7,8,9,10)
6:10
1:5

1:10+6:10
1:6+6:9
c(1,2,3,4)+c(6,7,8,9,10)

1:10
6:10

1:10 + 6:10
c(1,2,3,4,5,6,7,8,9,10) + c(6,7,8,9,10)

c(1,2)+c(2+3i, 3+1i)
1:5 - 6:10

# Comparison of Vectors

c(3,4-1,2+1,5-1,10-7) == 3
c(3,4-1,2+1,5-1,10-7) != 3
c(3,4-1,2+1,5-1,10-7) > 3
c(3,4-1,2+1,5-1,10-7) >= 3
c(3,4-1,2+1,5-1,10-7) < 3
c(3,4-1,2+1,5-1,10-7) <= 3

a1 <- 1:10
a1+3

b1 <- 11:20
b1 + 4

(a1*3) + (b1*4)

(a1*3) - (b1*4)

# Sequence of numbers

1:10

var <- seq(from=1, to=10, by=3)
var
seq(1,10,2)

# repeatation of numbers

rep(1:4, 4)

rep(1:4, each=4)

rep1 <- rep(1:4, 4)
class(rep1)

# Matrix

m1 <- 1:8
m1
class(m1)
dim(m1) <-c(2,4)
m1


m2 <- matrix(1:5,3,4)
m2

m2 <- matrix(1:8,2,4, byrow=TRUE) # Forming Matrix by row
m3 <- matrix(1:8,4,2)
m3

m4 <- matrix(1:7, 2,4)
m4 <- 1:7
m4

m3 <- matrix(1:4, 2,4)
m3

m3 <- matrix(1:20, 4,4)
m3[,2]

m3[1,2] # accessing an element from a Matrix

#Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.
x <- 1:3
y <- 10:12

cbind(x, y)
rbind(x, y)

# Array

my_array <- array(1:100, dim=c(2,4,5))
my_array
my_array[ , ,3] # All elements of 3rd matrix 
my_array[ ,3, ] # 3rd column of all matrix
class(my_array)
my_array[2, ,2]
class(my_array[2, ,2])

# Data Frames
data()
mtcars
View(mtcars)

salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url)
View(salary_data)
class(salary_data)

#List

List_of_Vecs <- list (x1,x3,x4,x5)

List_of_Vecs
class(List_of_Vecs)

List_of_Vecs [4]  # Accessing an element of a List
List_of_Vecs [[4]][1]

List_of_Vecs_Mat <- list (x1,x3,x4,x5,m3) # List of Vectors and Matrix
List_of_Vecs_Mat[[5]][2,]


List_of_Mat_DF <- list(m3, salary_data) # List of Matrix & DF

List_of_Mat_DF

length(List_of_Mat_DF)
List_of_Mat_DF[3] # Accessing an element of a List

New_DF <- as.data.frame(List_of_Mat_DF[2]) # Creating a new data frame
List_of_Mat_DF[2]
List_of_list <- list(List_of_Vecs,m3) # Viewing a list of list
List_of_list
New_DF

List_of_Vecs_Mat[[5]][1,2]

List_of_Vecs_Mat[[5]][4,2]

# Factor - Data structure that belongs to character

Gender_cols <- c("male", "female", "female", "female", "male", "unknown")
class(Gender_cols)
Gender_cols
Gender_cols_fac <- as.factor(Gender_cols) # Converting to factor
Gender_cols_fac
as.integer(Gender_cols_fac)

#Missing Values

is.na(mtcars$mpg)

## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)

## Return a logical vector indicating which elements are NA
is.na(x)

## Return a logical vector indicating which elements are NaN
is.nan(x)

## Now create a vector with both NA and NaN values
x <- c(1, 2, 0, NaN, NA, 4)
is.na(x)
is.nan(x)

x <- data.matrix(mtcars)
class(x)
x
dim(x)
View(x)

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)
names(x)
#sapply(x,class)

#Names
#R objects can have names, which is very useful for writing readable code and self-describing objects.
#Here is an example of assigning names to an integer vector.

x <- 1:3
names(x)

names(x) <- c("New York", "Seattle", "Los Angeles")
class(x)

#Lists can also have names, which is often very useful.
x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x
names(x)
#names(x) <- c("a","b","c")

#Matrices can have both column and row names.
m <- matrix(1:4, nrow = 2, ncol = 2)
m
dim(m)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
class(dimnames(m))
attributes(m)

#Column names and row names can be set separately using the colnames() and rownames()functions.

colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m


#Note that for data frames, there is a separate function for setting the row names, the row.names()function.
#Also, data frames do not have column names, they just have names (like lists).

#Subsetting R Objects

#There are three operators that can be used to extract subsets of R objects.

#The [ operator always returns an object of the same class as the original. It can be used to
#select multiple elements of an object

#The [[ operator is used to extract elements of a list or a data frame. It can only be used to
#extract a single element and the class of the returned object will not necessarily be a list or
#data frame.

#The $ operator is used to extract elements of a list or data frame by literal name. Its semantics
#are similar to that of [[.


x <- matrix(1:6, 2, 3)
x[1,]


x[1, 2, drop = FALSE]
x[1,2]
x[1, , drop = FALSE]

x <- list(foo = 1:4, bar = 0.6)
x$foo

x$bar

#Nested List
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[1]][3]

#or

x[[c(1, 3)]]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")

x[c(1, 3)]
#or
x[[c(1, 3)]]

#Removing NA Values




x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)
y <- x[!bad]

#What if there are multiple R objects and you want to take the subset with no missing values in any
#of those objects?

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", NA, NA, "d", NA, "f")
good <- complete.cases(x, y)
good

x[good]
y[good]

airquality

is.na(airquality$Solar.R)
colSums(is.na(airquality))
which(is.na(airquality$Solar.R))
View(airquality)
good <- complete.cases(airquality)
class(good)
head(airquality[good, ])

salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url)
class(salary_data)
salary_data
View(salary_data)

dim(salary_data) # to find dimension of a table
  
str(salary_data) # structure of salary data

# rows = Observations, columns = variables, Features (ML)

salary_data_1 <- read.csv(salary_url, stringsAsFactors = FALSE) # To recognise string as a char not factor
salary_data_1
salary_data
str(salary_data_1)
str(salary_data)


salary_data$team # To access a column from DF
class(salary_data_1$team)

salary_data_1$team <- as.factor(salary_data_1$team) # converting char to factor
class(salary_data_1$team)

head(salary_data) # By default first 6 observations
head(salary_data, 10) # First 10 observations

tail(salary_data) # Bottom 6 observations

ncol(salary_data) # Number of columns
nrow(salary_data) # number of rows

length(salary_data)

#  Subsetting of Data

salary_data_2 <- salary_data[25:45, ] # To access 25 to 45 rows of all the columns
View(salary_data_2)

# Record number 23, 45, 100,200,3000

salary_data_3 <- salary_data[c(23,45,100,200,3000), ]
salary_data_3

salary_data_4 <- salary_data[ , c(5,7,10,12)] # Accessing columns
salary_data_4

salary_data_5 <- salary_data[ , -12] # To eliminate a perticular column
View(salary_data_5)
dim(salary_data_5)

names(salary_data)
library(Amelia)

# Intelligent Subsetting

unique(salary_data_1$player) # To identify unique subsets
unique(salary_data_1$team)
salary_data_6 <- subset(salary_data, salary_data$team == "Detroit Pistons") # To select the records of a perticular Column
View(salary_data)
salary_data_7 <- subset(salary_data, salary_data$team == "Detroit Pistons" & salary_data$salary_year>600000)
salary_data_7 <- subset(salary_data, salary_data$team == "Detroit Pistons" & salary_data$salary_year>600000 & salary_data$contract_years_remaining <=2)

salary_data_7 <- subset(salary_data, salary_data$team == "Detroit Pistons" & salary_data$salary_year>600000 & salary_data$contract_years_remaining >7)
salary_data_7

# Paste

n1 <- paste("Guru", "Madhu", sep = "_")
n1
View(salary_data)

salary_data$newcols <- paste(salary_data$team, salary_data$year, sep = "*") # To join two columns together seperated by a value

View(salary_data$newcols)

salary_data$newcols <- NULL # To drop the new column created

#Assignment 3

#Keep the new col in the third order instead of last

# join rows of two data frames

salary_data_9 <- rbind(salary_data_2, salary_data_3) # Column names & number of cols present in both DF should be same
salary_data_10 <- cbind(salary_data_4, salary_data_5) # Number of rows should be equal

View(salary_data_10)


# Assignment

# I want to combine 2 data frames which has unequal rows and columns
# smartbind


# Functions in R

sessionInfo() # To see the R version details

# Sorting

sort_vec <- c(1,5,2,6,8,10,12,20)
sort_vec1 <- sort(sort_vec)

sort_vec1

sort_vec2 <- sort(sort_vec, decreasing = TRUE) # Decsending order
sort_vec2


# Order

sort_vec3 <- order(sort_vec)
sort_vec
sort_vec3

sort_vec4 <- order(-sort_vec3)

sort_vec4 


salary_data_11 <- salary_data

salary_data_11$salary_year <- sort(salary_data$salary_year)
salary_data_11

salary_data_11 <- salary_data[1:10, ]
salary_data_11

View(salary_data_11)

salary_data_11$salary_year <- sort(salary_data_11$salary_year)

order(salary_data$salary_year)


salary_data_new <- salary_data[order(salary_data$salary_year), ]

View(salary_data_new)

salary_data_new <- salary_data[order(-salary_data$salary_year), ] # Descending order

salary_data_new1 <- salary_data[order(salary_data$contract_years_remaining, salary_data$salary_year), ]
View(salary_data_new1) # Sorting two columns

salary_data_new1 <- salary_data[order(salary_data$contract_years_remaining, -salary_data$salary_year), ]

# Functions

char_vec <- c("Guru", "Deepankar", "Madhu")

toupper(char_vec) # Uppercase
tolower(char_vec)  # Lowercase

# Assignment

#Add 2 coluns for Team where one column having all the name in uppercase and vice versa

# Substring Functions

my_string <- "gurudeepankarmadhupavan"
length(my_string)

my_string_sub <- substring(my_string, 5,15)

my_string_sub

nchar(my_string)

salary_data$year1 <- substring(salary_data$year, 1,4)

salary_data$year1


# Assignment 

# Get last 4 char of the column " Team"
# Hint : nchar

my_string_sub_1 <- substring(my_string, (nchar(my_string)-7), nchar(my_string))
my_string_sub_1


# Substitute functions


x1 <- c("R tutorial", "data science tutorial", "c tutorial")
x1

x2 <- sub("tutorial","training", x1)
x2


x3 <- c("R tutorial c tutorial ds TUTORIAL", "data science tutorial r tutorial", "c tutorial r tutorial")
x3

x4 <- sub("tutorial","training", x3)
x4

x5 <- gsub("tutorial","training", x3) # Group Substitution
x5

x5 <- gsub("tutorial","training", x3, ignore.case = TRUE) # To ignore case

# Pattern Matching

country_name <- c("America", "United States of America", "Americas", "china", "Japan")

pattern <- "America"

grep(pattern, country_name)
country_name [grep(pattern, country_name)] <- "My America"
country_name 

grepl(pattern, country_name) # To see logical outpout for pattern matching

# String Split

my_string <- "I love working on R ; and packages it offers"

x <- strsplit(my_string, ";") # Splitting words based on semi colon, coma


#Data Import & Export
#read.table, read.csv, for reading tabular data
#readLines, for reading lines of a text file
#source, for reading in R code files (inverse of dump)
#dget, for reading in R code files (inverse of dput)
#load, for reading in saved workspaces
#unserialize, for reading single R objects in binary form

#write.table, for writing tabular data to text files (i.e. CSV) or connections
#writeLines, for writing character data line-by-line to a file or connection
#dump, for dumping a textual representation of multiple R objects
#dput, for outputting a textual representation of an R object
#save, for saving an arbitrary number of R objects in binary format (possibly compressed) to a file.
# serialize, for converting an R object into a binary format for outputting to a connection (or file).

#Read the help("read.table") document
?mean
??apriori
data(package = .packages(TRUE))
data()
help("mtcars")
library(Amelia)
data("diamonds")
diamonds

# Loading Barley package which is a part of another package "Lattice"

data("barley", package = "lattice")
dim(barley)
View(barley)
head(barley)
ncol(barley)
length(barley)

# Loading a text file

# 2nd Option
d = read.table("E:/New folder/R_EB/auto1.txt", sep = "\t", header = TRUE)

View(d)

# Option 1
file_path <- "C:\\Users\\User\\Desktop\\R_EB\\auto1.txt"
d = read.table(file_path, sep="\t")

# Create a batch file through which you can write a file into R
#install.packages("lerningr")
library(learningr)

getwd()
setwd()

deer_file <- "C:/Users/Pavan/Documents/R/win-library/3.4/learningr/extdata/RedDeerEndocranialVolume.dlm"
deer_data <- read.table(deer_file, header = TRUE, fill = TRUE)
deer_data
ncol(deer_data)
str(deer_data)

# reading a CSV file

crab_data <- read.csv("C:/Users/Pavan/Documents/R/win-library/3.4/learningr/extdata/crabtag.csv", header = FALSE, skip = 4, nrows = 8)
crab_data

write.csv(salary_data,"sal8.csv")
# XLSX File
library(openxlsx)
My_xl <- read.xlsx("E:/New folder/R_EB/sample.xlsx")
# Text file
the_tempest <- readLines("C:/Users/Pavan/Documents/R/win-library/3.4/learningr/extdata/Shakespeare.s.The.Tempest..from.Project.Gutenberg.pg2235.txt")
the_tempest[1:100]
# XML File
library(XML)
r_options <- xmlParse("C:/Users/User/Documents/R/win-library/3.3/learningr/extdata/options.xml")
View(r_options)
library(jsonlite)
dat.1 <- fromJSON("C:/Users/Pavan/Documents/R/win-library/3.4/learningr/extdata/Jamaican.Cities.json")
dat.1
#The analogous functions in readr are read_table() and read_csv().

#Using dput() and dump()

## Create a data frame
y <- data.frame(a = 1, b = "a")
y
row.names(y) <- "f"

a <- url("https://www.indiatimes.com/")
b <- readLines(a,10)
b

x <- 1:4
y <- 6:9
z <- x + y

#Vectorized Matrix Operations
x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)

x*y

x / y
  
# Dates and Times
 
# Dates are represented by the Date class and times are represented by the POSIXct or the POSIXlt class.

#Dates are represented by the Date class and can be coerced from a character string using the as.Date() function.

## Coerce a 'Date' object from character

x <- as.Date("1970-01-01")
x
class(x)

#You can see the internal representation of a Date object by using the unclass() function.

unclass(x)

unclass(as.Date("2018-04-3"))

x <- Sys.time()

class(x)
unclass(x)


p <- as.POSIXlt(x)

names(unclass(p))

p$hour
p$mday

#You can also use the POSIXct format.

x <- Sys.time()
x
## Internal representation
names(unclass(x))
## Can't do this with 'POSIXct'!
x$sec 

#strptime() function in case your dates are written in a different format.
#strptime() takes a character vector that has dates and times and converts them into to a POSIXlt object.

datestring <- c("January 10, 2012 10:40", "March 29, 2018 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
class(x)
unclass(x)
x$wday

#Operations on Dates and Times

x <- as.Date("2012-01-01")

y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
class(y)
x-y # Error

x <- as.POSIXlt(x)
x-y
# Time classes keeps track of Leap years, leap seconds etc.

x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y

## My local time zone
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x


View(mtcars)
colSums(is.na(mtcars))
dim(mtcars)
str(mtcars)
summary(mtcars)

mean(mtcars$mpg)
?mtcars

fivenum(mtcars$mpg)

summary(mtcars$mpg)
summary(mtcars)

boxplot(mtcars$mpg)

IQR(mtcars$mpg) # Inter Quadrile Range

mtcars1 <- edit(mtcars)
View(mtcars1)

summary(mtcars1$mpg)
IQR(mtcars1$mpg)

boxplot(mtcars1$mpg)
b2 <- boxplot(mtcars1$mpg)
b2$out

max(mtcars$mpg)

# Bi variate analysis on MPG and Cyl column
boxplot(mtcars$mpg~mtcars$cyl)
fivenum(mtcars$mpg,mtcars$cyl)
b1 <- boxplot(mtcars$mpg~mtcars$cyl)
b1$out

data("airquality")
head(airquality)
dim(airquality)
tail(airquality)
is.na(airquality$Ozone) #To find missing value 

which(is.na(airquality$Ozone)) # Position of missing values

length(which(is.na(airquality$Ozone))) # Number of missing values

length(which(is.na(airquality$Ozone)))/nrow(airquality) # Percentage of missing values

round(length(which(is.na(airquality$Ozone)))/nrow(airquality),2) # To round it by 2 digits

mean(airquality$Ozone)

mean(airquality$Ozone,na.rm = TRUE) # To count mean value ignoring the missing values

airquality$Ozone[which(is.na(airquality$Ozone))] <- mean(airquality$Ozone, na.rm = TRUE)
View(airquality) # Replacing the missing values with mean value

colSums(is.na(airquality)) # To find out missing values in all the column
colSums(is.na(airquality))/nrow(airquality) # Percentage
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg")
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", col="red")
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", 
        col=c("blue", "yellow", "rosybrown1"))
colors()
par(bg="skyblue") # To apply background color
colors()

png(file ="boxplotGElatest1.png")
boxplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", 
        col=c("turquoise4", "tomato2", "pink3"))
getwd()

dev.off()

png(file = paste("boxplot1", Sys.Date(),".png"))
png(file = paste("boxplot1", Sys.time(),".png")) # Assignment 

library(lattice)
bwplot(mtcars$mpg~mtcars$cyl, main = "BoxPlot b/w mpg and Cyl", xlab = "Cyl", ylab = "mpg", 
       col=c("blue", "yellow", "rosybrown1")) # Box Whisker Plot
bwplot(iris$Petal.Length ~ iris$Species)
View(iris)

?iris
head(iris)

library(ggplot2) 
qplot(iris$Species, iris$Petal.Length, geom = "boxplot") 

hist(mtcars$mpg) # Histogram
hist(mtcars$mpg, labels = TRUE)
hist(mtcars$mpg, breaks = 10, labels = TRUE)

plot(mtcars$mpg) # Scatter Plot is preferred for bi variate analysis
plot(mtcars$mpg, mtcars$wt)

plot(mtcars$mpg, mtcars$disp, type = "l") # Line chart, not preferred for Bi variate
plot(mtcars$mpg, type = "l")

plot(mtcars$mpg, type = "h")

plot(mtcars$mpg, type = "b")

plot(mtcars$mpg, type = "o")

par(mfrow = c(2,2))

plot(mtcars$mpg, type = "b")

plot(mtcars$mpg, type = "h")
plot(mtcars$mpg, type = "h")
plot(mtcars$mpg, type = "o")
plot(mtcars$mpg, type = "l")
plot(mtcars$mpg, type = "h")

plot(mtcars$mpg, type = "b")

plot(mtcars$mpg, type = "o")
plot(mtcars$mpg, type = "o")


plot(mtcars$mpg)

plot(mtcars$mpg, pch = 2)
plot(mtcars$mpg, pch = 3)
plot(mtcars$mpg, pch = 6)
plot(mtcars$mpg, pch = 18, col = "red")
plot(mtcars$mpg, pch = 14, col = "blue")

plot(mtcars$mpg, pch = c(as.factor(mtcars$mpg)))
par(mfrow = c(1,1))

plot(mtcars$mpg, type = "l")

