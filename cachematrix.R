
## Create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {

  list(set = set, get = get, getInverse = getInverse)
}

## Compute the inverse of the special "matrix" returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
  # Get the cached inverse using the getInverse function from the makeCacheMatrix object
  cachedInverse <- x$getInverse()
  
  # Return the cached inverse
  cachedInverse
}