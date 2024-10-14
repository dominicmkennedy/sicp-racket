#lang racket

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (og-sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x))))
  (sqrt-iter 1.0)
  )

(define (new-sqrt x)
  (define (new-if pred consequent alternative)
    (cond (pred consequent)
          (else alternative)))
  (define (sqrt-iter guess)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x))))
  (sqrt-iter 1.0)
  )

(og-sqrt 101)
;; (new-sqrt 101)
;; new-sqrt will never terminate bc `new-if` is a function
