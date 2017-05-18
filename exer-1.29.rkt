#lang racket
(define (sum term a next b k n)
  (if (> a b)
      0
      (+ (* (coe k n) (term a))
         (sum term (next a) next b (+ k 1) n))))

(define (cube x) (* x x x))

(define (sum-simpson f n a b)
  (sum-simp f n a b (ave n a b)))

(define (sum-simp f n a b h)
  (define (add-h x) (+ x h))
  (* (sum f a add-h b 0 n)
     (/ h 3.0)))

(define (g f k n)
  (* f (coe k n)))

(define (coe k n)
  (cond ((or (= k 0) (= k n)) 1)
        ((even? k) 2)
        ((not (even? k)) 4)))

(define (ave n a b)
  (/ (- b a) n))

(define (even? n)
  (= (remainder n 2) 0))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(sum-simpson cube 1000 0 1)