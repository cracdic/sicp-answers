#lang racket
(require racket/include)
(include "3.5.1.rkt")

;在pairs的基础上再用同样的方法合并流

(define (3-pairs s t u)
  (stream-cons
   (cons (stream-car s) (stream-car (pairs t u)))
   (interleave
    (stream-map (lambda (x) (cons (stream-car s) x))
                (stream-cdr (pairs t u)))
    (3-pairs (stream-cdr s) (stream-cdr t) (stream-cdr u)))))
    
(define 3-integer (3-pairs integers integers integers))

;(stream-head 3-integer 100)

(define (triples int-pairs)
  (stream-filter (lambda (pair)
                   (cond ((= (+ (square (car pair))
                                (square (car (cdr pair))))
                             (square (car (cdr (cdr pair)))))
                          pair)
                         (else false)))
                         int-pairs))

(stream-head (triples 3-integer) 7)