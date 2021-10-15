#lang simply-scheme
(define(pigl wd)
  (if(pl-done? wd)
     (word wd 'ay)
     (pigl (word (bf wd) (first wd)))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (buzz n)
  (cond ((equal? (remainder n 7) 0)'buzz) 
        ((member? 7 n) 'buzz)
        (else n)))