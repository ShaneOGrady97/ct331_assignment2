#lang racket

;A cons pair of two numbers
(cons 4 5)

;A list of 3 numbers, using only the cons function.
(cons 4(cons 5 6))

;A list containing a string, a number and a nested list of three numbers, using only the cons function.
(cons "Shane"(cons 7 '(8 9 10)))

;A list containing a string, a number and a nested list of three numbers, using only the list function.
(list "Shane" '2 '(3 4 5))

;A list containing a string, a number and a nested list of three numbers, using only the append function.
(append '(Shane) '(1) '((2 3 4)))
