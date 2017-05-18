#lang racket
(require racket/include)
(include "exer-2.33.rkt")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position new-row k rest-of-queens)
  (append (list new-row) rest-of-queens))

(define empty-board '())

(define (safe? k positions)
  (iter-check (car positions)
              (cdr positions)
              1))

(define (iter-check new-queen rest-queens i)
  (if (null? rest-queens)
      #t
      (let ((current-queen (car rest-queens)))
        (if (or (= new-queen current-queen)
                (= new-queen (+ current-queen i))
                (= new-queen (- current-queen i)))
            #f
            (iter-check new-queen
                        (cdr rest-queens)
                        (+ i 1))))))

(queens 8)