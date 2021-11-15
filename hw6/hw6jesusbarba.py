# Jesus Barba CS474-HW6
#
#
import sys, threading, math, datetime, time
from random import seed
from random import randint

globalmax, globalmin, globalsum = -1, 1048576, 0

def arrayBuilder(n): #function to create NxN 2D array, fill it with random integers, and return the array
    if (n ==0):
        print("error: no command line value given\n")
        exit()
    seed(int(datetime.datetime.utcnow().timestamp())) #seed random number generator with time
    rows, cols = (n, n)
    array = [[randint(0, 1048576) for i in range(cols)] for j in range(rows)]
    return array

def arrMax(arr):
    x = -math.inf
    for i in arr:
        if i > x:
            x = i
    return x
    
def arrMin(arr):
    x = math.inf
    for i in arr:
        if i < x:
            x = i
    print(x)
    return x

def arrSum(arr):
    total = 0
    for i in arr:
        total += i
    return total

def singlethreadOps(): #function that single threadedly finds the max, min, and avg for a 2D array
    n = len(sys.argv)
    if (n ==0):
        print("command line argument required. run this program with an int argument.\n")
        exit()
    size = int(sys.argv[1])
    arr = arrayBuilder(size)
    start = time.time() #capture start time
    currmax, currmin, total = -1, 1048576, 0
    for i in arr:
        currmax = max(currmax, arrMax(i))
        currmin = min(currmin, arrMin(i))
        total += arrSum(i)
    print("max is", currmax, "min is", currmin, "sum is", total, "and average is", total/(size ** 2))
    stop = time.time() #capture end time after calculating and printing values
    print("time elapsed for N of", size, "is", format(stop-start, ".3f"), "seconds")

def rowVals(row):
    globalmax = max(globalmax, arrMax(row))
    

def multiThreadOps():
    n = len(sys.argv)
    if (n==0):
        print("command line argument required. run this program with an int argument.\n")
        exit()
    size = int(sys.argv[1])
    arr = arrayBuilder(size)
    start = time.time()

    stop = time.time()
    print("time elapsed for N of", size, "is", format(stop-start, ".3f"), "seconds")
singlethreadOps()
