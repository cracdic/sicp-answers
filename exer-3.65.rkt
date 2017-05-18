#lang racket
(require racket/include)
(include "3.5.1.rkt")
(require racket/include)
(include "exer-3.55.rkt")

(define (ln2-summands n)
  (stream-cons (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

;(display-stream ln2-stream)

;效率感人

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (stream-cons (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

;(display-stream (euler-transform
;                 (euler-transform
;                  (euler-transform ln2-stream))))

;提高了很多，可以很快收敛到解释器显示范围外

(define (make-tableau transform s)
  (stream-cons s
               (make-tableau transform
                             (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))

(display-stream (accelerated-sequence euler-transform
                                     ln2-stream))

;瞬间爆表，根本看不到数2333