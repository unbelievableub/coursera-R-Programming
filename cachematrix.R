## function A: create a "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
elc <- NULL		##elc is NULL, we need this later to test whether something has been put in cache

## define four functions....
## 1: setting the matrix
set <- function(y) {
x <<- y
elc <<- NULL
}
## 2: getting the matrix
get <- function() x

## 3: setting the inverse of the matrix
setreverse<- function(reverse) elc <<-reverse

## 4: getting the inverse of the matrix
getreverse <- function() elc

## the 4 "descriptors"
list(set = set, get = get,
setreverse = setreverse,
getreverse = getreverse)
}

## function B: compute the inverse of the special "matrix" returned by makeCacheMatrix above. 
cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'
elc <- x$getreverse()

## If the inverse has already been calculated, then retrieve the inverse from the cache.
if (!is.null(elc)) {        
message("getting cached reververse matrix")
return(elc)

## if it has not yet been calculated, calculate ("solve(x$et)") the inverse and store (setreverse) in elc
} else {
elc <- solve(x$get())
x$setreverse(elc)
return(elc)
}
}
