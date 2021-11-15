#Jesus Barba CS474-HW6
#
#
import sys
import threading
import math

def arrayBuilder(n): #function to create NxN 2D array, fill it with random integers, and return the array
    if (n ==0):
        print("error: no command line value given\n")
        exit()
    array[n][n]
    arry

def max(arr):
    x = (-math.inf)
    for i in arr:
        if i > x:
            x = i
    return x
    
def min(arr):
    x = (math.inf)
    for i in arr:
        if i < x:
            x = i
    return x

def avg(arr, size):
    total = 0
    for i in arr:
        total += i
    return total/size

#function to create NxN 2D array and fill it with random integers
#function that single threadedly find the max, min, and avg for the 2D array
#function that concurrently finds the max, min, and avg for 2D array
    # maybe have a thread take the a row of the array
    # and then update a global max, min, and total value
    # calculate avg at the end

main()