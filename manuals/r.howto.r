# R language

##############################################
# Index
##############################################

# 1.- Package managing

# 2.- Help commands

# 3.- Object management

# 4.- Workspace and Files

# 5.- Factors

# 6.- Sequences of numbers

# 7.- Logical operators

# 8.- Vectors
#
# 8.1.- Create a vector
# 8.2.- Arithmetic operators (`+`, `-`, `*`, `/`, `^`, ...):
# 8.3.- Logical vectors: TRUE, FALSE, NA
# 8.4.- String vectors
# 8.5.- Search elements in vector / list
# 8.6.- Subsetting vectors
# 8.7.- Vector edition


# 9.- Missing Values in Objects
#
# 9.1.- NA
# 9.2.- NaN

# 10.- Matrices

# 11.- Data Frames
#
# 11.1 Construction
# 11.2 data access
# 11.3 getter functions
# 11.4 setter functions
# 11.5 sub-setting data frames

# 12.- Data Table



# 13.- Functions
#
# 13.2.- loop functions: Split-Apply-Combine methodology
# 13.3.- 'anonymous functions'


#     3.12.- probability distribution in R

#     3.13.- simulating random numbers (& permutations)

#     3.13.bis.- Dates & Times

#     3.14.- Base Graphics

#     3.15.- I/O
#     3.15.bis.- Download data from the Internet

#     3.16.- Manage image info

#     3.17.- Memory management

#     3.18.- Environments & assign operators

#     3.19.- Classes in R = functions on list of public methods

# 3.20.- Debugging
#
# 20.1.- Debug commands
# 20.2.- How to use:
# 20.3.- Error modes
# 20.4.- Recommended debugging routine.
# 20.5.-  Optimization

# 3.21.- Profiling (performance analysis) R Code


# Annex A.- R in emacs (OS X)

# Annex B.- References



#=============================================
# 1.- Package managing
#=============================================

## First select the download mirror
chooseCRANmirror()

# See packages
1a <- available.packages()
head(rownames(a), 3)
## [1] "A3"       "abc"      "abcdeFBA"

# Is a package already installed?
find.package("devtools")

# Install packages
install.packages("slidify")
install.packages(c("slidify", "ggplot2", "devtools"))

## Install from an external URL (i.e. bioconductor)
source("http://www.bioconductor.org/biocLite.R")

# or  bioclite()  to download all
bioclite(c("GenomicFeatures", "AnnotationDbi"))

# Loading Packages:
# this is necessary to make available installed packages
library(ggplot2) # example of loading the "ggplot2" package into R.
require(ggplot2) # idem library into a script (idem #include in C)

# Package version:
packageVersion("dplyr")

# Unloading Packages:
detach("package:ggplot2", unload=TRUE)


# Data Sets
# Loads specified data sets, or list the available data sets.
data(set_name)


#=============================================
# 2.- Help commands
#=============================================

# Access help file: ?<command>
?rnorm
?`:`   # operators must be enclosed in BACKTIPS (``) or regular quotes ("")

# Search help files
help.search("rnorm")

# Get arguments
args(rnorm)


# To remove all variables from R's memory, type
rm(list=ls())
# Remove variable x
rm(x)


#=============================================
# 3.- Object management
#=============================================

# type of object "integer", ...
class(LETTERS)
# to see what an object looks like internally
unclass(LETTERS)
str(unclass(LETTERS)) #to have a more compact view

# Test Objects for Exact Equality (if, while, ...)
identical(object_a, object_b)
# use identical instead "==" or "!=": see "?identical"

# Object detailed info
object.size(LETTERS)
typeof(LETTERS)

## Summarizing Data
# See data content (data-value info)
head(), tail(), summary(), quantile()
# See data structure (data-type info)
str()
# Handle data
table()


#WARNING It is possible to assign a value to a property of an object
names(vect2) <- c("foo", "bar", "norf")


#=============================================
# 4.- Workspace and Files
#=============================================

## R-files: *.R

getwd()
setwd()

