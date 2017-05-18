#lang racket

;(a b) (c d)  (a>0, b>0, c>0, d>0,a,b为区间中点，c,d为百分比误差)
;[a(1-b)*c(1-d)+a(1+b)*c(1+d)]/2=ac(bd+1)
;center=ac(bd+1)
;percent=[ac(bd+1)-a(1-b)*c(1-d)]/ac(bd+1)=(p+q)/(pq+1)
;pq->0,percent->(p+q)