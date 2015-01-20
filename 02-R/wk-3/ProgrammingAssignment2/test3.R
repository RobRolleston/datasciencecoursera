## third script: verify equality
## from https://class.coursera.org/rprog-010/forum/thread?thread_id=288 

x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
tmp <- cacheSolve(x_)

# Modfiied by RRolleston
#print(identical(x_$getInv(),solve(x)))
invCache <- x_$getInv()
invSolve <- solve(x)
same <- identical(invCache, invSolve )
cat("Matrix inverses match: ", same)
