# B. R에서 자료 타입에 따른 data manipulation - Part 1

## B.1 벡터(Vector)

x <- c(1, 2.5, 3.2)                    # double
y <- c(1L, 2L, 3L)                     # integer
z <- c("KTX", "Saemaul", "Mugunghwa")  # string
v <- c(TRUE, FALSE, FALSE, TRUE)       # logical

x[3]             # x의 세 번째 성분 
x[c(1,3)]        # x의 첫 번째, 세 번째 성분을 추출한 부분 벡터

fruit <- c(5, 3, 2)
names(fruit) <- c("apple", "orange", "peach")
fruit
fruit[c("apple", "peach")]
fruit <- setNames(c(5, 3, 2), c("apple", "orange", "peach"))

typeof(x)                              # double
is.double(x)                           # TRUE
as.double(y)                           # as.integer(x)
is.numeric(z)                          # FALSE
as.numeric(v)                          # 1 0 0 1
length(x)                              # length of x

a <- c(1, 2, 3)
b <- c(5, 6) 
x <- c(a, 4, b)                     # x <- c(1,2,3,4,5,6)

a[7] <- 2                           # assign to the 7th element
a

append(x, 99, after=3)    # x의 세 번째 성분 다음에 99 삽입
append(x, -99, after=0)   # x의 맨 앞에 -99 삽입

x <- seq(from=0, to=1, by=0.1)       # 0부터 1까지 0.1씩 증가하는 등차수열
y <- seq(from=0, to=1, length=11)    # 0부터 1까지 길이가 11인 등차수열
z <- 1:10                            # 1, 2, 3, ... , 9, 10
5:-5                                 # 5, 4, 3, ... , -4, -5
rep(1, 10)

x <- 1:3; y <- c(2,2,2)
x+y
x-y
x*y
x/y
x^y

z <- rep(2, 5)
x+z           # c(1, 2, 3, 1, 2) + c(2, 2, 2, 2, 2)와 같은 효과

y-3

x <- 1:10; y <- rep(5, 10)
z <- x<5        # less than
sum(z)
x<=5            # less than or equal to
x==5            # equal
x!=5            # not equal
(x>5)&(y<2)     # and
(x<5)|(y<2)     # or

x <- rnorm(10)
x
y <- 1:10
y
z <- -5:4
z

max(x)      # 최대값
min(x)      # 최소값
sum(x)      # 모든 성분의 합
prod(x)     # 모든 성분의 곱
mean(x)     # 평균
median(x)   # 중앙값
range(x)    # 최대값과 최소값
quantile(x, probs=c(0.2, 0.7))      # 분위수
var(x)      # 분산
sd(x)       # 표준편차
cov(x, y)   # 공분산
cor(x, y)   # 상관계수

x
sort(x)     # sort (or order) a vector or factor (partially) into ascending or descending order
rank(x)     # returns the sample ranks of the values in a vector
order(x)    # returns a permutation which rearranges its first argument into ascending or descending order
x[order(x)] # sort(x)와 같은 효과
cumsum(x)   # 누적합
cumprod(x)  # 누적곱
cummax(x)   # 누적최대값
cummin(x)   # 누적최소값
pmax(x, y, z)  # 성분별 최대값
pmin(x, y, z)  # 성분별 최소값

x <- c(1, 2, 3, NA, 5)
is.na(x)

x <- -10:10
x[3]          
x[1:3]
x[c(1,3,5)]
x[-1]
x[-c(1,3,5)]
y <- x[x<0]             # x에서 음수인 성분을 추출해 y에 할당
x[x<0] <- -x[x<0]       # 절대값 벡터  
x <- c(1, 2, 3, NA, 5)
x[!is.na(x)]
x[is.na(x)] <- 4        # 결측인 성분을 4로 채우기




## B.2 배열(arrays)과 행렬(matrices)

z <- array(1:20, dim=c(4,5))     # 벡터 1:20를 4*5 배열로 재배치  
z
z <- matrix(1:20, 4, 5)          
z
z <- matrix(2, 4, 5)
z
z <- matrix(c(1, 2, 3, 
              4, 5, 6),
            nrow = 2, ncol = 3, byrow=T)  # Readability enhanced
z
z[2, 3]                     # indexed by the position

x <- 1:4
y <- 5:8

cbind(x, y)
rbind(x, y)

B <- matrix(0, 4, 5)
cbind(B, 1:4)

A <- matrix(1:20, 4, 5)
B <- matrix(1:20, 4, 5)
C <- cbind(A, B)
C

A+B
A-B
A*B
A/B

matrix(1:20, 4, 5) + matrix(1:10, 2, 5)   # Not run...

A <- matrix(runif(20), 5, 4)
t(A)             # matrix transposition
B <- t(A)%*%A    # %*%: Matrix multiplication
solve(B)         # Inverse matrix
diag(5)          # 5-by-5 diagonal identity matrix 
diag(B)          # diagonal matrix with the diagonal elements of B 
C <- outer(1:3, 4:6, FUN="*")   # outer product

z <- matrix(1:20, 4, 5)
z
nrow(z)                              
colnames(z) <- c("alpha", "beta", "gamma", "delta", "eps")
rownames(z) <- c("a", "b", "c", "d")
z




## B.3 리스트(List) 

Hong <- list(kor.name="홍길동",
             eng.name="Gil-dong",
             age=43, 
             married=T, 
             no.child=2, 
             child.ages=c(13, 10))
Hong$age
Hong["age"]
Hong$child.age[2]
str(Hong)

Hong[[2]]

Hong[c(1,2)]

is.list(Hong)

x <- list(a = 1:10, 
          beta = exp(-3:3),   
          logic = c(TRUE,FALSE,FALSE,TRUE)) 
x
lapply(x, mean)                      # x의 각 성분의 평균값을 계산
lapply(x, quantile, probs = (1:3)/4) # x의 각 성분의 사분위수를 계산

