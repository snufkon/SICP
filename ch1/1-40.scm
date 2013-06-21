(load "../lib/square")
(load "../lib/cube")
(load "../lib/newtons-method")


(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

;;; 使用例
(newtons-method (cubic 4 3 2) 1)
