#lang racket

;交换顺序后，queen-cols的执行次数会大大增加，
;enumerate-interval的执行次数将会达到原先的约board-size倍
;时间大致为board-size*T