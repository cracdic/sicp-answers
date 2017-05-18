#lang racket
(require racket/include)
(include "common.rkt")

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car p)
  (if (= (remainder p 2) 0)
      (+ 1 (car (/ p 2)))
      0))

(define (cdr p)
  (if (= (remainder p 3) 0)
      (+ 1 (cdr (/ p 3)))
      0))

(car (cons 4 5))
(cdr (cons 4 5))