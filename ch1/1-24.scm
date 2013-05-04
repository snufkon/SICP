(load "../lib/square")
(use srfi-27)

;;; 参考
;;; http://sicp.g.hatena.ne.jp/n-oohira/20090122/1232632508
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))


;; 素数確認
(fast-prime? 1009 100)                  ; #t
(fast-prime? 1013 100)                  ; #t
(fast-prime? 1019 100)                  ; #t
(fast-prime? 10007 100)                 ; #t
(fast-prime? 10009 100)                 ; #t
(fast-prime? 10037 100)                 ; #t
(fast-prime? 100003 100)                ; #t
(fast-prime? 100019 100)                ; #t
(fast-prime? 100043 100)                ; #t
(fast-prime? 1000003 100)               ; #t
(fast-prime? 1000033 100)               ; #t
(fast-prime? 1000037 100)               ; #t


;; 予想
;; 底を10と考えると
;;
;; log(1000) = 3
;; log(1000000) = 6
;;
;; よって計算速度に２倍の違いがあると予想できる。

;; 実測
(timed-prime-test 1009)                 ; 89
(timed-prime-test 1013)                 ; 105
(timed-prime-test 1019)                 ; 98

(timed-prime-test 1000003)              ; 172
(timed-prime-test 1000033)              ; 155
(timed-prime-test 1000037)              ; 176

;; 処理速度にばらつきはあったものの、計算時間に２倍程度(若干少ない)の
;; 差がつき予想は正しかったと言える。
