#lang racket
#| Jesus Barba CS471-HW4 |#

#|1. Write a function powerfour that given an integer n, returns true if n is a power of 
four, else returns false. An integer n is a power of four, if there exists an integer x 
such that n == 4^x.  
Not included in this assignment, but a frequent followup question in interviews: 
Could you solve it without loops/recursion? Probably a good idea to at least look 
at solutions that solve the above question without loops/recursion.|#

(define (powerfour x) (integer? (/ (log x) (log 4) ) ) )

(powerfour 16) #|should return true #t|#
(powerfour 8) #|should return false #f|#

#|2. Write a function insert-at that inserts an element at a given position into a list. Your 
solution must use recursion.|#
(define (insert-at lst pos elem)
  (define-values (before after) (split-at lst pos) )
  (append before (cons elem after)))
(insert-at (list 1 2 3) 0 999) #|should return (list 999 1 2 3)|#
(insert-at (list 1 2 3) 1 999) #|should return (list 1 999 2 3|#

#|3. Write a function palindromep that is given a list and returns 1 if the list has the 
same sequence of elements when read left to right as when read right to left. It 
should return 0 otherwise.|#
(define (palindromep x) (if (equal? x (reverse x) ) 1 0) )
(palindromep (list 1 2 3 2 1) ) #|should return true|#


#|4. Write a function ifPrime that determines whether a given integer number is prime or 
not. Return 0 if it is prime, 1 if it is not prime.  |#
(define (primeHelper x i)
  (if (< x 1) #f
      (if (= x i) #t
          (if (= (modulo x i ) 0) #f
              (primeHelper x (+ i 1))))))

(define (isPrime x) (primeHelper x 2))
#|
(isPrime 7)
(isPrime 35)
|#