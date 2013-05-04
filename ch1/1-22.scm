(load "../lib/square")

;;; 参考
;;; http://sicp.g.hatena.ne.jp/n-oohira/20090122/1232632508
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n(smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ start 1) end)
      (cond ((<= start end) (timed-prime-test start)
	     (search-for-primes (+ start 2) end)))))


;; gosh> (search-for-primes 1000 1020)
;; 1001
;; 1003
;; 1005
;; 1007
;; 1009 *** 13
;; 1011
;; 1013 *** 13
;; 1015
;; 1017
;; 1019 *** 13#<undef>

;;; 素数: 1009, 1013, 1019


;; gosh> (search-for-primes 10000 10040)
;; 10001
;; 10003
;; 10005
;; 10007 *** 39
;; 10009 *** 39
;; 10011
;; 10013
;; 10015
;; 10017
;; 10019
;; 10021
;; 10023
;; 10025
;; 10027
;; 10029
;; 10031
;; 10033
;; 10035
;; 10037 *** 40
;; 10039 *** 39#<undef>

;;; 素数: 10007, 10009, 10037, 10039


;; gosh> (search-for-primes 100000 100050)
;; 100001
;; 100003 *** 120
;; 100005
;; 100007
;; 100009
;; 100011
;; 100013
;; 100015
;; 100017
;; 100019 *** 124
;; 100021
;; 100023
;; 100025
;; 100027
;; 100029
;; 100031
;; 100033
;; 100035
;; 100037
;; 100039
;; 100041
;; 100043 *** 123
;; 100045
;; 100047
;; 100049 *** 128#<undef>

;;; 素数: 100003, 100019, 10043, 10049


;;; 1000, 10000, 100000 前後の計算にかかる時間は中央値を取るとそれぞれ
;;
;; 1000   : 13
;; 10000  : 39
;; 100000 : 123.5
;;
;; √10 = 3.1622776601683795
;; なので、
;;
;; 13 * √10 ≒ 39
;; 39 * √10 ≒ 123
;;
;; となり、計測したデータは、テストのアルゴリズムがΘ(√n)の
;; 増加の程度になることを支持する。


;; 1000000 前後の計算にかかる時間は、
;;
;; 123.5 * √10 = 390.54129103079487
;;
;; と予想される。


;; gosh> (search-for-primes 1000000 1000050)

;; 1000001
;; 1000003 *** 387
;; 1000005
;; 1000007
;; 1000009
;; 1000011
;; 1000013
;; 1000015
;; 1000017
;; 1000019
;; 1000021
;; 1000023
;; 1000025
;; 1000027
;; 1000029
;; 1000031
;; 1000033 *** 382
;; 1000035
;; 1000037 *** 389
;; 1000039 *** 381
;; 1000041
;; 1000043
;; 1000045
;; 1000047
;; 1000049#<undef>

;; 予想の結果となっていることがわかる。
