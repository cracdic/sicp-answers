#lang racket
(require racket/include)
(include "3.3.5.rkt")

(define a (make-connector))
(define b (make-connector))
(set-value! a 10 'user)
