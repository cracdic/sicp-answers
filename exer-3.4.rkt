#lang racket

(define (make-account balance password)
  (let ((incorrect-times 0)) 
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (incorrect amount) "Incorrect password")
    (define call-the-cops "I'll call the cops")
    (define (dispatch p m)
      (cond ((and (not (eq? p password)) (= incorrect-times 7))
             call-the-cops)
            ((not (eq? p password)) (begin (set! incorrect-times
                                                 (+ incorrect-times 1))
                                           incorrect))
            ((and (eq? p password) (eq? m 'withdraw)) withdraw)
            ((and (eq? p password) (eq? m 'deposit)) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)

((acc 'some-other-password 'deposit) 50)