
;; 再帰的
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;;; 使用例
(f 1)                                   ; 1
(f 3)                                   ; 4
(f 5)                                   ; 25


;; 反復的
(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c))
	      a
	      b
	      (- count 1))))

;;; 使用例
(f 1)                                   ; 1
(f 3)                                   ; 4
(f 5)                                   ; 25
