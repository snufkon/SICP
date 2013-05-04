(load "../lib/square")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test-all n)
  (define (try-it a)
    (= (expmod a n n) a))

  (define (iter a)
    (cond ((= a n) #t)
          ((try-it a) (iter (+ a 1)))
          (else #f)))
  (iter 1))


;;; Carmichael 数でテスト
(fermat-test-all 561)                   ; t
(fermat-test-all 1105)                  ; t
(fermat-test-all 1729)                  ; t
(fermat-test-all 2465)                  ; t
(fermat-test-all 2821)                  ; t
(fermat-test-all 6601)                  ; t
