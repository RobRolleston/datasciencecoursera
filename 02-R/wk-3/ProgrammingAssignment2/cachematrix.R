## makeCacheMatrix(x = matrix()) will set/get a matix and it's inverse.
#  The inverse will be stored in a cache for future use.
##  Returns: list of four acsesor fuctions

## cacheSolve(list from 'makeCacheMatrix')
## Returns: inverse of matrix


## The 'makeCacheMatrix'function will take a matrix, calculate and 
#  cache its' inverse.  There are accessor functions to set & get 
#  the matrix and its' inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) inv <<- solve
  getInverse <- function() inv
  # Return a list of funtions to set/get the matix, and set/get the inverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## The 'cacheSolve' function will take a matrix x, and find it's inverse.
#  If the matrix inverse has already been calcualted using 
#  'makeCacheMatrix' function, then the inverse has been cached
#  and will be retrieved.
#  If there is no cached value, the inverse will be calculated
#  and set into a chanced value for future reference. 

cacheSolve <- function(x, ...) {
  # Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  
  # if the inverse already exits, get it, and return the inverse
  if(!is.null(inv)) {
    message("getting cached data..", appendLF = FALSE)
    return(inv)
  }
  
  # calculate and set the inverse for future reference, and return the inverse
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}
