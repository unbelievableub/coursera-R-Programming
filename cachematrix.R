## function A: create a "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
in_cache <- NULL		##in_chache is NULL, we need this later to test whether something has been put in cache

## define four functions....
## 1: setting the matrix
set <- function(y) {
x <<- y
in_cache <<- NULL   ## ditto see above
}

## 2: getting the matrix
get <- function() x

## 3: setting the inverse of the matrix int cache
setreverse<- function(reverse) in_cache <<-reverse

## 4: getting the inverse of the matrix from cache
getreverse <- function() in_cache

## the 4 "descriptors"
list(set = set, get = get,
setreverse = setreverse,
getreverse = getreverse)
}

## function B: compute the inverse of the special "matrix" returned by makeCacheMatrix above. 
cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'
in_cache <- x$getreverse()

## If the inverse has already been calculated, then retrieve the inverse from the cache.
if (!is.null(in_cache)) {        
message("getting cached reververse matrix")
return(in_cache)

## if it has not yet been calculated, calculate ("solve(x$et)") the inverse and store (setreverse)
} else {
in_cache <- solve(x$get())
x$setreverse(in_cache)
return(in_cache)
}
}
