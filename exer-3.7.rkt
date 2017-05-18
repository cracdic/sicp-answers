#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (incorrect amount) "Incorrect password")
  (define (dispatch p m)
    (cond ((not (eq? p password)) incorrect)
          ((and (eq? p password) (eq? m 'withdraw)) withdraw)
          ((and (eq? p password) (eq? m 'deposit)) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define (make-joint acc origin-pass new-pass)
  (define (dispatch p m)
    (if (eq? p new-pass)
        (acc origin-pass m)
        "wrong pass"))
  dispatch)

(define my (make-account 50 'abc))

((my 'abc 'deposit) 20)

(define yours (make-joint my 'abc 'bcd))

((yours 'bcd 'withdraw) 20)