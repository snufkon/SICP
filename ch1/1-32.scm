
(define (identity x) x)
(define (inc n) (+ n 1))

;; 再帰的
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;; 反復的
(define (accumulate combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (combiner (term x) result))))
  (iter a null-value))

;; accumulate を利用した sum
(define (sum term a next b)
  (define (combiner a b)
    (+ a b))
  (accumulate combiner 0 term a next b))

;; accumulate を利用した product
(define (product term a next b)
  (define (combiner a b)
    (* a b))
  (accumulate combiner 1 term a next b))


;;; 使用例
(sum identity 1 inc 10)                 ; 55
(product identity 1 inc 10)             ; 3628800
