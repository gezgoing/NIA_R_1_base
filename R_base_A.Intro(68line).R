# A. R 소개

## A.5 Working directory

getwd()
setwd("c:/mywork/codes/")    # 각자의 상황에 맞게 수정해 사용하시오

## A.6 도움말 Help

? persp

help(persp)

?? log

help.search("log")


## A.7 R command

abc <- 3       # OK
.jeong <- abc  # OK
2.res <- 3     # 에러...

beta.0 <- 3; beta.1 <- 2

rnorm(10) # to generate 10 random numbers

a <- 1
A <- 2
a == A


## A.8 Mathematical computation

x <- 11; y <- 3
x+y
x-y
x*y
x/y
x^y  
x%/%y # integer quotient      
x%%y  # modulo

1.2e3        # 1.2 * 1,000
1.2e-3       # 1.2 * 1/1,000

z1 <- 1.2+3.4i 
z2 <- 4i
z1 + z2

x <- 10; y <- 3.21; n <- 2
log(x)
log10(x)
log(n, x)
exp(x)
sin(x) # cos(x), tan(x), asin(x), acos(x), atan(x)
abs(x)
sqrt(x)
floor(y)
ceiling(x)
round(y, digits=0)
gamma(x)
lgamma(x)
factorial(x)
choose(x, n)

