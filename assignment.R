setwd('C:/Users/rubind1/Documents/Coursera-R')
##
## I simply set the input x as matrix
## and then set the solved "s" as a null
## then i changed every referance to "mean" to "solve"
makeCacheMatrix <- function(x=matrix(sample(1:100,9),3,3)){
  s <- NULL
  set <- function(y){
    x<<-y
    s<<-NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same here changed "mean" to "solve" and "m" to "s"
cacheSolve <- function(x,...){
  s <- x$getsolve()
  if(!is.null(s)){
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data,...)
  x$setsolve(s)
  s
}