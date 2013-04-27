
(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (fast-* a b)
  (cond ((= b 0) 0)
	((even? b) (double (fast-* a (halve b))))
	(else (+ a (fast-* a (- b 1))))))


;;; 使用例
(fast-* 2 3)                            ; 6
(fast-* 2 10)                           ; 20
(fast-* 7 5)                            ; 35
