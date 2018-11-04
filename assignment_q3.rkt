#lang racket

;Part 1
(define (show_tree tree)
  (begin
    (cond
      [(empty? (car tree)) (display " ")]
      [else (show_tree (car tree))]
      )
    (display (car (cdr tree)))
    (cond
      [(empty? (caddr tree)) (display " ")]
      [else (show_tree (car (cdr (cdr tree))))]
      )
    ))
(display "Part 1: ")(show_tree '((() 10 ())13 ((() 17 ()) 19 (() 21 ()))))
(display "\n");

;Part 2
(define (search item lst)
  (cond
    [(empty? lst) #t]
    [(equal? item (car (cdr lst))) #f]
    [(< item (car (cdr lst))) (search item (car lst))]
    [else (search item (car (cdr (cdr lst))))]
    ))

(display "\nPart 2: ")
(search 4 '((() 10 ()) 13 ((() 17 ()) 19 (() 21 ()))))
(display "\n");

;Part 3
(define (insert_value item lst)
  (cond
    [(empty? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst)) "item found"]
    [(< item (cadr lst)) (list (insert_value item (car lst)) (cadr lst) (caddr lst))]
    [else (list (car lst) (cadr lst) (insert_value item (caddr lst)))]
))

(display "Part 3:  List: ")
(define tree '((() 22 ()) 24 ((() 26 ()) 28 (() 29 ()))))
(show_tree tree)
(display "\n         Inserting item into list:  ")
(define tree4 (insert_value 30 tree))
(show_tree tree4)
(display "\n");

;Part 4
(define (insert_list lst tree)
  (cond
   [(empty? lst) tree]
   [else (insert_list (cdr lst) (insert_value (car lst) tree))]
  ))

(display "\nPart 4: ")
(insert_list '(21 34 26 19 12) '())
(display "\n");

;Part 5
(define (tree-sort lst)
  (show_tree (insert_list lst '()))
  )

(display "Part 5: ")
(tree-sort '(21 34 26 19 12))
(display "\n");

;Part 6
(define (ascension_descension_tree_sort lst fn)
  (show_tree (list_into_tree lst '() fn))
  )

(define (list_into_tree lst tree fn)
  (cond
   [(empty? lst) tree]
   [else (list_into_tree (cdr lst) (el_into_tree (car lst) tree fn) fn)]
  ))

(define (el_into_tree item lst fn)
  (cond
    [(empty? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst)) "item found"]
    [(fn item (cadr lst)) (list (el_into_tree item (car lst) fn) (cadr lst) (caddr lst))]
    [else (list (car lst) (cadr lst) (el_into_tree item (caddr lst) fn))]
))

(display "\nPart 6:   ascending: ")
(ascension_descension_tree_sort '(98 22 44 36 74 13 ) <)
(display "\n          descending: ")
(ascension_descension_tree_sort '(98 22 44 36 74 13) >)
(display "\n          ascending based on last digit: ")
