#lang racket

(define (split bigger smaller)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((small ((split bigger smaller) painter (- n 1))))
          (bigger painter
                 (smaller small small))))))