#lang racket

;由于只是大意的用递归来考虑导致出错，因为list的定义是car为第一项，
;而cdr为后几项的list

;(define (reverse lst)
;  (if (null? (cdr lst))
;      lst
;      (cons (reverse (cdr lst)) (car lst))))

;(car (reverse (list 1 4 9 16 25)))

;此题迭代比较简便，答案from SICP解题集

(define (reverse lst)
    (iter lst '()))

(define (iter remained-items result)
    (if (null? remained-items)
        result
        (iter (cdr remained-items)
              (cons (car remained-items) result))))

(reverse (list 1 4 9 16 25))