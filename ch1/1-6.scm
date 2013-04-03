


(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;;; 使用例
(new-if (= 2 3) 0 5)                    ; 5

(new-if (= 1 1) 0 5)                    ; 0


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;;; new-if を利用するとまず全ての部分式が評価される。
;;; else-clause にあたる sqrt-iter は再帰的に new-if が評価されるため
;;; いつになっても sqrt-iter の評価が完了しない。
;;; したがって、new-if を利用して平方根を計算すると計算が終わらなくなる。
