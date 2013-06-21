(load "../lib/square.scm")

(define (f g)
  (g 2))

(f square)                              ; 4

(f (lambda (z) (* z (+ z 1))))          ; 6


(f f)
;; (f f) を実行すると (2 2) が評価されることになり Error が発生する。
