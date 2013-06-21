
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (f x)
  (/ (log 1000) (log x)))


(fixed-point f 100)                     ; 4.555539351985717
;; 近似過程
;; 100
;; 1.4999999999999998
;; 17.036620761802723
;; 2.4362841528268704
;; 7.757391404878408
;; 3.3718636013068974
;; 5.683217478018266
;; 3.97564638093712
;; 5.004940305230897
;; 4.2893976408423535
;; 4.743860707684508
;; 4.437003894526853
;; 4.6361416205906485
;; 4.503444951269147
;; 4.590350549476868
;; 4.532777517802648
;; 4.570631779772813
;; 4.545618222336422
;; 4.562092653795064
;; 4.551218723744055
;; 4.558385805707352
;; 4.553657479516671
;; 4.55677495241968
;; 4.554718702465183
;; 4.556074615314888
;; 4.555180352768613
;; 4.555770074687025
;; 4.555381152108018
;; 4.555637634081652
;; 4.555468486740348
;; 4.555580035270157
;; 4.555506470667713
;; 4.555554984963888
;; 4.5555229906097905
;; 4.555544090254035
;; 4.555530175417048
;; 4.555539351985717


;; 求めた不動点から x^x = 1000 になることを確認してみる
(expt 4.555539351985717 4.555539351985717) ; 1000.0091766200158


;; 平均緩和法で計算
(define (average x y)
  (/ (+ x y) 2.0))

(fixed-point
 (lambda (x) (average x (f x))) 100)    ; 4.555537256371145
;; 近似過程
;; 100
;; 50.75
;; 26.254540457118523
;; 14.184200419676754
;; 8.394404144501411
;; 5.820596485719324
;; 4.871165879985272
;; 4.6169793776123935
;; 4.566308737263073
;; 4.557379626448907
;; 4.555849935202987
;; 4.555589214071988
;; 4.555544815820955
;; 4.555537256371145
