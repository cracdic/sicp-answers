#lang racket

(define (install-scheme-number-package)
  (define (poly-zero? polynomial)
    (empty-termlist? polynomial))

  (put '=zero 'polynomial poly-zero)
  'done)

;这里我认为不应该逐个判断系数是否为0，因为按照我们的构造方式，系数为零的项是会被去掉的