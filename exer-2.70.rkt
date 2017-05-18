#lang racket
(require racket/include)
(include "2.3.4.rkt")
(require racket/include)
(include "exer-2.68.rkt")
(require racket/include)
(include "exer-2.69.rkt")

(define getjob-tree
  (generate-huffman-tree '((a 2) (na 16) (boom 1) (Sha 3)
                           (Get 2) (yip 9) (job 2) (Wah 1))))

(define message
  '(Get a job
    Sha na na na na na na na na
    Get a job
    Sha na na na na na na na na
    Wah yip yip yip yip yip yip yip yip yip
    Sha boom))

(encode message getjob-tree)

;84 108
