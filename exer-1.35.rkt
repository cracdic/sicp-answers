#lang racket

(define tolerance 0.00001)

(define (fixed-ponit f first-guess)
  (define (close-enuf? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enuf? guess next)
          next
          (try next))))
  (try first-guess))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(fixed-ponit (lambda (x) (+ 1 (/ 1.0 x))) 2)