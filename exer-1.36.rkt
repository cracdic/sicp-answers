#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enuf? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enuf? guess next)
             (newline)
             next)
            (else
            (newline)
            (display next)
            (try next)))))
  (try first-guess))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
(newline)
(display " *** ")
(newline)
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2)