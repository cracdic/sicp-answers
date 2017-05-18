#lang racket
(require racket/include)
(include "3.5.1.rkt")

;求num与radix的积，再用积对den求整数商和余数，将求余的结果作为新的num重复进行过程
;最终得到整数商的流

;这个过程也就是长除法

;(expand 1 7 10)
;(1 4 2 8 5 7 ... 1 4 2 8 5 7)
;(expand 3 8 10)
;(3 7 5 0 0 0 0 0 0 0 ... 0 0)