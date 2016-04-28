## These fucntions will cache the inversion of a matrix


## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse. which is really a list containing a function to
## set the value of the matrix
##get the value of the matrix
##set the value of the inverse of the matrix
##get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


##The following function calculates the mean of the special "matrix" created with the above function. However, it first checks to see if 
##the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the 
## mean of the data and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getinverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
