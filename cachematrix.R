## This function creates a special matrix which:
## 1. sets teh value of the matrix
## 2. gets the value of the matrix
## 3. sets teh value of teh inverse
## 4. gets teh value of the inverse

makeCacheMatrix <- function(x = matrix()) {
m<- NULL
set<- function(y){
x<<- y
m<<- NULL
}
get<- function() x
setinverse<- function(inverse) m<<- inverse
getinverse<- function() m
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}


## The next one calculates teh inverse of teh above special matrix

cacheSolve <- function(x, ...) {
      m<- x$getinverse()
      if(!is.null(m)){
      message("getting cached data")
      return(m)
      }
      data<-x$get()
      m<- solve(data, ...)
      x$setinverse(m)
      m
}
