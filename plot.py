#!/usr/bin/python

import numpy as np
import re
import matplotlib.pyplot as plt
text = []
real = []
predict = []
input = open("./template/output.txt")
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
plt.plot(select, real[0], 'r--', select, predict, 'b--')
plt.show()