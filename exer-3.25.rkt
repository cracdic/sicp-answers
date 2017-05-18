#lang racket

(define (make-table)
  (let ((local-table (mlist '*table*)))
    (define (lookup table)
      (define (look key-set)
        ((let ((subtable (assoc (mcar key-set) (mcdr local-table))))
           (if subtable
               (if (not (or (pair? (mcdr subtable))
                        (null? (mcdr subtable)))) 
                   (mcdr subtable)
                   ((lookup subtable) (mcdr key-set)))))))
      look)
    
                   
                