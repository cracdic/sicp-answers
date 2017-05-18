#lang racket
(require racket/include)
(include "3.5.1.rkt")
(require scheme/mpair)
(require racket/stream)

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))

(stream-ref y 7)
(display-stream z)

;memo-proc的作用是返回已求过的值
;本题中共求值了两个表达式，由于accum是一个赋值过程，所以(stream-ref y 7)求值
;后主环境中sum值为210，memo-proc会将accum的每次应用存储在主环境中，所以第二次
;(display-stream z)应用accum时，会直接返回第一次求值时的结果(1,3,6...210)，
;如果没有memo-proc，则会再次进行求值，此时accum从210开始累加