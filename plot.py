#!/usr/bin/python

import numpy as np
import re
import matplotlib.pyplot as plt
text = []
real = []
predict = []

input = open("./template/output_1_2.txt")
text.append(input.read())
input.close()

input = open("./template/output_1_1.txt")
text.append(input.read())
input.close()

input = open("./template/output_1_3.txt")
text.append(input.read())
input.close()

input = open('./output.txt')
text.append(input.read())
input.close()

p = re.compile('Cycles:')
for j in range(len(text)-1):
    tokens = text[j].split()
    tmp = []
    for i in range(len(tokens)):
        if p.match(tokens[i]):
            tmp.append(float(tokens[i+1])/100000000)
    real.append(tmp)

pre_tokens = text[-1].split()
p = re.compile('cost:')
for i in range(len(pre_tokens)):
    if p.match(pre_tokens[i]):
        predict.append(float(pre_tokens[i+1]))
        
select = np.arange(0, 1.1, 0.1)
plt.ylabel('CPU cycles per record')
plt.xlabel('selectivity')
plt.plot(select, real[0], 'g--', select, real[1], 'y--', select, real[2], 'r--', select, predict, 'b--')
plt.legend(['1 && 2 && 3 && 4', '(1 & 2) && (3 && 4)', '1 & 2 & 3 & 4', 'optimizer choice'], loc='lower right')
plt.show()
