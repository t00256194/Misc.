import numpy as np
import matplotlib.pyplot as plt

P = 1000    #load in N
L = 10      #lenth in m
a = 5

R1 = P*(L-a)/L
R2 = P*a/L

l = np.linspace(0,L,100)

X = []
SF = []
M = []

for x in l:
    if x <= a:
        m = R1*x
        sf = R1
    elif x > a:
        m = (R1*x)-(P*(x-a))
        sf = R1-P
    M.append(m)
    X.append(x)
    SF.append(sf)

plt.subplot(2,1,1)
plt.plot(X,M, color = "g")
plt.plot([0,L],[0,0], color = "r")
plt.title("Bending Moment Diagram")
plt.xlabel("Length (m)")
plt.ylabel("Bending Momemnt (Nm)")


plt.subplot(2,1,2)
plt.plot(X,SF, color = "g")
plt.plot([0,L],[0,0], color = "r")
plt.plot([0,0],[0,R1],[L,L],[0,-R2], color = "r")
plt.title("Shear Force Diagram")
plt.xlabel("Length (m)")
plt.ylabel("Shear Force (N)")

plt.show()
