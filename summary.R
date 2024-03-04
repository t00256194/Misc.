# Use the following command to scan the data set "sample.txt" into a
# variable "X": When prompted to open a file, choose the file name you
# have created for the data set. 
X <- scan(file.choose())
# R provides various functions for sample statistics. The most
# important values concerning the data are the sample size (length),
# the sample mean (mean), the sample variance (var), and the sample
# standard deviation (sd).
length(X)
mean(X)
var(X)
sd(X)
# The function summary() produces rounded values for the minimum
# (Min.), the lower quartile (1st Qu.), the median (Median), the mean
# (Mean), the upper quartile (3rd Qu.), and the maximum (Max.) In
# order to increase the precision we need to specify the significant
# digits as in the following example: 
summary(X, digits=5)
# You can write summary into the csv file "summary.csv" and read it
# into a spreadsheet program.
S = summary(X)
write.csv(unclass(S), file="summary.csv")
# Individual values in the list S of summary can be accessible by
# S[[1]], S[[2]], and so on. For example,
IQR = S[[5]] - S[[2]]


