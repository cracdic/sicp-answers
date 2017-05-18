#lang racket
(require racket/include)
(include "exer-2.33.rkt")

(define (s-sum? s)
  (lambda (pair) (and
                  (= (+ (car pair)
                        (cadr pair)
                        (cadr (cdr pair))) s)
                  (not (or (= (car pair) (cadr pair))
                           (= (car pair) (cadr (cdr pair)))
                           (= (cadr pair) (cadr (cdr pair))))))))

(define (s-sum-pairs n s)
  (filter (s-sum? s)
          (flatmap
           (lambda (i)
             (flatmap (lambda (j)
                    (map (lambda (k) (list i j k))
                         (enumerate-interval 1 n)))
                    (enumerate-interval 1 n)))
             (enumerate-interval 1 n))))

(s-sum-pairs 5 9)