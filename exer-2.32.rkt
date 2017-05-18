#lang racket

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (xudui s) rest)))))

(define (xudui s)
  (lambda (rest) (cons (car s) rest)))

;所有的子集的集合=cdr的子集的集合+cdr的子集与car进行构成序对构成的集合
;极限情况为空