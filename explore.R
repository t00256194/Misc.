# Read the data file "candy.txt" into the variable X. To see the
# data inside, simply type the variable name. 
X <- scan(file.choose())
X
# Stem is used to draw the stem and leaf plot for variable. 
stem(X)
# With the class intervals specified by breaks we can generate a
# histogram:
hist(X, col="blue", freq=FALSE,
     breaks=c(20.45, 21.35, 22.25, 23.15, 24.05, 24.95, 25.85, 26.75),
     main="Candy Bar Weights", xlab="Weights in grams")
# Each interval (a,b] is left-open, covering the data points
# between a and b, but excluding the data point which is exactly
# the value a. 
hist(X, col="blue",
     breaks=c(20.45, 21.35, 22.25, 23.15, 24.05, 24.95, 25.85, 26.75))
# The histogram can be called with seq() as follows.
hist(X, col="blue", freq=FALSE,
     breaks=seq(20.45, 26.75, by=0.9),
     main="Candy Bar Weights", xlab="Weights in grams")
# It is important to specify the class interval by users. However, if
# it is omitted, the program code for hist() makes a reasonable choice
# for the class intervals. Try hist() without breaks at all as
# follows:
hist(X, col="blue", freq=FALSE,
     main="Candy Bar Weights", xlab="Weights in grams")
# Boxplot is used to draw the boxplot for variable. 
boxplot(X, horizontal=TRUE, col='green')
