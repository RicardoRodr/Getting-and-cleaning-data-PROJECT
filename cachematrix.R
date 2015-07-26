## These functions store a matrix and its inverse in a special list. For each introduced matrix, the inverse is calculated once and only once,
## and every succesive time the user asks to calculate the inverse matrix, the functions merely need to recall the cached inverse matrix instead
## of having to calculate it again.

## Takes a matrix as an argument and stores a list of functions to be computed with it, that will allow to cache the inverse of the argument.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL                                     ##sets "inv", the inverse of the matrix that will be stored later, to NULL since we are preparing the special vector for a matrix which inverse hasn't been calculated yet.
    set <- function(y) {                            ##"set" is called when we are changing the matrix, we need to re-set the matrix itself and set the inverse to NULL since it's not yet been calculated
        x <<- y
        inv <<- NULL
    }
    get <- function() x                             ## returns simply "x", the matrix that is processd currently inside of "makeCacheMatrix"
    setInverse <- function(inverse) inv <<- inverse ## sets the inverse "inv" used in our special vector to the value given as an argument. This function is called in CacheSolve (where we actually calculate the inverse of the matrix)
    getInverse <- function() inv                    ## returns the inverse as used currently in the "special vector", can be NULL if it hasn't been calculated yet or the actual inverse of the matrix if it was changed with "SetInverse"
    list(set= set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)                   ## defines the "special vector" in which we will place the computed functions for every matrix introduced as an argument of "makeCacheMatrix".
}


## takes a list of functions computed in makeCacheMatrix and returns and caches the inverse of the matrix used in the list (if it has not yet been calculated), otherwise, returns the cached inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse <- x$getInverse()                       ## checks whether the inverse in the list is different to NULL.
    if(!is.null(inverse)){                          ## if the inverse in the list is not NULL, it returns that inverse and a message saying that the inverse wasn't calculated because it was already cached.
        print("getting cached data")                
        return(inverse)
    }
    else{                                           ## if there is no matrix inverse in the list's calculated functions, we need to calculate and cache it.
        matrix <- x$get()                           ## "matrix" is the stored matrix in the list originally
        inverse <- solve(matrix, ...)               ## calculate the inverse of the matrix and store it as "inverse"
        x$setInverse(inverse)                       ## insert this inverse matrix in the list or "special vector"
        inverse                                     ## returns the computed inverse matrix
    }
}
