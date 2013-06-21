(include "square.scm")

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x)
        (f x))
      (compose f
               (repeated f (- n 1)))))
