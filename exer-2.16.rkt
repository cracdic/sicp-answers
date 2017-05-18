#lang racket

;Dependency_problem:

;The so-called dependency problem is a major obstacle
;to the application of interval arithmetic.
;Although interval methods can determine the range of
;elementary arithmetic operations and functions very
;accurately, this is not always true with more complicated
;functions.
;If an interval occurs several times in a calculation
;using parameters, and each occurrence is taken
;independently then this can lead to an unwanted
;expansion of the resulting intervals.

;...

;In general, it can be shown that the exact
;range of values can be achieved,
;if each variable appears only once.
;However, not every function can be rewritten this way.

;from wiki