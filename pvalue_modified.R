# Once the test statistic is calculated, the p-value can be computed
# according to the choice of alternative hypothesis:
#   H_A: mu != mu_0 (alternative = "two.sided")
#   H_A: mu > mu_0  (alternative = "greater")
#   H_A: mu < mu_0  (alternative = "less")
# Critical point and p-value. The critical point represents how
# unlikely it is for the test statistic to go beyond the point under
# the null hypothesis.
mu0 = 5.4
alpha = 0.05
alternative = "two.sided"
n=28
mean = 5.145
sample.sd = 0.7524
#
# Calculate test statistic
#
t.statistic = (mean - mu0)*sqrt(n)/sample.sd
cat("\n Test statistic T =", t.statistic)
#
# Find the critical value for the test
#
par(mfrow=c(2,1));
range = c(-4,4);
x = seq(range[1], range[2], length=100);
y = dt(x,n-1);
plot(x, y, type='l', lwd=1, frame.plot=F);
if(alternative == "two.sided"){
  cvalue = qt(alpha/2,n-1,lower.tail=F);
  xx = seq(range[1], -cvalue, length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
  xx = seq(cvalue, range[2], length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
}else if(alternative == "greater"){
  cvalue = qt(alpha, n-1, lower.tail=F);
  xx = seq(cvalue, range[2], length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
}else{
  cvalue = qt(alpha,n-1,lower.tail=T);
  xx = seq(range[1], cvalue, length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
}
points(t.statistic, 0, pch=17, col='red')
title(main=paste('Critical value of', round(cvalue, digits=3) ,'at', alpha));
text(t.statistic, 0.1, round(t.statistic, digits=3), col='red');
cat("\n critical value =", cvalue)
#
# The p-value represents the probability that the test statistic could
# be the particular value under the null hypothesis. 
#
plot(x, y, type='l', lwd=1, frame.plot=F, main=NULL);
if(alternative == "two.sided"){
  pvalue = 2 * pt(abs(t.statistic), n-1, lower.tail=F)
  xx = seq(range[1], -abs(t.statistic), length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'blue');
  xx = seq(abs(t.statistic), range[2], length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'blue');
  points(-t.statistic, 0, pch=17, col='red')
}else if(alternative == "greater"){
  pvalue = pt(t.statistic, n-1, lower.tail=F);
  xx = seq(t.statistic, range[2], length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'blue');
}else{
  pvalue = pt(t.statistic, n-1, lower.tail=T);
  xx = seq(range[1], t.statistic, length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'blue');
}
points(t.statistic, 0, pch=17, col='red')
title(main=paste('P-value of', round(pvalue, digits=3)));
cat("\n p-value value =", pvalue)
cat("\n")
par(mfrow=c(1,1));

#
# 95% confidence intervals
#
cat("\n---------------------------------------------")
cat("\n 95% confidence interval")
if (alternative == "two.sided") {
  # interval for two sided test
  cvalue <- abs(qt(0.025, n-1))
  error <- cvalue*sample.sd/sqrt(n)
  left <- mean-error
  right <- mean+error
  cat("\n 2-sided interval: (", left, ", ", right, ")")
} else {
  # intervals for one sided test
  cvalue <- abs(qt(0.05, n-1))
  error <- cvalue*sample.sd/sqrt(n)
  left <- mean-error
  right <- mean+error
  if (alternative == "less") {
    cat("\n Less than interval: (-infinity, ", right, ")")
  } else {
    cat("\n Greater than interval: (", left, ", infinity)")
  }
  
}
#
# 99% confidence intervals
#
cat("\n\n---------------------------------------------")
cat("\n 99% confidence interval")
if (alternative == "two.sided") {
  # interval for two sided test
  cvalue <- abs(qt(0.005, n-1))
  error <- cvalue*sample.sd/sqrt(n)
  left <- mean-error
  right <- mean+error
  cat("\n 2-sided interval: (", left, ", ", right, ")")
} else {
  # intervals for one sided test
  cvalue <- abs(qt(0.01, n-1))
  error <- cvalue*sample.sd/sqrt(n)
  left <- mean-error
  right <- mean+error
  if (alternative == "less") {
    cat("\n Less than interval: (-infinity, ", right, ")")
  } else {
    cat("\n Greater than interval: (", left, ", infinity)")
  }
}
