#lang racket

(define (or-gate a1 a2 output)
  (let ((x (make-wire))
        (y (make-wire))
        (z (make-wire)))
    (inverter a1 x)
    (inverter a2 y)
    (and-gate x y z)
    (inverter z output)
    'ok))

(define (or-delay)
  (+ (* 2 inverter-delay) (and-gate-delay)))