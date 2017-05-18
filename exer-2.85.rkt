#lang racket

(define (drop x)
  (let ((project-proc (get 'project (type-tag x))))
    (if (equ? project-proc '())
        x
        (drop (project-proc)))))

;包内

(put 'project 'complex
     (lambda (x) (if (= (imag-part x) 0)
                   make-real (imag-part x)
                   '())))

(put 'project 'real
     (lambda (x) (make-scheme-number (round (/ (numer x) (denom x))))))

(put 'project 'rational
     (lambda (x) (if (= (denom x) 1)
                     (make-interger numer)
                     ('()))))

;apply-generic只需要添加drop就可以了