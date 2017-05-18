#lang racket

(define (rand symbol)
  (let ((x random-init))
  (cond ((= symbol 'generate) (lambda ()
                                (set! x (rand-update x))
                                x))
        ((= symbol 'reset) (lambda (new-value) (set! x new-value)))
        (else (error "unknown symbol -- RAND"
                     symbol)))))