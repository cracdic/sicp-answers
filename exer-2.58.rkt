#lang racket

(define (addend s) (car s))
(define (augend s) (caddr s))

(define (make-sum a1 a2)
  ((=number? a1 0) a2)
  ((=number? a2 0) a1)
  ((and (number? a1) (number? a2)) (+ a1 a2))
  (else (list a1 '+ a2)))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

;b
;我们需要设计能够分别判断数，表达式，运算符和优先级的谓词
;需要适当的选择函数
;需要能够对中缀表达式进行处理的构造函数
;需要判断表达式中的加号，将两端加上括号后作为表达式的addend与augend