#dir files in work dir
dir()

#type & value of every object in memory
ls()
ls.str()

#commands to use
list.
dir.
file.

unlink()     #recursive deletion: unlink("testdir2", recursive=TRUE) unlink is
             #the traditional Unix command for removing directories.

tempfile()


#=============================================
# 5.- Factors
#=============================================

# What is a factor: integer vector where each integer has a label
# HINT: equivalent to "enum" in C++

# Example.-
x <- factor(c("yes", "yes", "no", "yes", "no"))
class(x)
# [1] "factor"
x
# [1] yes yes no  yes no
# Levels: no yes


#=============================================
# 6.- Sequences of numbers
#=============================================

## ':' operator
15:1   ## [1] 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1
pi:10
## ?`:`

## seq(), seq_along(), rep()
seq(15, 1, by=-1.8)
my_seq <- seq(5, 10, length=5) ## [1]  5.00  6.25  7.50  8.75 10.00
seq(along.with=my_seq)         #  [1] 1 2 3 4 5
seq_along(my_seq)              #  [1] 1 2 3 4 5 built-in (optimized) function

## rep(): replicate
rep(c(0,1,2), times=5)         # [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2
rep(c(0,1,2), each=5)          # [1] 0 0 0 0 0 1 1 1 1 1 2 2 2 2 2


#=============================================
# 7.- Logical operators
#=============================================

## a) vectorized logical operators:  & |   : bit-wise operators for vector eval.

## b) non-vectorized operators:     && ||  : control-flow operators (if ...)


## WARNING non-vectorized (&& ...) over a vector: only evaluates the first
## element of the vector

a <- c(1, 2, 3)
## [1] 1 2 3
c <- c(1, 0, 0)
## [1] 1 0 0
a&c
## [1] TRUE FALSE FALSE
a&&c
## [1] TRUE
a|c
## [1] TRUE TRUE TRUE
a||c
## [1] TRUE

# 7.1.- Logical R functions

#isTRUE() function
isTRUE(a)  ## [1] FALSE
isTRUE(NA) ## [1] FALSE

# identical()
identical('twins', 'twins')

# xor()
xor(5==6, !FALSE)
## [1] TRUE


## 7.2.- operator precedence

## List of precedence groups, from highest to lowest.

## Within an expression operators of equal precedence are evaluated from left to
## right except where indicated.


:: :::	          access variables in a namespace

$ @	          component / slot extraction

