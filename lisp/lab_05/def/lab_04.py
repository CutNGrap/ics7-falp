from random import randint
from math import *
from numpy import arange
import pandas as pd
import prettytable
import matplotlib.pyplot as plt

# Раскомментить, если нужно задание 5
# M = 3000 
M = 100

def img_routine(plot, name, name1):
    plot.legend()
    plot.grid()
    plt.ylabel(name)
    plt.xlabel(name1)

    plt.show()

def graph2():
    fig = plt.figure(figsize=(10, 7)) 
    plot = fig.add_subplot()
    sp = range(100, 700, 100)
    sp1 = [67.7, 1025, 4905,14990, 36474,76315]
    sp2 = [16,124,470,1243,2428,4572]
    plot.plot(sp, sp1,  label = "Рекурсия", c = "m")
    plot.plot(sp, sp2, "--", label = "Функционалы", c = "g")
    img_routine(plot, "Время, мсек","Линейный размер матриц, ед")
    return



graph2()
pass