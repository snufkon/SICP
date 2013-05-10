
(define (identity x) x)
(define (inc n) (+ n 1))

;; 再帰的
(define (product a b term next)
  (if (> a b)
      1
      (* (term a) (product (next a)  b term next))))

;; 反復的
(define (product a b term next)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (* (term x) result))))
  (iter a 1))

;;; π / 4 を計算する
(define (pai-approx n)
  (define (term x)
    (/ (* x (+ x 2))
       (* (+ x 1) (+ x 1))))
  (define (next x)
    (+ x 2))
  (product 2.0 n term next))

(define (factorial n)
  (product 1 n identity inc))


;;; 使用例
(factorial 4)                           ; 24
(factorial 5)                           ; 120

(* 4 (pai-approx 10))                   ; 3.275101041334807
(* 4 (pai-approx 100))                  ; 3.157030176455167
