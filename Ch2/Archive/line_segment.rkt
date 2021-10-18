#lang racket

;Abstraction Users: |-------------SEGMENTS--------------|
;                   -------------------------------------
;Abstraction Layer: |  make-seg  | seg-start |  seg-end |
;                   ------------------------------------
;Abstraction Users: |-------------VECTORS---------------|
;                   -------------------------------------
;Abstraction Layer: |  make-vector  |   xcor   |  ycor  |
;                   ------------------------------------- 
; REPRESENTATION!   |                PAIRS              |
(define (make-vector x y) (cons x y))
(define (xcor p) (car p))
(define (ycor p) (cdr p))

(define (make-seg p q) (cons p q))
(define (seg-start s) (car s))
(define (seg-end s) (cdr s))

(define (sq x) (* x x))
(define (average x y)
  (/ (+ x y) 2.0))

(define (mid-point s)
  (let((a (seg-start s))
       (b (seg-end s)))
    (make-vector
     (average (xcor a) (xcor b))
     (average (ycor a) (ycor b)))))

(define (length s)
  (let
   ((dx (- (xcor (seg-end s))
           (xcor (seg-start s))))
    (dy (- (ycor (seg-end s))
           (ycor (seg-start s)))))
       (sqrt
        (+
         (sq dx)
         (sq dy)))))