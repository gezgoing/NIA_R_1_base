# C. 데이터 입출력   

## C.1 데이터 입력  

x <- scan()
1
2
3

x

x <- scan(file="c:/mydata/data_x.txt")
y <- matrix(scan("c:/mydata/data_y.txt"), ncol=3, byrow=T)

x <- read.table(file="table.txt", header=T, sep=" ")

x <- read.csv(file="table.csv", header=T)

read.spss("data.sav", to.data.frame=T)

library(MASS)
data(geyser) 

# Want the list of built-in datasets contained in the currently loaded packages? Just type data()
data()




## C.2 데이터 내보내기

x <- 1:3
print(x)

x <- seq(from=0, to=1, by=0.1)
write(x, file="output.txt")

x <- matrix(1:20, 4, 5)
write.table(x, file="table.txt")

write.csv(faithful, file="faithful.csv")




#==============================================
# D. 간단한 도표를 이용한 자료 요약

## D.1 질적 자료(Qualitative data)의 요약

# Beer Preference example
beer <- c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 
          1, 2, 3, 2, 3, 1, 1, 1, 1, 4, 3, 1)
# (1) Domestic can  (2) Domestic bottle, 
# (3) Microbrew     (4) Import

barplot(table(beer))

barplot(table(beer)/length(beer),                                   # 상대도수 
        col=c("lightblue", "mistyrose", "lightcyan","cornsilk"),    # 막대 색깔 
        names.arg=c("Domestic\n can", "Domestic\n bottle", "Microbrew\n", "Import\n"),  # 막대 라벨 
        ylab="Relative frequency",  
        main="Beer Preference Survey")

beer.counts <- table(beer) # store the table result
pie(beer.counts) # first pie -- kind of dull
names(beer.counts) <- c("Domestic\n can","Domestic\n bottle", "Microbrew","Import") # give names
pie(beer.counts) # prints out names




## D.2 양적 자료(Quantitative data)의 요약
# Stem-and-leaf plot
scores <- c(2, 3, 16, 23, 14, 12, 4, 13, 2, 0, 0, 0, 6, 28, 31, 14, 4, 8, 2, 5)
stem(scores)

x <- rnorm(1000)  # To generate 1,000 random numbers from N(0,1)
hist(x, xlab="data")

hist(x, probability=T, xlab="data", col="gray", border="white")
z <- seq(from=-3, to=3, by=0.01)      # N(0,1)의 밀도함수 곡선을 위한 grid 잡기
lines(z, dnorm(z), col=2)             # 빨간 색으로 N(0,1)의 밀도함수 곡선 덧그리기

growth <- c(75,72,73,61,67,64,62,63) # the size of flies
sugar <- c("C","C","C","F","F","F","S","S") # diet
fly <- data.frame(growth=growth, sugar=sugar)
boxplot(fly$growth)
boxplot(fly$growth~fly$sugar)

# cars: built-in dataset with the speed of cars and the distances taken to stop
plot(cars$speed, cars$dist, 
     col="blue", pch="+", 
     ylab="Distance taken to stop", xlab="Speed", 
     ylim=c(-20, 140))

with(cars, plot(speed, dist, 
                col="blue", pch=20, 
                ylab="Distance taken to stop", xlab="Speed", 
                ylim=c(-20, 140)))




#=========================================
# E. 프로그래밍

## E.1 조건문

x <- 10
if (x < 3) print("x < 3") else print("x >= 3")

y <- -3:3
z <- ifelse(y < 0, -1, 1) 
cbind(y, z)

x <- 4
if ( x < 3 ) {
  print("x<3")
  z <- "M"
} else {
  print("x>3")
  z <- "F"
}




## E.2 반복문

n <- 10
x <- 1:n
sum.so.far <- 0
for ( i in 1:n ) {
  sum.so.far <- sum.so.far + x[i]
  print(sum.so.far)
}
sum.so.far

n <- 0
sum.so.far <- 0
while ( sum.so.far <= 1000 ) {
  n <- n+1
  sum.so.far <- sum.so.far + n
}
print(c(n, sum.so.far))
sum(1:45)

n <- 0
sum.so.far <- 0
while (1) {          # 조건문 자리에 1(TRUE와 동일한 효과)이 있으므로 무한루프 
  if(sum.so.far > 1000) break
  n <- n+1
  sum.so.far <- sum.so.far + n
}
print(c(n, sum.so.far))

n <- 100000000
x <- 1:n
system.time(y <- x)
system.time(for (i in 1:n) y[i] <- x[i])




## E.3 나만의 R함수 만들기

my.stat <- function(x){
  m <- mean(x)
  s <- sd(x)
  res <- list(m=m, s=s)
  
  par(mfrow=c(1, 2))
  boxplot(x, main="Boxplot", horizontal=T)
  hist(x, prob=T, col="skyblue", border="white", main="Histrogram", xlab="data")
  
  return(res)
}

dat <- rnorm(1000, mean=3, sd=1)
my.stat(x=dat)

