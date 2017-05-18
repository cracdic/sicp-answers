#lang racket

(define (samep x y)
  (= (remainder (+ x y) 2) 0))

(define (same-pari x . y)
  (define (same x . y)
    (if (null? (car y))
        '()
        (if (samep x (car (car y)))
            (cons (car (car y)) (same x (cdr (car y))))
            (same x (cdr (car y))))))
  (cons x (same x y)))

(same-pari 2 3 4 5 6 7)