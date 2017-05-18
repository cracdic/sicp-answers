#lang racket

;from SICP解题集

;使用树实现的 Θ(n) 复杂度的 intersection-tree 和 union-tree 的步骤如下:
;
;使用 练习 2.63 的 tree->list-2 程序，将输入的两棵树转换成两个列表，复杂度 Θ(n)Θ(n) 。
;如果要执行的是交集操作，那么使用书本 105 页的 intersection-set 计算两个列表的交集；如果要执行的是并集操作，那么使用 练习 2.62 的 union-set 计算两个列表的并集；以上两个程序的复杂度都是 Θ(n)Θ(n) 。
;使用 练习 2.64 的 list->tree 程序，将第二步操作所产生的列表转换成一棵平衡树，复杂度为 Θ(n)Θ(n) 。
;intersection-tree 和 union-tree 的整个过程需要使用三个复杂度为 Θ(n)Θ(n) 的程序，但总的复杂度还是 Θ(n)Θ(n) ，因此符合题目的要求。