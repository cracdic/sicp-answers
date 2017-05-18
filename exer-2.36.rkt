(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;显然，第一个过程需要将每个子序列的car项结合
;第二个过程需要将子序列的cdr项结合

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (carlist seqs))
            (accumulate-n op init (cdrlist seqs)))))

(define (carlist seqs)
  (map car seqs))

(define (cdrlist seqs)
  (map cdr seqs))