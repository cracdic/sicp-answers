(define (for-each proc items)
  (define (map proc items)
    (if (null? items)
        #t
        (cons (proc (car items))
              (map proc (cdr items)))))
  (map proc items))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))