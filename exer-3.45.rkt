#lang racket

;make-serializer的定义：一个串行化组以一个过程为参数，它返回的穿行化过程具有与
;原过程一样的行为方式。对一个给定串行化组的所有调用返回的串行化过程都属于同一个集合

;那么对于serialized-exchange, 就会由于新的make-account-and-serializer在外部
;对exchange调用了serializer1, 在exchange内部又会对同帐户调用balance-serializer
;很明显这里两次调用了同一个balance-serializer, 即导致exchange和withdraw/deposit
;同属于一个串行化组, 但是这里是否会导致死循环尚不清楚