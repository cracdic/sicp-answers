#lang racket
(require racket/include)
(include "exer-3.70.rkt")

(define (cube-weighted s)
  (+ (cube (car s)) (cube (car (cdr s)))))

(define cube-limit (pairs-weighted cube-weighted integers integers))

(define (Ramanujan s)
  (cond ((stream-null? s) the-empty-stream)
        ((= (cube-weighted (stream-car s))
            (cube-weighted (stream-car (stream-cdr s))))
         (stream-cons (cube-weighted (stream-car s))
                      (Ramanujan (stream-cdr (stream-cdr s)))))
        (else (Ramanujan (stream-cdr s)))))

(define raman! (Ramanujan cube-limit))
 
(stream-head raman! 10)