#lang simply-scheme

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (sum term a next b)
  (define (iter a result)
    (if (>= b a)
   (iter (next a) (+ result (term a)))
    result))
    (iter a 0))
 