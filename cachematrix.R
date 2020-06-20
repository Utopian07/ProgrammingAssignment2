## Caching the Inverse of a Matrix using R Programming
## functions do

## Below function creates a special "Matrix" objects that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  l <- NULL
  set <- function(y){
    x <<- y
    l <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse)l <<- inverse
  getInverse <- function()l
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)

}


## This function computes the inverse of the special "Matrix" 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  l <- x$getInverse()
  if(!is.null(l)){
    message("Getting Cached data")
    return(l)
  }
  mat <- x$get()
  l <- solve(mat,...)
  x$setInverse(l)
  l
}
