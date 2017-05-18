#lang racket
(require scheme/mpair)

(define (make-table)
  (mlist (mcons lowest-key '*table*)))

(define (make-leaf key value)
  (mlist (mcons key value) '()))

(define (key-leaf leaf)
  (mcar (mcar leaf)))

(define (value-leaf leaf)
  (mcdr (mcar leaf)))

(define (lower-leaf leaf)
  (mcar (mcdr leaf)))

(define (higher-leaf leaf)
  (mcdr (mcdr leaf)))

(define (assoc key table)
  (cond ((null? table) table)
        ((equal? key (key-leaf table)) table)
        ((higher? key (key-leaf table))
         (lookup key (higher-leaf table)))
        ((lower? key (key-leaf table))
         (lookup key (lower-leaf table)))
        (else (error "can't clarify key" key))))

(define (lookup key table)
  (let ((record (assoc key table)))
    (if (null? record)
        false
        (value-leaf record))))

(define (insert! key value table)
  (let ((record (assoc key table)))
    (if (null? record)
        (set! record (make-leaf key value))
        (set-mcar! record (mcons key value)))))