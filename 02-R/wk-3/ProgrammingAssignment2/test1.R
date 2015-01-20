
## first script: test cacheSolve repeatedly
## from https://class.coursera.org/rprog-010/forum/thread?thread_id=288 

x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
for (i in 1:100) {
  x__ <- cacheSolve(x_)
}
