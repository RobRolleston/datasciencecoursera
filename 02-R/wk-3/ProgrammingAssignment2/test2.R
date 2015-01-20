## second script: test solve repeatedly
## from https://class.coursera.org/rprog-010/forum/thread?thread_id=288 

x <- matrix(rnorm(160000),400,400)
for (i in 1:100) {
  x_ <- solve(x)
}
