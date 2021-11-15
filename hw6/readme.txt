Jesus Barba CS471-HW6 readme report

Assignment notes:
- Separate 2D arrays are created for single threaded and multithreaded operations. However, the single threaded and multithreaded
2D array operations are both seeded with epoch time, so both arrays are being generated with the same values in most cases.
- True multithreading is not possible in Python because only one thread can hold Python's Global Interpreter Lock
to run code at a time, so multithreading is slower than pure iteration in Python.

########################################################################## 
For N = 4 
Task 2: 
Max value: 970371
Min value: 9176
Average value: 480235.25
Time taken to compute max, min, and average: 0.05 milliseconds 
Task 3: 
Max value: 970371
Min value: 9176
Average value: 480235.25
Time taken to compute max, min, and average: 5 milliseconds 
 
For N = 8 
Task 2: 
Max value: 1040896
Min value: 2284
Average value: 470017.171875
Time taken to compute max, min, and average: 0.08 milliseconds 
Task 3: 
Max value: 1040896
Min value: 2284
Average value: 470017.171875
Time taken to compute max, min, and average: 7 milliseconds 
 
For N = 16 
Task 2: 
Max value: 1041710
Min value: 1543
Average value: 502589.0234375
Time taken to compute max, min, and average: 0.06 milliseconds 
Task 3: 
Max value: 1041710
Min value: 1543
Average value: 502589.0234375
Time taken to compute max, min, and average: 10 milliseconds 
##########################################################################