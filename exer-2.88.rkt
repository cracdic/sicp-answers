#lang racket

(define (negative x)
  (apply-generic 'negative x))

;包内

(define (nega-poly p)
  (let ((coe (coeff (car p)))
        (ord (order (car p))))
    (if (null? p)
        '()
        (cons (make-term (- coe) ord)
              (nega-poly (cdr p))))))

;算数包

(define (sub-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (add-terms (term-list p1)
                            (term-list (negative p2))))
      (error "Polys not in same var -- ADD-POLY"
             (list p1 p2))))
