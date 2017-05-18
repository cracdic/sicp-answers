#lang racket
(require racket/include)
(include "exer-2.2.rkt")
(include "common.rkt")

(define (rec left-down right-up)
  (cons left-down right-up))

(define (left-down r)
  (car r))

(define (right-up r)
  (cdr r))

(define (length r)
  (- (x-point (right-up r))
     (x-point (left-down r))))

(define (width r)
  (- (y-point (right-up r))
     (y-point (left-down r))))

(define (perimeter r)
  (* 2 (+ (length r) (width r))))

(define (area r)
  (* (length r) (width r)))