[ [[	          indexing

^	          exponentiation (right to left)

- +	          unary minus and plus

:                 sequence operator

%any%	          special operators (including %% and %/%)

* /

+ -	          (binary) add, subtract

< > <= >= == !=	  ordering and comparison

!	          negation

& &&	          and

| ||	          or

~	          as in formulae

-> ->>	          rightwards assignment

<- <<-	          assignment (right to left)

=	          assignment (right to left)

?                 help (unary and binary)


#=============================================
# 8.- Vectors
#=============================================

## WARNING  R uses 'one-based indexing => vector first index = 1 # unlike C (0)

## WARNING  A single number is considered a vector of length one.


# 8.1.- Create a vector: c() function, which stands for 'concatenate' or
#       'combine'

c(1.1, 9, 3.14)


# a) vector indexing: + int, - int, named, logical, (subset)

# positive integer
LETTERS[c(3,5,7)]   # exact positions [1] "C" "E" "G"

# negative integer
LETTERS[c(-1,-3)] # = LETTERS[-c(1, 3)]  # = all but "A" (1) & "C" (3)

# 'named' elements.
vect <- c(foo = 11, bar = 2, norf = NA)
names(vect)
## [1] "foo"  "bar"  "norf"
names(vect) <- c("uno", "dos", "tres")
vect[c("uno", "dos")]
## uno dos
##  11   2

# Logical indexing
LETTERS[LETTERS <= "C"]
## [1] "A" "B" "C"

# subset indexing
LETTERS[10:12]
## [1] "J" "K" "L"



## WARNING  R doesn't prevent off-limits access

LETTERS[0]
## character(0)
LETTERS[3000]
## [1] NA



# 8.2.- Arithmetic operators (`+`, `-`, `*`, `/`, `^`, ...):

## Performed element-by-element (vectorized)

z<-c(1.1, 9, 3.14)
z*2+100
## [1] 102.20 118.00 106.28

## If the vectors are of different lengths, R recycles' the shorter vector
## until it is the same length as the longer vector.
c(1, 2, 3, 4) + c(0, 10)  # like  c(1, 2, 3, 4) + c(0, 10 , 0, 10)
## [1]  1 12  3 14


# 8.3.- Logical vectors: TRUE, FALSE, NA

num_vect <- c(0.5, 55, -10, 6)
tf <- num_vect<1                 # [1]  TRUE FALSE  TRUE FALSE

x <- c(TRUE, FALSE, NA)
y <- x[!is.na(x)] # only valid elements of a vector
y ## [1]  TRUE FALSE
y[y>0]      # positive values only ## [1] TRUE
subset(x, subset = x>0) #NA values are removed
## [1] TRUE


# 8.4.- String vectors

# paste: Concatenate vectors (VECTORIZED WAY) after converting to character.

## Usage:
##      paste (..., sep = " ", collapse = NULL)
##      paste0(..., collapse = NULL)            # more efficient paste(sep="")

## See Also:

##      ‘toString’ typically calls ‘paste(*, collapse=", ")’.  String
##      manipulation with ‘as.character’, ‘substr’, ‘nchar’, ‘strsplit’;
##      further, ‘cat’ which concatenates and writes to a file, and
##      ‘sprintf’ for C like string construction.

##      ‘plotmath’ for the use of ‘paste’ in plot annotation.

paste("James", "Bond", sep=";")
## [1] "James;Bond"

## (VECTORIZED WAY) means bits-wise concatenation:
paste(c("James", "John", "Peter"), c("Bond"), sep="-")
## [1] "James-Bond" "John-Bond"  "Peter-Bond"  # length=3

## 'collapse': result as one only vector
paste(c("James", "John", "Peter"), c("Bond"), collapse=";", sep="-")
# [1] "James-Bond;John-Bond;Peter-Bond"        # length=1


# 8.5.- Search elements in vector / list

is.element('b', LETTERS) # [1] FALSE
'B' %in% LETTERS         # [1] TRUE
match("B", LETTERS)      # [1] 2
grep("B", LETTERS)       # [1] 2

which(LETTERS == "C") # 3
any(LETTERS == "C")   # TRUE
all(LETTERS == "C")   # FALSE


# 8.6.- Subsetting vectors

# a) Using numeric range: [init : end]

x <- c(NA, 2.13, 0.83, NA, -0.34, 2, -1)
## [1]    NA  2.13  0.83    NA -0.34  2.00 -1.00
x[1:3]
## [1]   NA 2.13 0.83
y <- x[!is.na(x)]
## [1]  2.13  0.83 -0.34  2.00 -1.00


# b) Using logical range: [x > 0]
y[y>0]
## [1] 2.13 0.83 2.00
x[!is.na(x) & (x>=0)]
## [1] 2.13 0.83 2.00


# 8.7.- Vector edition

# a) Sorting: sort() , order()

## sorting by values: sort()
x
#[1]    NA  2.13  0.83    NA -0.34  2.00 -1.00
sort(x, decreasing=TRUE, na.last=T)
#[1]  2.13  2.00  0.83 -0.34 -1.00    NA    NA

## sorting by position: order()
order(x)
x
## [1] 7 5 3 6 2 1 4


## b) Split data
cut(x, 2)


#=============================================
# 9.- Missing Values in Objects
#=============================================

## 9.1.- NA: value 'not available'

## WARNING logical expressions using NA: NA is not really a value, but just a
## placeholder for a quantity that is not available => logical expressions are
## incomplete => (x == NA) = NA

## Functions:
##
## is.na()   # is.na(x)  AND
## na.omit()
## na.fail(object, ...)
## na.exclude(object, ...)
## na.pass(object, ...)
## complete.cases()

y <- rnorm(10)
z <- rep(NA, 10)
my_data<-sample(c(y,z), 10)
is.na(my_data) # [1] FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
(my_data==NA)  # [1] NA NA NA NA NA NA NA NA NA NA
my_na <- is.na(my_data)
print(my_na)

# HINT How to compute the total number of NAs in a data set. Trick: R
# represents TRUE as the number 1 and FALSE as the number 0 => sum(data)
sum(my_na)

# na.omit example.-
#my_raw_data
#
#         Date sulfate nitrate ID
# 1 2003-01-01       1      11  1
# 2 2003-01-02       2      11  1
# 3 2003-01-03      NA      NA  1
# 4 2003-01-04      NA      11  1
#
# > na.omit(my_raw_data)
#
#         Date sulfate nitrate ID
# 1 2003-01-01       1      11  1
# 2 2003-01-02       2      11  1


## 9.2.- NaN

0.0 / 0.0
## [1] NaN

Inf-Inf
## [1] NaN
Inf/Inf

#=============================================
# 10.- Matrices
#=============================================

## Used to store tabular data; rows & cols

# WARNING  Matrices: can only contain a single class of data.

# WARNING  Data Frames: can consist of many different classes of data.


## 10.1.- Matrices

# a) matrix() function

#    matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)

my_matrix <- matrix()
##      [,1]
## [1,]   NA
my_matrix <- matrix(1:20, nrow=4, ncol=5)


# b) dim() attribute   # a matrix is a vector with dim() attribute
my_matrix2 <- 1:20
dim(my_matrix2) <- c(4,5)  # [1] 4 5
attributes(my_matrix2)
identical(my_matrix, my_matrix2)  #[1] TRUE



#=============================================
# 11.- Data Frames
#=============================================

# excel table like

## data.frame(..., row.names = NULL,
##                 check.rows = FALSE,
##                 check.names = TRUE,
##                 stringsAsFactors = default.stringsAsFactors())

## 11.1 Construction

# a) data.frame()

     ## data.frame(..., row.names = NULL, check.rows = FALSE,
     ##            check.names = TRUE,
     ##            stringsAsFactors = default.stringsAsFactors())

(mydflet <- data.frame(x=1, y=1:5, fac = sample(LETTERS[1:3], 5, replace=TRUE)))
##    x  y fac
## 1  1  1   B
## 2  1  2   B
##     ...


# b) Creation from file

## mydf <- read.csv("data.csv")
## mydf <- read.table("data.csv", sep = ",", header = TRUE)
## fread("data.csv") #Similar to ‘read.table’ but FASTER and more convenient



## 11.2 data access

library(datasets); ## dataset example: dataset.airquality

# a) access to column:  '$' operator

mydf=airquality


# b) access to values:  '[]' operator

mydf[47, "Ozone"]


## 11.3 getter functions

is.data.frame(mydf)
str(mydf) #BEST data view # first line type & size,. ...
summary(mydf)  # mean, median, #NA's, ...

dim(mydf)
nrow(mydf)
ncol(mydf)
colnames(mydf)
rownames(mydf)
row.names(mydf)

mean(x=mydf$Ozone, na.rm=TRUE)


## 11.4 setter functions

# a) cbind()
(dd <- cbind(mydflet, char = I(letters[1:5]))) ## I(): do not convert to factor

# b) coercion
stopifnot(1:5 == row.names(mydflet))  # {coercion}

(d0  <- mydflet[, FALSE])   # data frame with 0 columns and 5 rows
(d.0 <- mydflet[FALSE, ])   # <0 rows> data frame  (3 named cols)
(d00 <- d0[FALSE, ])  # data frame with 0 columns and 0 rows

# c) colnames() edition
colnames(dd) <- c("xval", "yval", "factor", "fact_as_char")
dd

# d) Sorting data frames

## sorting rows/cols by values: sort()
sort(mydf[3, ], decreasing=TRUE, na.last=T)
sort(mydf$Ozone, decreasing=TRUE, na.last=T)

## sorting by position: order()
order(mydf[1:2])

# plyr::arrange
arrange(mydf, Ozone)


## 11.5 sub-setting data frames

## a) Implicit sub-setting: via [] operator

set.seed(13435)
mydflet <- data.frame("v1"=sample(1:5),"v2"=sample(6:10),"v3"=sample(11:15))
mydflet
mydflet <- mydflet[sample(1:5),]; # swapping rows
mydflet
##   v1 v2 v3
## 5  4  9 13
## 2  3  7 12

mydflet[, 1]                                    # by column number
mydflet[, "v1"]                                 # by column name
mydflet[(mydflet$v1 <= 3 & mydflet$v3 > 11), ]  # logical ands & ors
mydflet[which(mydflet$v2 > 8),]


## b) subset() function

subset(mydf, mydf$Ozone > 31 & mydf$Temp > 90)


# Selection using the Subset Function

newdata <- subset(mydf, Ozone>37 & Ozone < 40, select=Temp:Month)
newdata
##    Temp Month
## 41   87     6
## 93   81     8

newdata <- subset(mydf, Ozone>37 & Ozone < 40, select=c(Ozone, Temp:Month))
newdata
##    Ozone Temp Month
## 41    39   87     6
## 93    39   81     8

# warning select USAGE
#
# i.e. cols = { 1=Ozone, 2=Temp , ...}
#
# select = c(Ozone, Temp)          # OK ids
# select = c("Ozone", "Temp")      # OK id names
# select = c(1, 4)                 # OK numbers
# select = c(Ozone, 4)             # Error mixing ids & numbers
# select = c(Ozone, "Temp")        # Error mixing ids & id names
# select = c("Ozone", 2)           # Error mixing id names & numbers


#=============================================-------------------------
# 12.- Data Table
#=============================================-------------------------

library(data.table)

data.table() #{data.table package}
# Inherets from data.frame
# Much, much faster at subsetting, group, and updating

table(mydf$Ozone)
##
# table example.-
#
# > hd1
#         Date sulfate nitrate ID
# 1 2003-01-01      NA    3.33  1
# 2 2003-01-02      NA      NA  1
#



#see howto examples.-
#domument "getting_and_cleaning_data.notes.txt"
# example(data.table)


#=============================================-------------------------
# 13.- Functions
#=============================================-------------------------

## 13.2.- loop functions: Split-Apply-Combine methodology

lapply(object, function)   #returns a list

sapply()                   #same as lapply but returns a vector / matrix
# if the result is a list where every element is of length one, then sapply()
# returns a vector. If the result is a list where every element is a vector of
# the same length (> 1), sapply() returns a matrix. If sapply() can't figure
# things out, then it just returns a list, no different from what lapply()
# would give you.

vapply() # idem 'sapply' BUT the returned type can be specified EXPLICITLY.
# * Safer: If the result doesn't match the format you specify, vapply() will
# throw an error, causing the operation to stop.
# * Faster: vapply() may perform faster than sapply() for large datasets.
# i.e. vapply(the_object, unique, numeric(1))

tapply() #Apply a function over subsets of a VECTOR
#
# Example.- calculate the mean circumference of different Tree groups:
# > tapply(Orange$circumference, Orange$TreeType, mean)
#

apply(X, MARGIN, FUN, ...)
# Apply a function over the margins of an array
# It is most often used to apply a function to the rows or columns of a matrix
# It is not really faster than writing a loop, but it works in one line!
#
# MARGIN: E.g., for a matrix: 1=rows, 2=columns, c(1, 2) = rows and columns
# e.g. apply(x, 1, quantile, probs = c(0.25, 0.75))
#
# shortcuts:
# rowSums = apply(x, 1, sum) ; rowMeans; colSums; colMeans
#
# WARNING: The shortcut functions are much faster, but you won’t notice unless
# you’re using a large matrix.


mapply() #Multivariate version of lapply which applies a function in PARALLEL
	 #over a set of arguments
# e.g. instead of "list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))"
# we can do  "mapply(rep, 1:4, 4:1)"


split(x,f)  # divides the data in the vector x into the groups defined by f
            # common use with lapply.- lapply(split(x, f), mean)


# 13.3.- 'anonymous functions'

functions: has no name and disappears as soon as lapply() is done using it.
# example.- function(elem) elem[2])
# lapply(unique_vals, function(elem) elem[2]))


#=============================================-----
# 3.12.- probability distribution in R
#=============================================-----

# Each probability distribution in R has an :
# r*** function (for "random")
# d*** function (for "density")
# p*** (for "probability")
# q*** (for "quantile")
dbinom()
pbinom()
qbinom()
rbinom()

#=============================================-----
# 3.13.- simulating random numbers (& permutations)
#=============================================-----

set.seed() #Setting the random number seed with set.seed ensures REPRODUCIBILITY
           #CRITICAL! do always set.seed(SAME_NUMBER) at simulation begin

sample()
replicate()

# distributions (i.e. dnorm, pnorm, qnorm,rnorm)
d... : Density
p... : distribution function
q... : quantile function
r... : random generation

# Use examples.-

# simulate from probability distributions (rbinom, rnorm, rpois, ...)
rbinom(n, size, prob) # Binomial Distribution

# # Example.- number of heads in 100 flips of our unfair coin (prob head = 0.7)
# rbinom(1, size=100, prob=0.7)

# # Example.- example of 100 observations:
# sample(c(0,1), 100, replace=TRUE,prob = c(0.3, 0.7))
# rbinom(n = 100, size=1, prob=0.7)


#=============================================
# 3.13.bis.- Dates & Times
#=============================================

Sys.Date()
Sys.time()
POSIXct
POSIXlt
weekdays()
months()
quarters()
strptime() # converts character vectors to POSIXlt
difftime()
"lubridate" package #for more deep and detailed features
cbind()
rbind()



#=============================================-----
# 3.15.- Base Graphics
#=============================================-----

# data(object)   #before pot, load the object to plot
plot()
?par
?points
boxplot()
# boxplot(formula = mpg ~ cyl, data = mtcars) # OX = cyl; OY = mpg
hist()

# http://www.ling.upenn.edu/~joseff/rstudy/week4.html



#=============================================-----
# 3.15.- I/O
#=============================================-----

# WARNING  (more details in Getting_Cleaning_Data course notes.txt)


# outputs (cout like): standard output, file, ...
print()
cat()

# file
file()
sink()
close()
writeLines()


#=============================================
# 3.15.bis.- Download data from the Internet
#=============================================

download.file()
# Important parameters: url, destfile, method
dateDownloaded <- date()

# Example.-
url_value <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD";
destfile_value <- "./cameras.csv";
method_value <- "curl";
download.file(url = url_value, destfile = destfile_value, method = method_value)



# Download data from the Internet
download.file() # Important parameters: url, destfile, method

# Reading local (flat) files
read.table()  # read.table("data.csv", sep = ",", header = TRUE)
read.csv()    # read.csv("data.csv")
write.table(DT, file_name, row.names=F, col.names=TRUE, sep="\t", quote=FALSE)

# Reading & Writing (local) excel files
read.xlsx()  {xlsx package}
read.xlsx2() {xlsx package} # faster but can be unstable for reading for
			    # reading subsets of rows
write.xlsx() {xlsx package}

# Read Fixed Width Format Files
read.fwf()   {utils package}

# Reading & Parsing XML file
xmlTreeParse()  {XML package} # generates an XML tree
xmlRoot
xmlSApply() # Applies a function to each of the children of an XMLNode (wrapper
	    # of lapply)
xpathSApply()

# Reading JSON (Javascript Object Notation)
fromJSON()  {jsonlite package} # R <- JSON string, URL or file
toJSON()  {jsonlite package} # JSON <- R

## Connecting and listing databases RMySQL

{RMySQL package}
dbConnect()     # class MySQLConnection
dbDisconnect()
dbListTables()  # tables of a DB
dbListFields()  # fields of a table
dbReadTable()   # database table -> data frame
dbWriteTable()  # data frame -> database table
dbGetQuery()    # Send query, retrieve results and then clear result set
                # (data.frame)

{sqldf package}
dbSendQuery()
sqldf("select * from acs")

## Select a specific subset
dbSendQuery()   # only submits and synchronously executes the SQL statement to
dbFetch()       # the database engine.  It does _not_ extracts any records -
dbClearResult() # for that you need to use the function ‘dbFetch’, and then you
                # must call ‘dbClearResult’ when you finish fetching the
                # records you need.

## HDF5 (hierarchical data format)
h5createFile()
h5createGroup() ## Create groups
h5write()       ## Write a data set / write data to group / Modify data
h5read()        ## Reading data
h5ls(()         ## Observers

## Reading data from the web
readLines()

## library(httr);
GET() # See Example.- quizz2.R::q1()
stop_for_status()
content()
htmlParse()
handle()


#######################################################
# 3.16.- Manage image info
#######################################################

package {jpeg}

download.file(..., mode="wb") # as binary file
readJPEG()


##############################################
# 3.17.- Memory management
##############################################

tracemem() # Trace Copying of Objects
address()  # data.table,



#######################################################
# 3.18.- Environments & assign operators
#######################################################


# `<-` operator
# assign a value to a local variable (local to the current environment)

# `<<-` operator
#
# assign a value to an object declared in an extern (more global) environment
# than the current environment.


# Examples.-

  makeVector <- function(x = numeric())

  { # ENVIRONMENT  "makeVector" begin

      set <- function(y)
      {
	  # x is defined in an extern environment -> not a local variable
	  #
          # curent environment: set() method
	  # x environment:  makeVector  "class"

	  x <<- y   # let's call x1 to makeVector.x
      }

      get <- function()
      {
        return(x);  # Here x is x1
      }

    set_bis <- function(y)
      {
          # Here 'x' is a local parameter (set_bis.x)
          x <- y * 2;

          # # Here x is x1 (makeVector.x)
	  x <<- y;
      }


      list(set = set, get = get); #warning: R class = a list of methods

  } # ENVIRONMENT  "makeVector" end



#######################################################
# 3.19.- Classes in R = functions on list of public methods
#######################################################

## class = function = list of public methods
## (See "list" definition inside)

MyTestClass<- function(x = integer())
{

  # public methods: set, get
  # MUST be included in the "list" at the end.
  # MUST be defined before the "list".

  set <- function(new_value)
  {
    x <<- doble(new_value);
    y <<- new_value;
    cat("x = ", x, " ; y = ", y, "\n");
  }

  get <- function()
  {
    return (x);
  }


  # private method:
  # MUST NOT be included in "list"
  # MUST be defined before the "list".
  doble  <- function(x)
  {2*x;}


  # class = list of public methods
  list(set = set,
      get = get);


} # end of the "class" MyTestClass



##############################################
# 3.20.- Debugging
##############################################

# 3.20.1.- Debug commands

assertCondition ## package ‘tools’ is related and useful for testing.
## returns true on any condition (ERROR, WARNING, ...)
## false otherwise

stopifnot()  #assert like
stop()       #rise an error (like C++ throw()) -> use catch(error)
warning()    #rise an error (like C++ throw()) -> use catch(warning)

# Indications that something’s not right:
message()
warning()
error()
condition()

options(warn = 2) # Convert warnings to errors
options(warn = 0) # default value

# Debugging Tools in R:
#
# https://support.rstudio.com/hc/en-us/articles/200713843-Debugging-with-RStudio
#

traceback() # prints out the function call stack after an error occurs; does
            # nothing if there’s no error.

debug()     # flags a function for “debug” mode which allows you to step through
debugonce() # execution of a function one line at a time.

browser()   # suspends the execution of a function wherever it is called and
	    # puts the function in debug mode.

recover()   # allows you to modify the error behavior


trace()     # allows you to insert debugging code into a function at specific
	    # places.
findLineNum()
setBreakpoint()  # functions in the utils package work with line number
		 # references to compute locations for calls to trace().

# 3.20.2.- How to use:

* inside a function code:

function(x)
{
    ...

    browser(); #inserting a breakpoint

    if (x == 0) browser(); # Inserting conditional breakpoints in the code

    ...
}

a) from the console:

  1) debug(function_name), trace(function_name)
  2) function_name() #debug beginning

b) Commands debug/browse mode:

  n: next instruction
  s: step
  c: cont
  f: finish execution of the current loop or function
  Q: quit debug mode

  HINT: options(browserNLdisabled = TRUE) #disable ENTER key in debug mode


