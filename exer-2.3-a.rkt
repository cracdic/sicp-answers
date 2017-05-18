#lang racket
(require racket/include)
(include "exer-2.2.rkt")
(include "common.rkt")

(define (rec l w)
  (cons l w))

(define (leng r)
  (car r))

(define (wid r)
  (cdr r))

(define (length r)
  ((abs (- (x-point (end-segment (leng r)))
           (x-point (start-segment (leng r)))))))

(define (width r)
  ((abs (- (y-point (end-segment (wid r)))
           (y-point (start-segment (wid r)))))))

(define (perimeter r)
  (* 2 (+ (length r) (width r))))

(define (area r)
  (* (length r) (width r)))

