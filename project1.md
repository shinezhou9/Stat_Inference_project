Simulation exercises
========================================================

### Requirements
### 1. Simulate the mean of 40 exponential(0.2)s. 
### 2. Investigate the distribution of averages of 40 exponential(0.2)s. 
### 3. Need to do a thousand or so simulated averages of 40 exponentials.

```r
#go through the 1000 trials with 40 samples pooled in each trial. 
#The mean of each 40 samples is saved in a data frame sample_mean. 
#Here we got 1000 means.
n <- 40
nosim <- 1000
lambda <- .2
set.seed(1234)
sample_mean <- replicate(nosim, mean(rexp(n, rate = lambda)))
```

### Questions

### 1.Show where the distribution is centered at and compare it to the theoretical center of the distribution.

```r
#got a mean of the sample mean.
sample_mean_mu <- mean(sample_mean)
#theoretical mean of the distribution
theo_mean = 1/lambda
```
**the distribution is centered at 4.9742, the theoretical center of the distribution is 5**

### 2.Show how variable it is and compare it to the theoretical variance of the distribution.

```r
#got the standard deviation of the sample mean.
sample_sd <- sd(sample_mean)
sample_var <- (sample_sd)^2
#theoretical variance of the distribution
theo_mean = 1/lambda
theo_var<- (1/lambda)^2/n
```
**the variance of the distribution is 0.5707, the theoretical variance of the distribution is 0.625**

### 3. Show that the distribution is approximately normal.

```r
#make a histogram of the frequency of sample_mean, which can show the shape of the distribution
hist(sample_mean)
#add line to the histogram to show where the distribution is centered at 
#and compare it to the theoretical center of the distribution
abline(v=theo_mean, col = "red", lwd = 4)
abline(v=sample_mean_mu, col = "blue", lwd = 4)
legend("topright", lty = 1, lwd = 2, col = c("red", "blue"), legend = c("theoretical center", "distribution center"), cex = .7)
```

![plot of chunk histogram](figure/histogram.png) 

**we can see that the distribution is approximately normal from the histogram.**

### 4.Evaluate the coverage of the confidence interval for 1/lambda

```r
CI <- sample_mean_mu + c(-1,1) + 1.96*sample_var/sqrt(n)
```
**the confidence interval for 1/lambda is 4.1511 to 6.1511**
