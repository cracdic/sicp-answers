#lang racket

;由上一题中得知list与list structure的区别后，这道题就可以用Robert Floyd的方法解决
;这里尝试Brent判圈算法

;Brent's algorithm
;Richard P. Brent 描述了一种可替代算法的判圈算法，同样使用了序列中
;的两个指针，只是快指针的速度每次加倍

(define (check-circle l)
  (cond ((null? (quick-cdr l)) #f)
        ((eq? (cdr l) (quick-cdr l)) #t)
        (else (check-circle (cdr l) (quick-cdr l)))))

(define (quick-cdr l)
  (let ((times 2))
    (if (null? (cdr-iter l times))
        '()
        (begin (set! times (* 2 times))
               (cdr-iter l times)))))

(define (cdr-iter l times)
  (cond ((null? l) '())
        ((= times 0) l)
        (else (cdr-iter l (- 1 times)))))
  