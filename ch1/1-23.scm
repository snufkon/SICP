(load "../lib/square")

;;; 参考
;;; http://sicp.g.hatena.ne.jp/n-oohira/20090122/1232632508
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

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


;; 改良前
;; 1009 *** 13
;; 1013 *** 13
;; 1019 *** 13
;; 10007 *** 39
;; 10009 *** 39
;; 10037 *** 40
;; 100003 *** 120
;; 100019 *** 124
;; 100043 *** 123
;; 1000003 *** 387
;; 1000033 *** 382
;; 1000037 *** 389

;; 改良後
;; 1009 *** 13
;; 1013 *** 14
;; 1019 *** 14
;; 10007 *** 27
;; 10009 *** 27
;; 10037 *** 27
;; 100003 *** 70
;; 100019 *** 70
;; 100043 *** 70
;; 1000003 *** 207
;; 1000033 *** 207
;; 1000037 *** 208

;; 考察
;; next を実行する必要が出たため単純に２倍にはならない。
;; 判定に利用する数が増加するにつれてnextの影響より、
;; 偶数が減少する処理速度の違いが大きくなっていくため、徐々に２に近づく
