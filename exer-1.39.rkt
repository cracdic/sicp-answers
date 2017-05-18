#lang racket

(define (cont-frac-iter n d k)
  (let ((result (/ (n k) (d k))))
    (define (iter a b c result)
      (if (= c 1)
          result
          (iter a b (- c 1) (/ (a (- c 1)) (+ (b (- c 1)) result)))))
    (iter n d k result)))


(define (ex x n)
  (if (= n 1)
      x
      (- (square x))))

(define (expt x)
  (let ((b x))
    (lambda (n) (ex b n))))

(define (square n) (* n n))
(define (even? n)
  (= (remainder n 2) 0))

(define (tan-cf x k)
  (cont-frac-iter (expt x) (lambda (x) (- (* 2 x) 1)) k))

(tan-cf 0.7853 1020)