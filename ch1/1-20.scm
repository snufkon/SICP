
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


;; 正規順序
(gcd 206 40)
(gcd 40
     (remainder 206 40))
(gcd
 (remainder 206 40)
 (remainder 40 (remainder 206 40)))
(gcd
 (remainder 40 (remainder 206 40))
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;; ここで ifの評価で帰属式0の方が選ばれ a の値が帰る
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(remainder (remainder 206 40) (remainder 40 6))
(remainder 2 4)
2

;; if の評価で実行される回数: 14回
;; 展開時に実行される回数: 4回
;; トータル: 18回



;; 作用的順序
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2

;;; トータル: 4回
