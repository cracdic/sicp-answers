#lang racket

(define (addend s) (cadr s))

(define (augend s)
  (if (null? (cdddr s))
      (cddr s)
      (cons '+ (cddr s))))

(define (make-sum a1 . a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        ((number? a2) (list '+ a1 a2))
        (else (cons a1 a2))))

(define (=number? exp num)
    (and (number? exp)
         (= exp num)))
