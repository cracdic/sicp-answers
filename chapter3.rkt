#lang racket

(define (set-car! x y)
  (let ((z (car x)))
    (set! z y)))

(define m (cons 2 3))

(set-car! m 5)

(m)