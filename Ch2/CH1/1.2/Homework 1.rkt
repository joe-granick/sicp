#lang simply-scheme
;Homework 1

;Question 2

(define (square x)
  (* x x))

(define (squares nums)
  (if (empty? nums)
      '()
      (se (square (first nums))
          (squares (bf nums)))))

;Question 3
(define (switch sent)
  (if (member? (first sent) '(you))
               (se '(I)
                   (switcher (bf sent)))
               (switcher sent)))


(define (switcher sent)
  (if (empty? sent)
      '()
      (se
       (cond ((member? (first sent) '(I me)) '(you))
             ((member? (first sent) '(you)) '(me))
             (else (first sent)))
       (switcher (bf sent)))))

;Question 4

(define (ordered? num)
  (if (empty? (bf num))
      '(True)
      (if (> (first num) (first (bf num)))
          'False
          (ordered? (bf num)))))

;qeustion 5

(define (ends-e? sent)
    (member? (last (first sent))
           '(e)))
(define (ended-e sent)
  (if (not (ends-e? sent))
           '()
           (first sent)))

(define (ends-e sent)
  (if (empty? sent)
      '()
      (se (ended-e sent)
          (ends-e (bf sent)))))

  
                    