;#lang racket
;(require racket/include)
;(include "3.5.1.rkt")

;a

(define (div-streams s1 s2)
    (stream-map / s1 s2))

(define rational-s (div-streams ones integers))

(define (integrate-series power-series)
  (mul-streams power-series rational-s))

;b

(define cosine-series
  (stream-cons 1 (integrate-series (scale-stream sine-series -1))))

(define sine-series
  (stream-cons 0 (integrate-series cosine-series)))
