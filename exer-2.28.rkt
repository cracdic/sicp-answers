#lang racket

(define (fringe lst)
  (cond ((null? lst)
         '())
        ((not (pair? lst))
         (list lst))
        (else
         (append (fringe (car lst))
                 (fringe (cdr lst))))))

(define x (list (list 1 2 3 4 5) (list 3 4) (list 5 6)))

(fringe x)