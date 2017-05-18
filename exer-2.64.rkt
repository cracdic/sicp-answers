#lang racket

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;平衡树 = （cons （make-tree 树根 左子树 右子树）最终剩余项）
;左子树 = （car 左子平衡树）（计算得长度）（使用原列表）
;以左子平衡树后第一个剩余项为树根
;右子树 = （car 右子平衡树）（计算得长度）（左子平衡树后其余剩余项为列表）
;右子平衡树剩余项为最终剩余项
;进行递归

;O(n)