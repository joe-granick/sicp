#lang racket
;2.1
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define(segment-midpoint segment)
  (let((x1(x-point(start-segment segment)))
       (x2(x-point(end-segment segment)))
       (y1(y-point(start-segment segment)))
       (y2(y-point(end-segment segment))))
  (make-point(/(+ x1 x2)2.0)
             (/(+ y1 y2)2.0))))
(define(print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
(define a (make-point -1 -1))
(define b (make-point 5 2))
(define line (make-segment a b))
(print-point (segment-midpoint line))

(define (make-rectangle a b c d)
  (list a b c d))

(define first-point first)
(define (second-point rect)(first(rest rect)))
(define(third-point rect)(first(rest(rest rect))))

(define (sq x) (* x x))

(define (segment-length segment)
  (let*((x1 (x-point(start-segment segment)))
        (x2 (x-point (end-segment segment)))
        (y1 (y-point (start-segment segment)))
        (y2 (y-point (end-segment segment)))
        (xdiff (- x1 x2))
        (ydiff (- y1 y2)))
    (cond ((= xdiff 0)(abs ydiff))
          ((= ydiff 0)(abs xdiff))
          (else (sqrt(+ (sq xdiff)
                        (sq ydiff)))))))

(define (rectangle-width rect)
  (segment-length
   (make-segment (first-point rect)
                 (second-point rect))))

(define (rectangle-length rect)
  (segment-length
   (make-segment (second-point rect)
                 (third-point rect))))

(define (rectangle-area rect)
  (* (rectangle-length rect) (rectangle-width rect)))

(define (rectangle-perimeter rect)
  (+ (* 2(rectangle-length rect)) (* 2 (rectangle-width rect))))

(define (print-rectangle rect)
  (newline)
  (display "Area: ")
  (display (rectangle-area rect))
  (newline)
  (display "Perimeter: ")
  (display (rectangle-perimeter rect)))

(define aa (make-point 0 0))
(define bb (make-point 0 10))
(define cc (make-point 10 10))
(define dd (make-point 10 0))
(define rectangle (make-rectangle aa bb cc dd))

(print-rectangle rectangle)


;2.4
;(car (cons x y))
;(car (lambda (m) (x y)))
;(lambda (lambda (p q) p) (x y))
;(lambda ( x y) x)
;(x) ;; :)


;(define (car z)
 ; (z (lambda (p q) p)))
;(define (cdr z)
;  (z (lambda (p q) q)))
  