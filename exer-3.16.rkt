#lang racket

(define x (list 'a 'b))
(define z1 (cons x x))

(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs z1)
(count-pairs z2)

;因为会重复计算“同一”序对，所以会导致错误
;3 没有“同一”
;4 一个“同一”
;7 两个“同一”
;不返回 首尾相接循环