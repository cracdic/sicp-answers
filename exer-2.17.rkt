(define (last-pair lst)
  (cond ((null? lst)
         (error "empty list"))
         ((null? (cdr lst))
          (list (car lst)))
         (else
          (last-pair (cdr lst)))))