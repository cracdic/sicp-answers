#lang racket

(define (div-term L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div-terms (add-poly L1
                                          (negate (mul-poly
                                                   (list (make-term
                                                          new-c
                                                          new-o))
                                                   L2))) 
                                L2)))
                (adjoin (make-term new-c new-o) (car rest-of-result))))))))
                      
                      