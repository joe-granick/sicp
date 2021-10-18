#lang simply-scheme

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (h a b n)
  (/ (- b a ) n))

(define (yk f a k h )
  (f (+ a (* k h))))

(define (factor k)
  (if (even? k)
      2
      4))

(define
  (simp-sum f a next k n b)
                  (if (> k (- n 1))
                      0
                      (+(* (factor k)
                           (yk f a k (h a b n)))
                       (simp-sum f a next (next k) n b))))
(define (simp-int a b f n)
  (*
   (/ (h a b n) 3)
   (+
    (yk f a 0 (h a b n))
    (yk f a n (h a b n))
    (simp-sum f a inc 1 n b))
   ))