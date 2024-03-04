# Hypothesis test with data "X" for
# the alternative hypothesis to compare with "mu0" by "alt.status"
X = c(4.2, 2.0, 3.6, 3.8, 2.6, 3.5, 3.2, 2.6, 2.5, 1.7, 3.3, 4.8)
mu0 = 3.5
alt.status = "less"
#
# Computer project ask you to choose the significance level of 0.05
#
alpha = 0.05
#
# Calculate the critical value for the test.
#
n = length(X)
cat("\n Calculate the critical value, and visualize it:\n")
range = c(-4,4);
t.value = seq(range[1], range[2], length=100);
t.density = dt(t.value,n-1);
plot(t.value, t.density, type='l', lwd=1, frame.plot=F);
if(alt.status == "two.sided"){
  cvalue = qt(alpha/2,n-1,lower.tail=F);
  xx = seq(range[1], -cvalue, length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
  xx = seq(cvalue, range[2], length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
}else if(alt.status == "greater"){
  cvalue = qt(alpha, n-1, lower.tail=F);
  xx = seq(cvalue, range[2], length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
}else{
  cvalue = qt(alpha,n-1,lower.tail=T);
  xx = seq(range[1], cvalue, length = 50);
  polygon(c(xx,max(xx),min(xx)), c(dt(xx,n-1),0,0), col = 'green');
}
title(main=paste('Critical value of', round(cvalue, digits=3) ,'at', alpha));
cat("\n Critical value =", cvalue, "\n")
#
# Statistical inference -- t.test()
#
cat("\n Obtain the outcome of hypothesis test:\n")
outcome <- t.test(X, mu=mu0, alternative=alt.status)
print(outcome)
#
# t.test for two-sided confidence interval
#
cat("\n The following outcome provides a two-sided confidence interval:\n")
outcome <- t.test(X, mu=mu0, alternative="two.sided", conf.level=0.95)
print(outcome)
