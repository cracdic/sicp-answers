#lang racket
(require scheme/mpair)

(define (append! x y)
  (set-mcdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (mcdr x))
      x
      (last-pair (mcdr x))))

(define x (mlist 'a 'b))
(define y (mlist 'c 'd))
(define z (mappend x y))

(mcdr x)

(define w (append! x y))

(mcdr x)