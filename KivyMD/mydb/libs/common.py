import random

def randColor():
    "#"+''.join([random.choice('0123456789ABCDEF') for j in range(6)])