#lang racket

;题目的意思是，这个过程需要一个表示需求的流的参数，流的每个元素可以为generate请求
;或要重置的数

;kana的答案

(define (rand s)
  (define (generate-random rand-initial)
    (define random-numbers
      (stream-cons rand-initial
                   (stream-map rand-update random-numbers)))
    random-numbers)  
  (define (process requests numbers)
    (stream-cons
     (stream-car numbers)
     (dispatch (stream-cdr s) (stream-cdr numbers))))
    
  (define (dispatch s numbers)
    (let ((r (stream-car s)))
      (cond ((eq? r 'generate)
             (process s numbers))
            ((number? r)
             (process s (stream-cdr (generate-random r))))
            (else (error "Unknown request: " r)))))
  (define init 0)
  (dispatch s (generate-random init)))