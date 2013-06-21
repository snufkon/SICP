(load "../lib/square")

(define (average x y)
  (/ (+ x y) 2))

(define (iterative-improve test improve)
  (lambda (guess)
    (define (iter guess)
      (if (test guess)
          guess
          (iter (improve guess))))
    (iter guess)))


;;; sqrt を iterative-improve を使って実装
(define (sqrt x)
  (define (test guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve test improve) 1.0))

;;; 使用例
(sqrt 2)                                ; 1.4142156862745097
(sqrt 3)                                ; 1.7321428571428572


;;; fixed-point を iterative-improve を使って実装
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (test guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve test improve) first-guess))

;;;  使用例
(fixed-point cos 1.0)                         ; 0.7390893414033928
(fixed-point (lambda (y) (+ (sin y) (cos y))) ; 1.2587228743052672
             1.0)
