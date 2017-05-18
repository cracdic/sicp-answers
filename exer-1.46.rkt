#lang racket

(define (iterative-improve good-enuf? improve)
  (lambda (guess)
    (define (try x)
      (if (good-enuf? x)
          x
          (try (improve x))))
    (try guess)))

(define guess 1.0)