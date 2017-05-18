;#lang racket
(require racket/include)
(include "3.5.1.rkt")

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (stream-cons s1car (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (stream-cons s2car (merge s1 (stream-cdr s2))))
                 (else
                  (stream-cons s1car
                               (merge (stream-cdr s1)
                                      (stream-cdr s2)))))))))

(define (merge-weighted calc-weight s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2))
               (s1weight (calc-weight (stream-car s1)))
               (s2weight (calc-weight (stream-car s2))))
           (cond ((< s1weight s2weight)
                  (stream-cons s1car (merge-weighted calc-weight
                                                     (stream-cdr s1)
                                                     s2)))
                 ((> s1weight s2weight)
                  (stream-cons s2car (merge-weighted calc-weight
                                                     s1
                                                     (stream-cdr s2))))
                 (else
                  (stream-cons s1car
                               (merge-weighted calc-weight
                                               (stream-cdr s1)
                                               s2))))))))

(define (pairs-weighted calc s t)
  (stream-cons
   (list (stream-car s) (stream-car t))
   (merge-weighted calc
                   (stream-map (lambda (x) (list (stream-car s) x))
                               (stream-cdr t))
                   (pairs-weighted calc (stream-cdr s) (stream-cdr t)))))

;a

(define (sum-weighted s)
  (+ (car s) (car (cdr s))))

(define sum-limit (pairs-weighted sum-weighted integers integers))

;(stream-head sum-limit 100)

;b

(define (sum235-weighted s)
  (let ((i (car s))
        (j (car (cdr s))))
    (+ (* 2 i) (* 3 j) (* 5 i j))))

(define S (stream-cons 1 (merge (scale-stream S 2)
                                (merge
                                 (scale-stream S 3)
                                 (scale-stream S 5)))))

(define prime-limit (pairs-weighted sum235-weighted S S))

;(stream-head prime-limit 100)


