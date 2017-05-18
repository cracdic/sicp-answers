#lang racket
(require racket/include)
(include "3.5.1.rkt")

;错误在于，Louis的实现中，只有第一个点是感应值与前一感应值的平均值，
;剩下的都是感应值与前一个平均值的平均值

(define (make-zero-crossings input-stream last-value last-avpt-value)
  (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
    (stream-cons (sign-change-detector avpt last-avpt-value)
                 (make-zero-crossings (stream-cdr input-stream)
                                      (stream-car input-stream)
                                      avpt))))