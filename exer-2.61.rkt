#lang racket

(define (adjoin-set x set)
  (cond ((null? set) set)
        ((= x (car set)) set)
        ((< x (car set))
         (cons x set))
        ((> x (car set))
         (cons (car set)
               (adjoin-set x (cdr set))))))