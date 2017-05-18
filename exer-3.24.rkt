#lang racket
(require scheme/mpair)

(define (make-table)
  (let ((similarity 0.5)
        (table (mlist '*table)))
    (define (same-key? x y)
      (lambda (sim)
        (and (< y (+ x sim))
             (> y (- x sim)))))
    (define (lookup key)
      (let ((record (assoc key (mcdr table))))
        (if record
            (mcdr record)
            false))) 
    (define (assoc key records)
      (cond ((null? records) false)
            (((same-key? key (mcar (mcar records))) similarity) (mcar records))
            (else (assoc key (mcdr records)))))
    (define (insert! key value)
      (let ((record (assoc key (mcdr table))))
        (if record
            (set-mcdr! record value)
            (set-mcdr! table
                      (mcons (mcons key value) (mcdr table)))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup) lookup)
            ((eq? m 'insert!) insert!)
            ((eq? m 'change-similarity) (lambda (new)
                                          (set! similarity new)))))
    dispatch))