#lang racket

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (fixed-point f first-guess)
  (define (close-enuf? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enuf? guess next)
          next
          (try next))))
  (try first-guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define tolerance 0.00001)
(define dx 0.000001)

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (zero a b c)
  (newtons-method (cubic a b c) 1))

(zero (- 6) 11 (- 6)) 