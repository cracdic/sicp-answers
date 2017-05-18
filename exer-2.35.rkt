#lang racket
(require racket/include)
(include "exer-2.33.rkt")

;from SICP解题集
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree)
                         (count-leaves sub-tree)
                         1))
                   t)))

(define tree (list (list 1 9) (list 2 4) (list 2 (list 2 25) 22)))

(count-leaves tree)