#lang racket
(require scheme/mpair)

;检查特殊值首项是否重复出现，应该还需要检查car，cadr等是否有环？？？
;书上曾说明过list与list structure的区别，故下面解法是正确的

(define (loop? l)
  (let ((identity 'identity))
    (define (iter remain-list)
      (cond ((null? remain-list)
             #f)
            ((eq? identity (mcar remain-list))
             #t)
            (else
             (set-mcar! remain-list identity)
             (iter (mcdr remain-list)))))
    (iter l)))