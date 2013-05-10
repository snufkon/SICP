(load "../lib/prime.scm")

(define (identity x) x)
(define (inc n) (+ n 1))

(define (filtered-accumulate combiner null-value term a next b pred?)
  (define (iter x result)
    (cond ((> x b) result)
          ((pred? x) (iter (next x) (combiner (term x) result)))
          (else (iter (next x) result))))
  (iter a null-value))

;; 区間a, b の素数の二乗の和
(define (prime-square-sum a b)
  (define (combiner x y)
    (+ x y))
  (define (square x)
    (* x x))
  (filtered-accumulate combiner 0 square a inc b prime?))

;; n と互いに素で、nより小さい正の整数の積
(define (coprime-product n)
  (define (combiner x y)
    (* x y))
  (define (coprime? i)
    (if (= (gcd i n) 1)
        #t
        #f))
  (filtered-accumulate combiner 1 identity 1 inc n coprime?))

;; 使用例
(prime-square-sum 1 3)                  ; 13
(coprime-product 8)                     ; 105