# 3.20.3.- Error modes

  options(error = browser) # session in debug mode (debug mode upon an error)
  options(error = recover) # recover mode upon an error
  options(error = stop)    # stop debug mode upon an error

# 3.20.4.- Recommended debugging routine.

1) traceback()

2) options(error=recover): this immediately switches into browser mode WHERE
   the error occurs,

3) debug(): step through the script line by line.

4) findLineNum() and setBreakpoint() functions.

# 3.20.5.-  Optimization

system.time()




#######################################################
# 3.21.- Profiling (performance analysis) R Code
#######################################################

system.time(expression)
proc.time()
  #  user  system elapsed
  # 2.502   0.005   2.524

# Improvement
#
# - Multi-threaded BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
#
# - Parallel processing via the parallel package


#
# The R Profiler:  Rprof()
#

## !!!!!!!!!!!!!!!!!!! !!!!!!!!!!!!!!!!! !!!!!!!!!!!!!! !!!!!!!!!!!!!!!!!
## !!
## !! DO NOT use system.time() and Rprof() together or you will be sad !!
## !!
## !!!!!!!!!!!!!!!!!!! !!!!!!!!!!!!!!!!! !!!!!!!!!!!!!! !!!!!!!!!!!!!!!!!

Rprof()
summaryRprof()

