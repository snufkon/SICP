(load "../lib/accumulate")

;;; 解答
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (pair? x)
                         (count-leaves x)
                         1))
                   t)))


;;; map の縛りがなければこんな風にもかける
(define (count-leaves t)
  (accumulate (lambda (x y)
                (if (pair? x)
                    (+ (count-leaves x) y)
                    (+ 1 y)))
              0
              t))


;;; 使用例
(count-leaves (list 1 2 3 4 5))         ; 5
(count-leaves (list 1 2 3 4 (list 1 2))) ; 6
(count-leaves (list 1 2 3 4 (list 1 (list 3 5))))  ; 7
