#lang racket
(require racket/include)
(include "3.3.2.rkt")
(require scheme/mpair)

(define (print-queue q) (mcar q))

(define q1 (make-queue))

(print-queue (insert-queue! q1 'a))
(print-queue (insert-queue! q1 'b))