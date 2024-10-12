## ------------------------------------------------------------------
set.seed(100)
# variables given by problem
n <- 16
ya <- 75.2
sa <- 7.3
yb <- 77.5
sb <- 8.1
mu0 <- 75
s20 <- 100
k0 <- c(1,2,4,8,16,32,64)
v0 <- c(1,2,4,8,16,32,64)
kn <- k0 + n
vn <- v0 + n
data <- data.frame(k0 = k0, v0 = v0)


## ------------------------------------------------------------------
#Calculate probabilites for each parameter value
# Create loop for each value in the length of k0
# Run a monte carlo simulation for group A (like from 5.1)
# Run a monte carlo simulation for group B (like from 5.1)
# Then take the mean of all times that theta_postsample_a is greater than theta_postsample_b
# Then concatenate with probs and add this to data from above
probs <- c()
for(i in 1:length(k0)){
 
#monte carlo simulation for A
 mu_na <- (k0[i] * mu0 + n * ya)/kn[i]
 var_na <- 1/vn[i] * (v0[i] * s20 + (n-1) * sa^2 + (k0[i] * n)/kn[i] * (ya - mu0)^2)
 s_postsample_a <- sqrt(1/rgamma(10000, vn[i]/2, var_na * vn[i]/2))
 theta_postsample_a <- rnorm(10000, mu_na, s_postsample_a/sqrt(kn[i]))
 
#monte carlo simulztion for B
 mu_nb <- (k0[i] * mu0 + n * yb)/kn[i]
 var_nb <- 1/vn[i] * (v0[i] * s20 + (n-1) * sb^2 + (k0[i] * n)/kn[i] * (yb - mu0)^2)
 s_postsample_b <- sqrt(1/rgamma(10000, vn[i]/2, var_nb * vn[i]/2))
 theta_postsample_b <- rnorm(10000, mu_nb, s_postsample_b/sqrt(kn[i]))
 
 #approximate probability theta_A < theta_B
 mean <- mean(theta_postsample_a < theta_postsample_b)
 probs <- c(probs, mean)
}

data$probabilites <- probs




## ------------------------------------------------------------------
# Plot findings
plot(x = v0, y = probs, xlab = "v0 = k0", ylab = "Probabilities", main = "P(theta_A < theta_B| y
_A, y_B)", pch=19, lwd=2, col="darkgreen", type="b")

