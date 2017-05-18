#lang racket

(define (install-dense-package)
  (define (adjoin-term term term-list)
    (let ((disparity (- (order term) (- (length term) 1))))
      (if (> disparity 0)
          (append (higher-list term disparity) (term-list))
          (edit-term term term-list (- disparity)))))
  
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

  (define (tag term-list) (attach-tag 'dense term-list))
  
  (define (the-empty-termlist) '())
  (define (first-term term-list) (make-term (car term-list)
                                            (- (length term-list) 1)))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))

  (put 'adjoin-term '(term dense) (adjoin-term))
  'done)

(define (install-term-package)
  (define (make-term order coeff) (cons order coeff))
  (define (order term) (car term))
  (define (coeff term) (cdr term))
  (define (tag term) (attach-tag 'term term))