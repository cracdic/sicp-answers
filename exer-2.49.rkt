#lang racket

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define o (make-vect 0.0 0.0))
(define a (make-vect 0.0 1.0))
(define b (make-vect 1.0 0.0))
(define c (make-vect 1.0 1.0))
(define h (make-vect 0.0 0.5))
(define i (make-vect 0.5 0.0))
(define j (make-vect 1.0 0.5))
(define k (make-vect 0.5 1.0))

(define edge-frame
  (segments->painter (list (make-segment o a)
                           (make-segment o b)
                           (make-segment a c)
                           (make-segment b c))))

(define x-painter
  (segments->painter (list (make-segment o c)
                          (make-segment a b))))

(define diamond-painter
  (segments->painter (list (make-segment h i)
                          (make-segment i j)
                          (make-segment j k)
                          (make-segment k h))))

(define wave
  (segments-painter ???))