Examples.

Rprof(tmp <- tempfile())
example(glm)
Rprof()
summaryRprof(tmp)
unlink(tmp)



# See Also:
# The chapter on “Tidying and profiling R code” in “Writing R Extensions” (see
# the ‘doc/manual’ subdirectory of the R source tree).

# More detailed analysis of the output can be achieved by the tools in the CRAN
# packages proftools and profr: in particular these allow call graphs to be
# studied.




##############################################
# Annex A.- R in emacs (OS X)
##############################################

## 1.- Install emacss within ESS
    i.e. http://vgoulet.act.ulaval.ca/en/emacs/mac/

## 2.- Install / upgrade R (cran project)
http://ftp.heanet.ie/mirrors/cran.r-project.org/bin/macosx/

## 3.- Basic iESS commands

    C-Enter Execute Command

    Esc-p Previous Command (at command line)

    Esc-n Next Command (at command line)

    C-c C-v Get help on R/S object (enter name in

    C-c C-d Dump object or function to a Emacs buffer for editing

    C-c C-l Load file from buffer into R

    C-c C-f submit a Function in current buffer to R

    C-c C-j submit the current line in buffer to R

    C-c C-r submit the highlignted or marked region to R

    C-c TAB complete object/file name

    C-h m for help on ESS mode


    More help is available under the iESS menu in emacs:



##############################################
# Annex B.- References
##############################################

# Packages & manuals
http://cran.r-project.org/
http://www.bioconductor.org/ #packages for bio. apps.

# Using R in emacs
http://ess.r-project.org/Manual/readme.html

# Quick code reference
http://cran.r-project.org/doc/contrib/Short-refcard.pdf

# Advanced R
http://adv-r.had.co.nz/

# Debugging Tools in R:
https://support.rstudio.com/hc/en-us/articles/200713843-Debugging-with-RStudio

