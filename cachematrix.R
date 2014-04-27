## These functions implement cached version of standart solve functions.
## makeCacheMatrix creates "cachedMatrix" which is actually a vector
## consists of accessors and datafiels. cacheSolve includes a logic of 
## choosing the way of calculation inverse (normal, via standart "solve", 
## or cached, if the value have already be calculated)

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL
    get <- function () x
    set <- function (y) {
      x <<- y
      inv <<- NULL
    }
    getInv <- function () inv
    setInv <- function(invert) inv <<-invert
    list(get=get, set=set, getInv = getInv, setInv = setInv)    
  
}

## cacheSolve implements cached version of "solve"
## needs an object created by makeCacheMatrix function on input

cacheSolve <- function(x, ...) {
  
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInv()
  if(is.null(i)){ ##if no data in cash
    data <- x$get()
    i <- solve(data)
    x$setInv(i) ##writing in cash
    message("non-cached")
    return(i)
  }
  message("cached")
  i
}
