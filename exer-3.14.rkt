#lang racket
(require scheme/mpair)

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (mcdr x)))
          (set-mcdr! x y)
          (loop temp x))))
  (loop x '()))

;逆序x

;由图形得出v为(list 'a)
;w为(list 'd 'c 'b 'a)

;验证

(define v (mlist 'a 'b 'c 'd))
(define w (mystery v))

v
w