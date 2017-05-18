#lang racket
(require racket/include)
(include "3.3.5.rkt")

(define b (make-connector))
(define a (make-connector))
(define c (make-connector))

(define (averager a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (adder a b u)
    (multiplier u v c)
    (constant 0.5 v)))
  
(averager a b c)

(probe "average" c)
(probe "a" a)
(probe "b" b)

(set-value! a 2 'user)
(set-value! c 5 'user)
