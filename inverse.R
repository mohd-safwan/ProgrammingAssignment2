makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y ##defines a function to set a new vector x interms of y
    inverse <<- NULL ##setting the inverse to be NULL
  }
  get <- function() x
  setInv <- function() inverse <<- solve(x) ##calculating the inverse of a square matrix 
  getInv <- function() inverse
  list(set = set,
       get = get,
       setInv = setInv,
       getInv = getInv)
}




cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInv()
  if (!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  matrix() <- x$get()
  inverse <- solve(mat, ...)
  x$setInv(inverse)
  inverse
}