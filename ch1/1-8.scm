(load "../lib/square")

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.000001))

(define (improve y x)
  (define a (/ x (square y)))
  (define b (* 2 y))
  (/ (+ a b) 3))

(define (cubic-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cubic-iter (improve guess x)
                  guess
                  x)))

(define (cubic x)
  (cubic-iter 1.0 1000 x))

;;; 使用例
(cubic 2)                               ; 1.2599210498948732

(cubic 3)                               ; 1.4422495703074416

(cubic 10)                              ; 2.154434690031884
