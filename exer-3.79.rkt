#lang racket
(require racket/include)
(include "3.5.1.rkt")

(define (f x y)
  (+ x y))

(define (solved-2nd a b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (stream-map f y dy))
  y)
