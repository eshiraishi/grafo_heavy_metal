import csv
import numpy as np

with open('genres.csv', 'r') as f:
    reader = csv.reader(f, delimiter=',')
    genres = list(reader)
    genres = np.array(genres)
    genres=genres.tolist()
    

with open('names.csv', 'r') as f:
    reader1 = csv.reader(f, delimiter=',')
    names = list(reader1)
    names = np.array(names)
    names=names.tolist()


edgelist_name = list()
edgelist_genre = list()


    
for i in range(2000):
    for j in range(5):
        if genres[i][j]!='':

            edgelist_name.append(names[i][0])
            edgelist_genre.append(genres[i][j])
     
with open('edgelist_name.csv', "w") as output:
    writer = csv.writer(output,delimiter=',', lineterminator='\n')
    for aux1 in edgelist_name :
        writer.writerow([aux1])  

with open('edgelist_genre.csv', "w") as output:
    writer = csv.writer(output,delimiter=',', lineterminator='\n')
    for aux2 in edgelist_genre :
        writer.writerow([aux2])   
