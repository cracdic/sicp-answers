#lang racket
(require racket/include)
(include "common.rkt")

(define (make-monitored f)
  (let ((times 0))
    (lambda (input)
      (cond ((eq? input 'how-many-calls?) times)
             ((eq? input 'reset-count) (set! times 0))
             (else (begin (set! times (+ times 1))
                          (f input)))))))

(define s (make-monitored square))
(s 10)
(s 10)

(s 'how-many-calls?)