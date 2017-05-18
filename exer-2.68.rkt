;#lang racket
;(require racket/include)
;(include "2.3.4.rkt")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (contain? symbol symb-tree)
  (cond ((null? symb-tree) #f)
        ((eq? symbol (car symb-tree)) #t)
        (else (contain? symbol (cdr symb-tree)))))
                  

(define (encode-symbol symbol tree)
  (cond ((leaf? tree)
         '())
        ((contain? symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((contain? symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "wrong symbol -- CONTAIN?" symbol))))

;(define (encode-symbol symbol tree)
;  (cond ((and (leaf? (left-branch tree))
;              (contain? symbol (symbols (left-branch tree))))
;         (list 0))
;        ((and (leaf? (right-branch tree))
;              (contain? symbol (symbols (right-branch tree))))
;         (list 1))
;        ((and (not (leaf? (left-branch tree)))
;              (contain? symbol (symbols (left-branch tree))))
;         (cons 0 (encode-symbol symbol (left-branch tree))))
;        ((and (not (leaf? (right-branch tree)))
;              (contain? symbol (symbols (right-branch tree))))
;         (cons 1 (encode-symbol symbol (right-branch tree))))
;        (else (error "wrong symbol -- CONTAIN?" symbol))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

;(encode-symbol 'D sample-tree)