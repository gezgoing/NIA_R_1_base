# B. R에서 자료 타입에 따른 data manipulation - Part 2

## B.4 데이터프레임(Data frame) 

x <- c(100, 75, 80)
y <- c("A302043", "A302044", "A302045")
z <- data.frame(score=x, ID=y)

dat.1 <- data.frame(x=1:3, y=c('a', 'b', 'c'))
str(dat.1)
dat.2 <- data.frame(x=1:3, y=c('a', 'b', 'c'), stringsAsFactors=F)
str(dat.2)

typeof(dat.2)           # list
class(dat.2)            # data frame
is.data.frame(dat.2)    # TRUE

N <- 1000000
dat <- data.frame(initial=character(N),
                  dosage=numeric(N),
                  blood=factor(N, levels=c("O", "A", "B", "AB")),
                  response=numeric(N) )

str(faithful)
faithful[[1]]
faithful$waiting

library(MASS)  # for dataset Car93
subset(Cars93, subset=(MPG.city > 32))
subset(Cars93, select=Model, subset=(MPG.city > 32))

x <- data.frame(a=1:5, b=c(1,2,NA,4,5))
cumsum(x)           # fails
cumsum(na.omit(x))

str(EuStockMarkets)
cor(EuStockMarkets)
cor(subset(EuStockMarkets, select=-SMI))  # SMI excluded
cor(subset(EuStockMarkets, select=-c(SMI, CAC)))  # SMI and CAC excluded

a <- data.frame(x=c(5, 10, 15), y=c("a", "b", "c"))
b <- data.frame(z=c(10, 20, 30))
cbind(a, b)

a1 <- data.frame(x=c(20, 25, 30), y=c("d", "e", "f"))
rbind(a, a1)

a <- data.frame(Name=c("Mary", "Jane", "Alice", "Bianca"), score=c(90, 95, 100, 100))
b <- data.frame(Name=c("Jane", "Alice", "Ana"), weight=c(70, 55, 60))
merge(a, b, by="Name")
merge(a, b, by="Name", all=T)

z <- (Cars93$Price-mean(Cars93$Price))/sd(Cars93$Price)  # Cars93$... 지저분...
head(z)
z <- with(Cars93, (Price-mean(Price))/sd(Price))         # 깔끔...
head(z)




## B.5 Factor

blood.type <- factor(c("A", "A", "AB", "O", "O"), levels=c("A", "B", "AB", "O"))
table(blood.type)

blood.type <- c("A", "B", "AB", "O", "O")
table(blood.type)




## B.6 데이터 타입 변환하기

x <- 1:3
y <- as.character(x)
y
as.numeric(y)




## B.7 데이터 입맛대로 변형하기

library(MASS)    # for the dataset Cars93
summary(Cars93)
tmp <- split(Cars93$MPG.city, Cars93$Origin)   # grouping by 'Origin'
str(tmp)                                       # List of 2

Jeong <- list(first.name="Samuel", age=44, gender="M", n.child=2, child.gender=c("M", "F"))
lapply(Jeong, length)   # returns a list
sapply(Jeong, length)   # returns a vector

a <- matrix(1:20, 4, 5)
a
apply(a, 1, mean)    # to every row
apply(a, 2, mean)    # to every column

with(Cars93, tapply(Price, Origin, mean)) # tapply(Cars93$Price, Cars93$Origin, mean) 과 같은 결과

by(Cars93, Cars93$Origin, summary)




## B.8 문자열과 날짜 변수

nchar("ABC")
length("ABC")
nchar(c("A", "B", "C"))
length(c("A", "B", "C"))

paste("A", "B", "C")           # default separator: " "
paste("A", "B", "C", sep="")
paste("A", "B", "C", sep="/")

substr("12345678", start=5, stop=7)

cities <- c("New York, NY", "Los Angeles, CA", "Peoria, IL") 
substr(cities, start=nchar(cities)-1, stop=nchar(cities))  # extract last two characters

path <- "/home/data/test.csv"
strsplit(path, "/")

path <- c("/home/data/test1.csv", 
          "/home/data/test2.csv",
          "/home/data/test2.csv")
strsplit(path, "/")

Sys.Date()
class(Sys.Date())   # The class of the result from Sys.Date() is...

as.Date("2015-10-09")   # standard format
as.Date("10/09/2015")   # error (not in a standard format)
as.Date("10/09/2015", format="%m/%d/%Y") # American date format
as.Date("10/09/15", format="%m/%d/%y") # 2-digit year

format(Sys.Date())
as.character(Sys.Date())
format(Sys.Date(), format="%m/%d/%Y")
as.character(Sys.Date(), format="%m/%d/%y")
format(Sys.Date(), format="%b/%d/%y")    # %b: Abbreviated month name
format(Sys.Date(), format="%B %d, %Y")   # %B: Full month name

ISOdate(2015, 10, 9)   # year, month, day
as.Date(ISOdate(2015, 10, 9))
ISOdate(2015, 2, 29)   # an invalid date

years <- 2011:2015
months <- rep(1, 5)
days <- c(4, 9, 14, 19, 24, 29)
as.Date(ISOdate(years, months, days))
as.Date(ISOdate(years, 1, days))     # 재사용 규칙

d <- as.Date("2015-10-09")
p <- as.POSIXlt(d)
p$year
p$mon      # Month (0 = January)
p$mday     # Day of the month

s <- as.Date("2015-10-01") 
e <- as.Date("2015-10-10") 
seq(from=s, to=e, by=1)
seq(from=s, by=1, length.out=7)
seq(from=s, by="month", length.out=12)
seq(from=s, by="3 months", length.out=4)
seq(from=s, by="year", length.out=5)

