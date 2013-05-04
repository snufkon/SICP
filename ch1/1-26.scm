
(define (expmod base exp m)
  (display "expmod ")
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))


;;; 1.24 の実装では expmod の手続きで exp が偶数の時、
;;; exp/2 の expmod を計算して square で二乗することにより、
;;; 計算回数を減少させ Θ(log n) となっていた。
;;;
;;; 1.26 Louis のプログラムでは expmod の手続きで exp が偶数の時、
;;; exp/2 の expmod 計算を square ではなく２回実行しているため、
;;; 計算回数を減少させることができない。
;;;
;;; 例えば、exp が 2の冪乗(2,4,8,16 ...)のとき、exp と計算回数の関係は
;;; exp = 2,   5回
;;; exp = 4,  11回
;;; exp = 8,  23回
;;; exp = 16, 47回
;;; ...
;;; exp = n,  3n - 1回
;;;
;;; となり。オーダーはΘ(n)となる。
;;;
;;; Louis の実装では、exp が偶数の分岐を通過してもオーダーはΘ(n) となり
;;; プログラム全体として Θ(n) のプロセスが必要になる。
