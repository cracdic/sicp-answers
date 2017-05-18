#lang racket

;a)
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

;b)
(define (length branch)
  (car branch))

(define (structure branch)
  (cdr branch))

(define (total-weight mobile)
  (+ (weight left-branch) (weight (right-branch))))

(define (weight branch)
  (if (not (pair? (structure branch)))
      (structure branch)
      (+ (weight (left-branch (structure branch)))
         (weight (right-branch (structure branch))))))

;c)
(define (check mobile)
  (if (= (moment (left-branch mobile))
         (moment (right-branch mobile)))
      #t
      #f))

(define (moment branch)
  (if (not (pair? (structure branch)))
      (structure branch)
      (weight branch)))

(define (balance? mobile)
  (if (check mobile)
      (display "balance mobile")
      (display "not balance")))

;d) 仅修改构造函数

      