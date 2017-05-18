#lang racket

(define (cont-frac-iter n d k)
  (let ((result (/ (n k) (d k))))
    (define (iter a b c result)
      (if (= c 1)
          result
          (iter a b (- c 1) (/ (a (- c 1)) (+ (b (- c 1)) result)))))
    (iter n d k result)))

(define (euler k)
  (if (= (remainder (+ k 1) 3) 0)
      (* 2 (/ (+ 1 k) 3))
      1))

(cont-frac-iter (lambda (i) 1.0) euler 100)