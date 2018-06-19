#Print 1 to 10 numbers
1:10
#Find avg
mean(1:10)
?mean
#Variable assignment
a = 5
a <- 5
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

m1 <- 1:7
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
dim(salary_data)
is.na(salary_data)
View(salary_data)
head(salary_data)
tail(salary_data)
paste(salary_data)
#Name
x<-c("indai","francse","japan")
x
dim(x)
names(x)<-c("chandan","aayansh","ritik")
class(x)
