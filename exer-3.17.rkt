#lang racket

(define (count-pairs x)
  (define (count x save)
    (if (and (pair? x) (not (contain? x save)))
        (count (car x)
               (count (cdr x)
                      (cons x save)))
        save))
  (length (count x '())))

(define (contain? x save)
  (cond ((null? save) #f)
        ((eq? x (car save)) #t)
        (else (contain? x (cdr save)))))

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

(count-pairs z1)
(count-pairs z2)