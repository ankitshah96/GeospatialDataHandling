from math import cos,sin,pi
import numpy as np


Repititions = 8
radius = 1
a = 4
t,x,y = 0,0,0
nRev=16
tt = [34.020602773843315,-118.2854463360723]
file= open("5154070815_SpiroGraph.txt","w+")
	
for t in np.arange(0,(pi*nRev),0.01):
		
	x_coordinate = tt[0] + ((Repititions+radius)*cos((radius/Repititions)*t) - a*cos((1+radius/Repititions)*t))*0.0001
	y_coordinate = tt[1] + ((Repititions+radius)*sin((radius/Repititions)*t) - a*sin((1+radius/Repititions)*t))*0.0001
	file.write(str(y_coordinate) + "," + str(x_coordinate) + "\n")
		
file.close()

