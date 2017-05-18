#lang racket

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y)))

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

(define (exp n x)
  (if (= n 0)
      1
      (* x (exp (- n 1) x))))