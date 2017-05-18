#lang racket

(define (filtered-accumulate combiner filter null-value
                             term a next b)
  (if (> a b)
      null-value
      (filtered-accumulate combiner filter
                           (combiner null-value (filter (term a)))
                           term
                           (next a)
                           next
                           b)))

(define (add a b) (+ a b))
(define (mul a b) (* a b))

(define (iden x) x)
(define (inc x) (+ 1 x))

(define (prime x)
  (cond ((= x 1) 0) 
        ((prime? x) x)
        (else 0)))

(define (square n) (* n n)) 

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (gys a b)
  (if (= (gcd a b) 1)
      a
      1))

(define ((gcd? n) a)
  (gys a n))
  

(filtered-accumulate add prime 0 iden 1 inc 10)
(filtered-accumulate mul (gcd? 10) 1 iden 1 inc 10)