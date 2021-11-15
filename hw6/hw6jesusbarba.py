# Jesus Barba CS474-HW6
# Concurrent 2D Array Ops
#

import sys, time
from random import seed
from random import randint
from multiprocessing.pool import ThreadPool

globalmax, globalmin, globaltotal = -1, 1048576, 0

def arrayBuilder(n): #function to create NxN 2D array, fill it with random integers, and return the array
    if (n ==0):
        print("error: no command line value given\n")
        exit()
    seed(int(time.time())) #seed random number generator with time
    rows, cols = (n, n)
    array = [[randint(0, 1048576) for i in range(cols)] for j in range(rows)]
    return array

def singlethreadOps(): #function that single threadedly finds the max, min, and avg for a 2D array
    n = len(sys.argv)
    if (n ==0):
        print("command line argument required. run this program with an int argument.\n")
        exit()
    size = int(sys.argv[1])
    array = arrayBuilder(size)
    start = time.time() #capture start time
    currmax, currmin, total = -1, 1048576, 0
    for i in array:
        currmax = max(currmax, max(i))
        currmin = min(currmin, min(i))
        total += sum(i)
    print("max is", currmax, "min is", currmin, "and average is", total/(size ** 2))
    stop = time.time() #capture end time after calculating and printing values
    print("single thread: time elapsed for N of", size, "is", format(stop-start, ".5f"), "seconds\n")

def rowVals(row): #function that can be used by a thread to calculate the max, min, and avg and update it to global variables
                  #function is CPU safe and doesn't return values so it's thread safe
    global globalmax, globalmin, globaltotal
    globalmax = max(globalmax, max(row))
    globalmin = min(globalmin, min(row))
    globaltotal += sum(row)
    

def multiThreadOps(): #function that creates a thread pool of size N and calculates the max, min, and avg of each row
    n = len(sys.argv)
    if (n==0):
        print("command line argument required. run this program with an int argument.\n")
        exit()
    global globalmax, globalmin, globaltotal
    size = int(sys.argv[1])
    arr = arrayBuilder(size)
    start = time.time()
    pool = ThreadPool(size)
    for row in arr:
        pool.apply_async(rowVals, (row,))
    pool.close()
    pool.join()
    print("max is", globalmax, "min is", globalmin, "and average is", globaltotal/(size ** 2))
    stop = time.time()
    print("multithread: time elapsed for N of", size, "is", format(stop-start, ".3f"), "seconds\n")

def main():
    singlethreadOps()
    multiThreadOps()

main() # start of execution