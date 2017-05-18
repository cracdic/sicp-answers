#lang racket
(require racket/include)
(include "3.5.1.rkt")

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (stream-cons 2 (add-streams ones integers)))

(define factorials (stream-cons 1 (mul-streams integers factorials)))

(stream-ref factorials 3)