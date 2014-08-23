#go through the 1000 trials with 40 samples pooled in each trial. The mean of each 40 samples is saved in a data frame sample_mean. Here we got 1000 means.
nosim <- 1000
lambda <- .2
sample_mean <- replicate(nosim, mean(rexp(n, rate = lambda)))

#got a mean and standard deviation of the sample mean.
sample_mean_mu <- mean(sample_mean)
sample_sd <- sd(sample_mean)
sample_var <- (sample_sd)^2

#theoretical variance of the distribution
theo_mean = 1/lambda
theo_var<- (1/lambda)^2/n

#make a histogram of the frequency of sample_mean, which can show the shape of the distribution
#add line to the histogram to show where the distribution is centered at and compare it to the theoretical center of the distribution
hist(sample_mean)
abline(v=theo_mean, col = "red")
abline(v=sample_mean_mu, col = "blue")
legend("topright", pch = 1, col = c("red", "blue"), legend = c("theoretical center", "distribution center"), cex = .7)