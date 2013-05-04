(use srfi-27)

;;; 参考
;;; http://www.billthelizard.com/2010/03/sicp-exercise-128-miller-rabin-test.html

(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (square-check (expmod base (/ exp 2) m) m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-rabin-test n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random-integer (- n 2)))))


;;; 素数でテスト
(miller-rabin-test 3)                   ; #t
(miller-rabin-test 11)                  ; #t
(miller-rabin-test 17)                  ; #t

;;; 非素数でテスト
(miller-rabin-test 4)                   ; #f
(miller-rabin-test 18)                  ; #f
(miller-rabin-test 21)                  ; #f

;;; Carmichael 数でテスト
(miller-rabin-test 561)                 ; #f
(miller-rabin-test 1105)                ; #f
(miller-rabin-test 1729)                ; #t
(miller-rabin-test 2465)                ; #f
(miller-rabin-test 2821)                ; #f
(miller-rabin-test 6601)                ; #f

;;; 1729 が #t になってしまったが、これは miller-rabin-test が確率的方法なため。


(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))


;;; miller-rabin-test の実行回数を指定して Carmichael 数をテスト
(fast-prime? 561 100)                   ; #f
(fast-prime? 1105 100)                  ; #f
(fast-prime? 1729 100)                  ; #f
(fast-prime? 2465 100)                  ; #f
(fast-prime? 2821 100)                  ; #f
(fast-prime? 6601 100)                  ; #f
