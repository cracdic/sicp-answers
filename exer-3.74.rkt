#lang racket
(require racket/include)
(include "3.5.1.rkt")

(define zero-crossings
  (stream-map sigh-change-detector sense-data (stream-cons
                                               0
                                               sense-data)))