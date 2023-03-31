import numpy as np 
import matplotlib.pyplot as plt

sigma_x = 200
sigma_y = 50
tau_xy = 25

theta = np.linspace(0, 2*np.pi, 360)

R = np.sqrt((0.5*(sigma_x-sigma_y))**2 + tau_xy**2)

S_avg = (sigma_x + sigma_y)/2

x = S_avg + R*np.cos(theta)
y = R*np.sin(theta)

plt.plot(x,y)
plt.plot([S_avg-R-10, S_avg+R+10], [0,0], linestyle = '--', color = 'black') 
plt.plot([S_avg,S_avg], [-R-10,R+10], linestyle = '--', color = 'black')

plt.plot([sigma_x,sigma_y], [-tau_xy,tau_xy],[sigma_x,sigma_x], [-tau_xy,0], [sigma_y,sigma_y],[tau_xy,0],linestyle = '--', color = 'g')

plt.title("Mohr's Circle")
plt.xlabel(r'$\sigma$')
plt.ylabel(r'$\tau$')

plt.show()



