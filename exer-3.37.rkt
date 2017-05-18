#lang racket
(require racket/include)
(include "3.3.5.rkt")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c- x y)
  (let ((z (make-connector)))
    (set-value! y (- y) false)
    (adder x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (set-value! y (/ 1.0 y) false)
    (multiplier x y z)
    z))

(define (cv value)
  (let ((x (make-connector)))
    (constant value x)
    x))