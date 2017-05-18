#lang racket

(define (adjoin-term term term-list)
  (let ((disparity (- (order term) (- (length term) 1))))
    (if (= (coeff term) 0)
        term-list
        (if (> disparity 0)
            (append (higher-list term disparity) (term-list))
            (edit-term term term-list (- disparity))))))



(define (higher-list term i)
  (define (zero-list n)
    (if (= n 0)
        '()
        (cons 0 (zero-list (- n 1)))))
  (cons (coeff term) (zero-list (- i 1))))

(define (edit-term term term-list i)
  (if (= i 0)
      (cons (+ (coeff term) (car term-list)) (cdr term-list))
      (cons (car term-list) (edit-term term (cdr term-list) (- i 1)))))

(define (the-empty-termlist) '())
(define (first-term term-list) (make-term (car term-list)
                                          (- (length term-list) 1)))
(define (rest-terms term-list) (cdr term-list))
(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff) (cons order coeff))
(define (order term) (car term))
(define (coeff term) (cdr term))
  
  
  