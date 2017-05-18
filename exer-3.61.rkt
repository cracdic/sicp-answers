#lang racket
(require racket/include)
(include "3.5.1.rkt")
(require racket/include)
(include "exer-3.59.rkt")
(require racket/include)
(include "exer-3.60.rkt")

(define (receprocal s)
  (stream-cons 1 (mul-series (scale-stream (stream-cdr s) (- 1))
                             (receprocal s))))