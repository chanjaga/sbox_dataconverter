#Simulation that dataconverter reduces correlation between power and hamming distance
import matplotlib.pyplot as plt
import numpy as np

#for instance, if the hamming distance is 7, the power is 7.
hammming_power = np.array([1, 2, 3, 4, 5, 6, 7, 8] )

#with dataconverter
print('with dataconverter')
datacnv_sbox_power = 0
datacnv_graph = []
hammming_distanse = []
for i in range(10000):
    random_number = np.random.randint(0,8)
    hammming_distanse.append(random_number)
    datacnv_sbox_power = hammming_power[random_number] + hammming_power[7-random_number]
    datacnv_graph.append(datacnv_sbox_power)

#plot the correlation between datacnv_sbox_power and hamming distance
plt.scatter(hammming_distanse, datacnv_graph)
#name x axis
plt.xlabel('Hamming distance')
#name y axis
plt.ylabel('Power')
plt.show()

#without dataconverter
print('without dataconverter')
sbox_power = 0
sbox_graph = []
hammming_distanse = []
for i in range(10000):
    random_number = np.random.randint(0,8)
    hammming_distanse.append(random_number)
    sbox_power = hammming_power[random_number]
    sbox_graph.append(sbox_power)

#plot the correlation between datacnv_sbox_power and hamming distance
plt.scatter(hammming_distanse, sbox_graph)
#name x axis
plt.xlabel('Hamming distance')
#name y axis
plt.ylabel('Power')
plt.show()