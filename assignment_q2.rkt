#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;Part 1
(define (ins_beg element lst)
  (display "Hello, I'm ins_beg!\n")
  (cons element lst))

;Part 2
(define (ins_end element lst)
  (display "ins_end!\n")
  (append lst (list element)))

;Part 3
(define (cout_top_level list)
  (display "cout_top_level\n")
  (define a 0)
  (define (count lst)
      (if  (empty? lst)
           (display "Elements counted: ")
           (begin
             (set! a (+ a 1))
             (count (cdr lst)))))
  (count list)
   (display a))

;Part 4
(define (count_instances el list)
  (display "count_instances\n")
  (define a 0)
  (define (count lst)
  (if (empty? lst)
      (display "Instances counted: ")
      (begin
        (if (eq? el (car lst))
            (set! a (+ a 1))
            (set! a a))
        (count (cdr lst)))))
  (count list)
  (display a))

;Part 5
(define (count_instances_tr element list)
  (display "count_instances_tr\n")
  (define (count lst total)
    (if (empty? lst)
        (begin
        (display "Instances counted: ")
        (display total))
        (begin
          (if (eq? element(car lst))
            (count (cdr lst) (+ total 1))
            (count (cdr lst) total)))
        ))
  (count list 0))

;Part 6
(define (count_instances_deep element list)
  (display "count_instances_deep\n")
  (define a 0)
  (define (count lst)
    (if (empty? lst)
        (void)
        (begin
          (if (eq? element (car lst))
              (begin
                (set! a (+ a 1))
                (count (cdr lst)))
              (begin
                (if (number? (car lst))
                    (count (cdr lst))
                    (begin
                      (count (car lst))
                      (count (cdr lst)))))))))
  (count list)
  (display "Instances counted: ")
  (display a))
