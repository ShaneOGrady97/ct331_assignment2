#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "\n")
    (display "\n")
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "Part 1: ~a\n" (test_ins_beg1))
    (printf "Part 2: ~a\n" (ins_end 7 '(8 9 10)))
    (printf "\n");
    (printf "Part 3: ") (cout_top_level '(15 (16 17 18) 12))
    (printf "\n");
    (printf "\nPart 4: ") (count_instances 7 '(7 8 9 7 9 10 7 8 9 7))
    (printf "\n");
    (printf "\nPart 5: ") (count_instances_tr 9 '(7 8 9 7 9 10 7 8 9 7))
    (printf "\n");
    (printf "\nPart 6: ") (count_instances_deep 9 '(7 8 9 (7 9 10) 7 8 9 7))
    (printf "\n");
    
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (eq? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

;End test functions

;Run the tests
(runTests)