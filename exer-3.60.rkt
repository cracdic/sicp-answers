;#lang racket
;(require racket/include)
;(include "3.5.1.rkt")
;(require racket/include)
;(include "exer-3.59.rkt")

;从题目形式可以看出得先给出第一项，剩下的递归求和部分可以通过对多项式分解得出

(define (mul-series s1 s2)
  (stream-cons (* (stream-car s1)
                  (stream-car s2))
               (add-streams (mul-series (stream-cdr s1) s2)
                            (scale-stream
                             (stream-cdr s2) (stream-car s1)))))

(define constant (add-streams (mul-series sine-series sine-series)
                              (mul-series cosine-series cosine-series)))

(stream-head constant 10)