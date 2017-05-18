#lang racket
(require racket/include)
(include "3.5.1.rkt")

;-ic = il
;ic = C*(dVc/dt)
;=>(dVc/dt) = -il/C

;VR = iR*R
;VL = L(diL/dt)
;Vc = VL + VR
;=> (diL/dt) = (1/L)Vc - (R/L)*iL

(define (RLC R L C dt)
  (lambda (vC0 iL0)
    (define vC (integral (delay dvC) vC0 dt))
    (define iL (integral (delay diL) iL0 dt))
    (define dvC (scale-stream iL (- (/ 1 C))))
    (define diL (add-streams (scale-stream vC (/ 1 L))
                             (scale-stream iL (- (/ R L)))))
    (cons vC iL)))

(define RLC1 (RLC 1 1 0.2 0.1))

(RLC1 0 10)