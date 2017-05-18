#lang racket
(require racket/include)
(include "common.rkt")

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
    (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral P edge times)
  (* (size edge) (monte-carlo times P)))

(define (P squ circle)
  (let ((x-distance (- (x-P (center circle))
                       (random-in-range (x1 squ)
                                        (x2 squ))))
        (y-distance (- (y-P (center circle))
                       (random-in-range (y1 squ)
                                        (y2 squ)))))
    (<= (+ (square x-distance) (square y-distance))
        (square (r circle)))))

(define (size edge)
  (* (length edge) (width edge)))

(define (length square)
  (- (car (cdr square)) (car (car square))))
(define (width square)
  (- (cdr (cdr square)) (cdr (car square))))
(define (x1 square)
  (car (car square)))
(define (y1 square)
  (cdr (car square)))
(define (x2 square)
  (car (cdr square)))
(define (y2 square)
  (cdr (cdr square)))

(define (make-square left-below right-above)
  (cons left-below right-above))

(define (make-point x y)
  (cons x y))

(define (x-P point)
  (car point))
(define (y-P point)
  (cdr point))

(define (make-circle P r)
  (cons P r))

(define (center circle)
  (car circle))

(define (r circle)
  (cdr circle))

(define sq (make-square
            (make-point 2.0 4.0)
            (make-point 8.0 10.0)))
(define cir (make-circle
             (make-point 5.0 7.0)
             3.0))
(define exp (P sq cir))

(x1 sq)

(estimate-integral exp sq 100)