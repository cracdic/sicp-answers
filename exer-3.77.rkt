#lang racket
(require racket/include)
(include "3.5.1.rkt")

(define (integral-starting-from delayed-integrand initial-value dt)
  (stream-cons initial-value
               (let ((integrand (force delayed-integrand)))
                 (if (stream-null? integrand)
                     the-empty-stream
                     (integral-starting-from (delay (stream-cdr integrand))
                                             (+ (* dt
                                                   (stream-car integrand))
                                                initial-value)
                                             dt)))))

(define (solve f y0 dt)
  (define y (integral-starting-from (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)