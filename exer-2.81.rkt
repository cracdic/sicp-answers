#lang racket

;循环强制

;并没有，不能正常工作

;(put-coercion 'scheme-number 'complex scheme-number->complex)
;(put-coercion <op> <type> <item>)
;(get-coercion <op> <type>)

;(define (apply-generic op . args)
;  (let ((type-tags (map type-tag args)))
;    (let ((proc (get op type-tags)))
;      (if proc
;          (apply proc (map contents args))
;          (cond ((equ? args) error "No method for these types")
;                ((= (length args) 2)
;                 (let ((type1 (car type-tags))
;                       (type2 (cadr type-tags))
;                       (a1 (car args))
;                       (a2 (cadr args)))
;                   (let ((t1->t2 (get-coercion type1 type2))
;                         (t2->t1 (get-coercion type2 type1)))
;                     (t1->t2
;                      (apply-generic op (t1->t2 a1) a2))
;                     (t2->t1
;                      (apply-generic op a1 (t2->t1 a2)))
;                     (else
;                      (error "No method for these types"
;                             (list op type-tags))))))
;                (error "No method for these types"
;                       (list op type-tags))))))