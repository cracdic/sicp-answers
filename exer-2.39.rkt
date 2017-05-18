#lang racket
(require racket/include)
(include "exer-2.38.rkt")

;(define (reverse sequence)
;  (fold-left (lambda (x y) (cons y x))
;                '() sequence))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(reverse (list 1 (list 2 5) 3))