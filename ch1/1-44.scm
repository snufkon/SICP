(load "../lib/square")

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x)
        (f x))
      (compose f
               (repeated f (- n 1)))))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/
     (+ (f (- x dx))
        (f x)
        (f (+ x dx)))
     3.0)))


;;; 使用例
((smooth (lambda (x) (* x x))) 2)       ; 4.000000000066667


;;; n 重平滑化関数
(define (n-smooth f n)
  ((repeated smooth n) f))

;;; 使用例
((n-smooth (lambda (x) (* x x)) 10) 2)  ; 4.000000000666667
