@@ -1,15 +1,31 @@
-## Put comments here that give an overall description of what your
-## functions do
-
-## Write a short comment describing this function
-
-makeCacheMatrix <- function(x = matrix()) {
-
-}
-
-
-## Write a short comment describing this function
-
-cacheSolve <- function(x, ...) {
-        ## Return a matrix that is the inverse of 'x'
-}
+## These function cache the inverse of a matrix.
+
+## This function creates a "matrix" that can cache its inverse.
+
+makeCacheMatrix <- function(x = matrix()) {
+  m <- NULL
+  set <- function(y) {
+    x <<- y
+    m <<- NULL
+  }
+  get <- function() x
+  setinv <- function(solve) m <<- solve
+  getinv <- function() m
+  list(set = set, get = get, setinv = setinv, getinv = getinv)
+}
+
+
+## This function computes the inverse of the "matrix" returned by makeCacheMatrix. 
+##If the inverse has already been calculated (and the matrix has not changed) then cacheSove retrieve the inverse from the cache. 
+
+cacheSolve <- function(x, ...) {
+  x <- x$getinv()
+  if(!is.null(m)) {
+    message("creating inverse")
+    return(m)
+  }
+  data <- x$get()
+  m <- solve(data, ...)
+  x$setinv(m)
+  m
+}