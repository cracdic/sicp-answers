#lang racket
(require racket/include)
(include "exer-2.7-2.8.rkt")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (cons (* center (- 1 percent)) (* center (+ 1 percent))))

(define (percent i)
  (* 1.0 (/ (width i) (center i))))

(define (part1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (part2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define r1 (make-interval 4.70 4.80))
(define r2 (make-interval 4.50 5.00))

(div-interval r1 r1)
(div-interval r1 r2)

;结果不是（1，1）