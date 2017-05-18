#lang racket
(require racket/include)
(include "exer-3.70.rkt")

(define (cube-weighted s)
  (+ (cube (car s)) (cube (car (cdr s)))))

(define cube-limit (pairs-weighted cube-weighted integers integers))

(define (Ramanujan s)
  (let ((ra1 (stream-car s))
        (ra2 (stream-car (stream-cdr s)))
        (ra3 (stream-car (stream-cdr (stream-cdr s)))))
    (cond ((stream-null? s) the-empty-stream)
          ((and (= (cube-weighted ra1) (cube-weighted ra2))
                (= (cube-weighted ra1) (cube-weighted ra3)))
           (stream-cons (list (cube-weighted (stream-car s))
                              ra1
                              ra2
                              ra3)
                        (Ramanujan (stream-cdr
                                    (stream-cdr
                                     (stream-cdr s))))))
           (else (Ramanujan (stream-cdr s))))))
    
(define raman! (Ramanujan cube-limit))
 
(stream-head raman! 3)