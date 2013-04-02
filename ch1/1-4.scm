
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


;;; ふるまい
;;  if式の評価で、入力された値(b)が b > 0 なら+、そうでなければ-が返る。
;;;  その結果をもとに、(+ a b) または (- a b) が評価され最終的な結果となる。

;;; 使用例
(a-plus-abs-b 2 4)                      ; 6

(a-plus-abs-b 3 -5)                     ; 8