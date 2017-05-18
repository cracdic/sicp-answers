#lang racket

(define (reverse lst)
    (iter lst '()))

(define (iter remained-items result)
    (if (null? remained-items)
        result
        (iter (cdr remained-items)
              (cons (car remained-items) result))))

(define (deep-reverse lst)
  (define (iter remained-items result)
    (if (null? remained-items)
        result
        (iter (cdr remained-items)
              (cons (if (pair? (car remained-items))
                        (deep-reverse (car remained-items))
                        (car remained-items))
                    result))))
  (iter lst '()))

(define x (list (list 1 2) (list 3 4) (list 5 6)))

(deep-reverse x)
(reverse x)
