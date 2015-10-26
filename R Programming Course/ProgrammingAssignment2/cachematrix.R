##  Inverse of the matrix is computed and cached the first time.If the value of the matrix is not changed 
##  then the inverse is always taken from the cache.
##  If the value of the matrix is changed then the matrix inverse is re-computed and cached again


## The function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the matrix inverse
## get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {

    mInverse <- NULL
    set <- function(y){
        x<<- y
        mInverse<<- NULL
    }
    
    get<- function() x
    
    setInverse<- function(inv)mInverse<<- inv
    getInverse<- function()mInverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## The cacheSolve function calculates the inverse of the matrix() created with the makeCacheMatrix function.
## However, it first checks to see if the inverse of matrix is already in the cache.
## If so, it gets the matrix inverse from the cache and skips the computation. 
## Otherwise,it calculates the matrix inverse of the data and sets the value of the mean in the cache 
## via the setInverse function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    mInverse <- x$getInverse()
    if(!is.null(mInverse)){
        message("getting cached data")
        return(mInverse)
    }
    
    data<- x$get()
    mInverse <- solve(data)
    x$setInverse(mInverse)
    mInverse
}

