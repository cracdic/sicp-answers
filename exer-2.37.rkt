#lang racket
(require racket/include)
(include "exer-2.36.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (i) (dot-product i v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (col-m) (map (lambda (col-cols)
                                (dot-product col-m
                                             col-cols))
                              cols))
         m)))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(transpose m)