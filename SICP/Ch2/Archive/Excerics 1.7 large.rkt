#lang simply-scheme

(define (sqrt x)
  (sqrt-iter 1 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs(- (square guess) x)) .001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))
 (define (square x)
   (* x x))

(sqrt 9.0)

;for large values this doesn't work well, change to good-enough check based on how guess changes from one to next

(define (largegood-enough? guess x)
  (< (abs (- guess (improve guess x))) (/ (improve guess x) 1000000)))


