#lang racket
(require racket/include)
(include "3.5.1.rkt")
(require racket/include)
(include "common.rkt")

(define (stream-limit s limit)
  (if (< (abs (- (stream-car s)
                 (stream-car (stream-cdr s)))) limit)
      (stream-car (stream-cdr s))
      (stream-limit (stream-cdr s) limit)))