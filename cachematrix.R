a = matrix( 
  c(10, 12, 13, 4, 5, 6, 7, 8, 9), 
  nrow=3, 
  ncol=3) 

b = matrix( 
  c(2, 4, 3, 1, 5, 7, 8, 9, 10), 
  nrow=3, 
  ncol=3) 

## creates a list containing a function to set the value of the vector, get the value
## of the vector, set the value of the inverse and get the value of the inverse.

makeCacheMatrix <- function(x=matrix()){
  m<-NULL
  set<-function(y) {
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinv<-function(solve) m<<-solve
  getinv<-function() m
  list(set=set,get=get,setinv=setinv,getinv=getinv)
}

## checks to see if inverse has already been calculated, if not, calculates the inverse
cacheSolve<-function(x,...) {
  m<-x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
data<-x$get()
m<-solve(data,...)
x$setinv(m)
m
}

makeCacheMatrix(a)
##cacheSolve(makeCacheMatrix(a))
##cacheSolve(makeCacheMatrix(b))