#lang racket

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc x) (+ 1 x))
(define (iden x) x)

(define (factorial n)
  (product iden 1 inc n))

(define (square-div a)
  (* (/ (+ a 1) a) (/ (+ a 1) a)))

(define (div a)
  (/ (+ a 1) a))

(define (even? x)
  (= (remainder x 2) 0))

(define (gener n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(define (Wallis-pi n)
  (/ (product gener 1 inc n) 0.25))

(Wallis-pi 100000)
  