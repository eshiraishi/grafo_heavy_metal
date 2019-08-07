import numpy as np
import csv


with open('ADJ_SEM_EDICAO.csv', 'r') as f:
    reader = csv.reader(f, delimiter=',')
    # get all the rows as a list
    a1 = list(reader)
    # transform data into numpy array
    a1 = np.array(a1).astype(int)

a2=a1
a3= np.zeros(shape=(1999,1999)).astype(int)
for n in range(1999):
    for j in range(1999):
        count=0
        for k in range(211):
            if a1[k][n]==1 and a2[k][j]==1:
        
                count=count+1
                a3[j][n]=count
            
                
np.savetxt("adj_bandaxbanda_sem_edic.csv", a3, delimiter=",",)
