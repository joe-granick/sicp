#lang racket
;mkae-rat with greatest common denominator

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g)
          (/ d g))))
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
