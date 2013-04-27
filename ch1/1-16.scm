
(define (even? n)
  (= (remainder n 2) 0))

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (if (even? counter)
	  (expt-iter (* b b)
                     (/ counter 2)
                     product)
	  (expt-iter b
		     (- counter 1)
		     (* b product)))))


;;; 使用例
(expt 2 4)                              ; 16
(expt 2 7)                              ; 128
(expt 2 8)                              ; 256
(expt 2 10)                             ; 1024
