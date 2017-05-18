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

(define (div-series s1 s2)
  (if (= (stream-car s2) 0)
      (error "Can't be divided by zero")
      (mul-series s1 (receprocal s2))))

(define tangent (div-series sine-series cosine-series))