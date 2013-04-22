

;;; 番号は0から、上から n 段目、左端から i 番目の要素を計算する
(define (pascals-triangle n i)
  (if (or (<= n 1) (= i 0) (= i n))
      1
      (+ (pascals-triangle (- n 1) (- i 1))
         (pascals-triangle (- n 1) i))))


;;; 使用例
(pascals-triangle 0 0)                  ; 1
(pascals-triangle 2 1)                  ; 2
(pascals-triangle 4 1)                  ; 4
(pascals-triangle 4 2)                  ; 6
