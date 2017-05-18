#lang racket

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (t1->t2
                   (apply-generic op (t1->t2 a1) a2))
                  (t2->t1
                   (apply-generic op a1 (t2->t1 a2)))
                  (else
                   (error "No method for these types"
                          (list op type-tags))))))
          (error "No method for these types"
                 (list op type-tags))))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((rank1 (tower-type (car type-tags)))
                    (rank2 (tower-type (cadr type-tags))))
                (cond ((> rank1 rank2)
                       (apply-generic rank1 (raise rank2)))
                      ((< rank1 rank2)
                       (apply-generic (raise rank1) rank2)))))
          (error "No method for these types"
                 (list op type-tags))))))

(define (tower-type symbol)
  (tower-rank symbol tower))

(define (tower-rank symb tr)
;返回符号所在高度

;树实现过程省略
              

