(load "../lib/square.scm")

(define (f x y z)
  (+ (square (max x y))
     (square (max x z))))
