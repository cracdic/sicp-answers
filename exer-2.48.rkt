#lang racket
(require racket/include)
(include "exer-2.23.rkt")

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))