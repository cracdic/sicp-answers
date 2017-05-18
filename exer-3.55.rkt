;#lang racket
;(require racket/include)
;(include "3.5.1.rkt")

(define (partial-sums s)
  (add-streams (stream-cons 0 (partial-sums s))
               s))

(define s (partial-sums integers))
