#lang racket
;data can be defined as an abstraction in terms of procedure, cosntructor and selectors can be defined as follows
(define (cons a b)
  (lambda (pick)
    (cond ((= pick 1) a)
          ((= pick 2) b))))
(define (car x) (x 1))
(define (cdr x) (x 2))

;(car (cons 37 49))
;(car (lambda (pick)) 1 )

(display (car
 (lambda (pick)
   (cond((= pick 1) 37)
        ((= pick 2) 49)))
 ))
(newline)

 (display
  ((lambda (pick)
   (cond((= pick 1) 37)
        ((= pick 2) 49)))1))
 