#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate combiner (combiner null-value (term a)) term
                  (next a) next b)))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
    (iter a null-value))

(define (plus x y)
  (+ x y))
(define (mul x y)
  (* x y))

(define (sum term a next b)
  (accumulate-iter plus 0 term a next b))

(define (product term a next b)
  (accumulate mul 1 term a next b))

(define (inc x) (+ 1 x))
(define (iden x) x)

(sum iden 1 inc 10)
(product iden 1 inc 5)