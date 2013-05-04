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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

;;; 1.24 の expmode
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))


;;; 1.25 の expmod
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt base n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt base (/ n 2))))
        (else (* base (fast-expt base (- n 1))))))


;;; 1.24 の expmod での計算時間
(timed-prime-test 1009)                 ; 75
(timed-prime-test 1013)                 ; 78
(timed-prime-test 1019)                 ; 76
(timed-prime-test 10007)                ; 95
(timed-prime-test 10009)                ; 90
(timed-prime-test 10037)                ; 96


;;; 1.25 の expmod での計算時間
(timed-prime-test 1009)                 ; 1388
(timed-prime-test 1013)                 ; 1253
(timed-prime-test 1019)                 ; 1383
(timed-prime-test 10007)                ; 180674
(timed-prime-test 10009)                ; 193593
(timed-prime-test 10037)                ; 180720


;;; 1.25 の単純な expmod は計算に時間がかかり高速素数テストとは言えない。
;;; 1.24 では再帰毎に remainder で剰余を求めており、扱う数値の桁数が肥大化しない。
;;; それに対して、1.25 では remainder は最後に実行するだけであり、計算過程
;;; で扱う数値の桁数が肥大化する。
;;; これにより 1.25 では計算に時間がかかる。
