#lang racket

(define (ripple-carry-adder Ak Bk Sk C-out)
  (define (iter Ak Bk Sk C-in)
    (if (not (null? Ak))
        (let ((C-out (make-wire)))
          (full-adder (car Ak) (car Bk) C-in (car Sk) C-out)
          (iter (cdr Ak) (cdr Bk) (cdr Sk) C-out))
        'ok))
  (iter Ak Bk Ck C-out))
          