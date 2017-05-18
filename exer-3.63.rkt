#lang racket

;Louis的过程

;(define (sqrt-stream x)
;  (stream-cons 1.0
;               (stream-map (lambda (guess)
;                             (sqrt-improve guess x))
;                           (sqrt-stream x))))

;原过程

;(define (sqrt-stream x)
;  (define guesses
;    (stream-cons 1.0
;                 (stream-map (lambda (guess)
;                               (sqrt-improve guess x))
;                             guesses)))
;  guesses)


;L的过程在执行时，每次到达递归的sqrt-stream过程，都会重复调用，这是一次过程应用
;也就是说，每当应用时会立即产生一个由sqrt-stream嵌套形成的环境，由于外部的过程并
;没有执行完毕的返回值，也就刚好巧妙地躲过了memo-proc的执行检测，无法记录。于是每
;次执行的其实都是一次完整的从第一项开始的sqrt-stream，造成效率的下降

;而原过程中的guesses是一个每次保存于环境中的流的变量，访问一个变量即是在环境中向
;上进行查找，这样每次返回的都是上一个执行后的guesses

;由于L的过程就是通过避开memo-proc来降低效率的，所以不使用memo-proc两者效率就相
;同了