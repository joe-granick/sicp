#lang simply-scheme

(define (iter a)
  (+ a 1))
(define (identity x) x)
(define (square a)
  (* a a))
(define (cube a)
  (* a a a))
(define (summation func a next b)
  (if (> a b)
      0
      (+ (func a) (summation func (next a) next b))))

(define (sumsquare a b)
  (summation square a iter b))
(define (sumcube a b)
  (summation cube a iter b))

(sumsquare 1 10)
(sumcube 1 10)

;1,31
(define (prod func a next b)
  (if (> a b)
      1
      (*(func a) (prod func (next a) next b))))

(define (fact n)
  (prod identity 1 iter n))

(fact 5)

;1.32

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-sum a b term)
  (accumulate + 0 term a iter b))
(accumulate-sum 1 10 identity)


(define (ewords sent)
  (cond ((empty? sent) '())
        ((member? 'e (first sent))
                  (se (first sent) (ewords (bf sent))))
        (else (ewords (bf sent)))))
(ewords '(got to get you into my life babe))

(define (simp-int f a b n)
  (let ((h (/ (- b a) n)))
    (define (yk k)
      (let((y (f (+ a (* k h)))))
        (cond ((or (= k 0) (= k n)) y)
              ((even? k) (* 2 y))
              (else (* 4 y))
              )))
    (* (/ h 3)
       (summation yk 0 iter n)))
  )

(display (simp-int cube 0 1.0 10000))

 