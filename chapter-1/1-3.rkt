#lang racket

(define (square x) (* x x))
(define (sum-square a b) (+ (square a) (square b)))
(define (mx a b) (if (> a b) a b))
(define (biggest a b c) (mx (mx a b) c))
(define (snd-biggest a b c) ((cond ((and (> a b) (< a c)) a)
                                   ((and (> b a) (< b c)) b)
                                   (else c)
                                   )))
(define (least-sum-square a b c) (sum-square (biggest a b c) (snd-biggest a b c)))
