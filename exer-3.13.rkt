#lang racket
(require scheme/mpair)

(define (append! x y)
  (set-mcdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (mcdr x))
      x
      (last-pair (mcdr x))))

(define (make-cycle x)
  (set-mcdr! (last-pair x) x)
  x)

(define z (make-cycle (mlist 'a 'b 'c)))

(last-pair z)

;将尾部cdr指针指向首部，导致死循环