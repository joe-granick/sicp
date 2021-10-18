#lang racket

;Methodology: Data Abstraction 
;                    -----------------------------------
;Abstraction Users: |add-rat, mult-rat, sub-rat, div-rat|
;                    -----------------------------------
;Abstraction Layer: |  make-rat  |  numer  |   denom    |
;                    -----------------------------------
; REPRESENTATION!   | constructor|     selectors        | as pairs

;(cons x y): constructs pair whose first part is x and second part y
;(car p): select first part of pair p
;(cdr p): select second part of pair p

(define (make-rat n d)
  (cons n d))
(define (numer x)
  (car x))
(define (denom x)
  (cdr x))
 
(define (add-rat x y)
  (make-rat
   (+(* (numer x) (denom y))
     (* (numer y) (denom x)))
   (*(denom x) (denom y))))

(define (mult-rat x y)
  (make-rat
   (* (numer x) (numer y))
   (* (denom x) (denom y))))
 
(define (print-rat rat)
  (display (numer rat))
  (display "/")
  (display (denom rat)))

(define a (make-rat 1 2))
(define b (make-rat 1 4))
(print-rat (add-rat a b))

