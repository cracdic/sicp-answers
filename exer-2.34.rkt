#lang racket
(require racket/include)
(include "exer-2.33.rkt")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff(* x higher-terms)))
              0
              coefficient-sequence))