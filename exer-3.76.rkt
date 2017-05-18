#lang racket
(require racket/include)
(include "3.5.1.rkt")

(define (smooth s)
  (let ((avpt (/ (+ (stream-car s)
                    (stream-car (stream-cdr s)))
                 2)))
    (stream-cons avpt (smooth (stream-cdr s)))))

(define (make-zero-crossings s)
  (let ((avg-s (smooth s)))
    (stream-map sign-change-detector
                avg-s
                (stream-cons 0 avg-s))))