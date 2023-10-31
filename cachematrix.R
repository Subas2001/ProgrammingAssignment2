## Create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  # Initialize a variable to store the cached inverse matrix
  cachedInverse <- NULL
  
  # Define a function to set the matrix and calculate its inverse
  set <- function(y) {
    x <<- y  # Assign the input matrix to the parent environment variable x
    cachedInverse <<- NULL  # Reset the cached inverse as the matrix has changed
  }
  
  # Define a function to get the matrix
  get <- function() {
    x  # Return the matrix
  }
  
  # Define a function to get the cached inverse, or compute it if not cached
  getInverse <- function() {
    if (!is.null(cachedInverse)) {
      # If the cached inverse exists, return it
      message("Getting cached inverse.")
      return(cachedInverse)
    } else {
      # If the cached inverse does not exist, compute it using solve() function
      message("Calculating inverse and caching it.")
      cachedInverse <<- solve(x)
      return(cachedInverse)
    }
  }
  
  # Return a list of functions that can access and manipulate the matrix object
  list(set = set, get = get, getInverse = getInverse)
}

## Compute the inverse of the special "matrix" returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
  # Get the cached inverse using the getInverse function from the makeCacheMatrix object
  cachedInverse <- x$getInverse()
  
  # Return the cached inverse
  cachedInverse
}