
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;;; 置換えモデルを考える
(sine 12.15)
(p (sine 4.05))
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))
(p (p (p 0.4351345505)))
(p (p 0.9758465331678772))
(p -0.7895631144708228)
-0.39980345741334

;;; p は 5回作用させられる

;;; (sine a)
;;; a = 1 のとき、
(sine 1)
(p (sine 0.3333333333333333))
(p (p (sine 0.1111111111111111)))
(p (p (p (sine 0.037037037037037035))))
(p (p (p 0.037037037037037035)))
(p (p 0.11090789005740995))
(p 0.32726675351357787)

;;; a / 3^x < 0.1
;;; 10a < 3^x
;;; x > log10a (底は3)
;;; ステップ数はO(log a)
;;; スペース数はステップ数と同様に増加するので O(log a)
