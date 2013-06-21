(use math.const)

;;; 再帰的
(define (cont-frac n d k)
  (define (f i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (f (+ i 1))))))
  (f 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (* -1 x x)))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))

;; 使用例
(tan-cf 0 10)                           ; 0
(tan-cf (/ pi 6) 10)                    ; 0.5773502691896257
(tan-cf (/ pi 4) 10)                    ; 1.0
(tan-cf (/ pi 3) 10)                    ; 1.732050807568877
