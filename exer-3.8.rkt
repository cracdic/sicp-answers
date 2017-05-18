#lang racket

(define (f x)
  (let ((i 1))
    (if (= x 0)
        (begin (set! i 0) i)
        i)))

(+ (f 0) (f 1))