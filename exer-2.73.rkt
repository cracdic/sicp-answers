#lang racket

;a 因为number和same-variable是只基于数据的判断而不是操作判断
;b

;(define (deriv exp var)
;  (cond ((number? exp) 0)
;        ((variable? exp) (if (same-variable? exp var) 1 0))
;        (else ((get 'deriv (operator exp)) (operands exp)
;                                           var))))

;(define (operator exp) (car exp))
;(define (operator exp) (cdr exp))

;(define (install-deriv-package)
;  (define (deriv-product exp var)
;    (make-sum
;     (make-product (multiplier exp)
;                   (deriv (multiplicand exp) var))
;     (make-prodect (deriv (multiplier exp) var)
;                   (multiplicand exp))))
;  (define (deriv-sum exp var)
;    (make-sum (deriv (addend exp) var)
;              (deriv (augend exp) var)))

;  (put '(sum) '+ (lambda (x y) (deriv-sum exp var)))
;  (put '(product) '* (lambda (x y) (deriv-product exp var))))

;d 改put

