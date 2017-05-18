#lang racket

;对于一条线，只有当应用了add-to-agenda!过程时，才会向the-agenda
;表中添加待执行的过程，这个过程存在after-delay中，而after-delay只能通过门模拟
;器的执行来执行，门模拟器是通过调用accept-action-procedure!执行的(proc)
;来调用的，故必须执行(proc)，否则the-agenda将失去待处理的过程，该过程只会存在于
;线内部的action-procedures中，而action-procedures是设置线路值的时候执行的，
;对于用于输出的线来说并不会执行