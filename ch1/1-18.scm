
(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (fast-* a b)
  (*-iter a b 0))

(define (*-iter a counter product)
  (cond ((= counter 0) product)
	((even? counter) (*-iter (double a) (halve counter) product))
        (else (*-iter a (- counter 1) (+ product a)))))


;;; 使用例
(fast-* 2 10)                           ; 20
(fast-* 3 7)                            ; 21
(fast-* 5 8)                            ; 40
