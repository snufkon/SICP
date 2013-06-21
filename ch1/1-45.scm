(load "../lib/square")
(load "../lib/cube")
(load "../lib/fixed-point")
(load "../lib/repeated")

(define (average x y)
  (/ (+ x y)
     2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))) )
               1.0))


;;; ４乗根を平均緩和で定義
(define (fourth-root x)
  (fixed-point (average-damp (lambda (y) (/ x (cube y))))
               1.0))

;;; テストしてみる
(fourth-root 3)                         ; 収束しない

;;; 平均緩和２回で定義
(define (fourth-root x)
  (fixed-point
   ((repeated average-damp 2) (lambda (y) (/ x (cube y))))
   1.0))

;;; テストしてみる
(fourth-root 3)                         ; 1.3160740129543826


;;; 5乘根を平均緩和２回で定義
(define (fifth-root x)
  (fixed-point
   ((repeated average-damp 2) (lambda (y) (/ x (* y y y y))))
   1.0))

;;; テストしてみる
(fifth-root 3)                          ; 1.2457295735853005


;;; 6乘根を平均緩和２回で定義
(define (sixth-root x)
  (fixed-point
   ((repeated average-damp 2) (lambda (y) (/ x (* y y y y y))))
   1.0))

(sixth-root 3)                          ; 1.200934454828504


;;; n乗根を定義, 平均緩和はm回
(define (nth-root-test n m x)
  (fixed-point
   ((repeated average-damp m) (lambda (y) (/ x
                                             (expt y (- n 1)))))
   1.0))


;;;  2乗根で平均緩和1回
(nth-root-test 2 1 3)                        ; 1.7320508075688772

;;;  3乗根で平均緩和1回
(nth-root-test 3 1 3)                        ; 1.4422517984541108

;;;  4乗根で平均緩和1回
(nth-root-test 4 1 3)                        ; 収束しない

;;;  4乗根で平均緩和2回
(nth-root-test 4 2 3)                        ; 1.3160740129543826

;;;  5乗根で平均緩和2回
(nth-root-test 5 2 3)                        ; 1.2457295735853005

;;;  6乗根で平均緩和2回
(nth-root-test 6 2 3)                        ; 1.200934454828504

;;;  7乗根で平均緩和2回
(nth-root-test 7 2 3)                        ; 1.1699342292249437

;;;  8乗根で平均緩和2回
(nth-root-test 8 2 3)                        ; 収束しない

;;;  8乗根で平均緩和3回
(nth-root-test 8 3 3)                        ; 1.147202690439877

;;;  9乗根で平均緩和3回
(nth-root-test 9 3 3)                        ; 1.1298307897974202

;;;  10乗根で平均緩和3回
(nth-root-test 10 3 3)                       ; 1.1161223031693024

;;;  11乗根で平均緩和3回
(nth-root-test 11 3 3)                       ; 1.105028932003583

;;;  12乗根で平均緩和3回
(nth-root-test 12 3 3)                       ; 1.0958703305403663

;;;  13乗根で平均緩和3回
(nth-root-test 13 3 3)                       ; 1.0881795418831026

;;;  14乗根で平均緩和3回
(nth-root-test 14 3 3)                       ; 1.0816371058472354

;;;  15乗根で平均緩和3回
(nth-root-test 15 3 3)                       ; 1.0759853156035497

;;;  16乗根で平均緩和3回
(nth-root-test 16 3 3)                       ; 収束しない

;;;  16乗根で平均緩和4回
(nth-root-test 16 4 3)                       ; 1.0710754830729146


;;; 収束に必要な平均緩和の回数
;;; 2〜 3乗根: 1回
;;; 4〜 7乗根: 2回
;;; 8〜15乗根: 3回
;;; 16乗根   : 4回
;;;
;;; log2(x)を平均緩和の回数とすれば問題なさそう。


;;; n乗根を定義, 平均緩和の回数はlog(底は2)を使って決める
(define (nth-root n x)
  (define m (floor (log n 2)))
  (fixed-point
   ((repeated average-damp m) (lambda (y) (/ x
                                             (expt y (- n 1)))))
   1.0))

;;; 適当にテストしてみる
(nth-root 2 3)                          ; 1.7320508075688772
(nth-root 7 3)                          ; 1.1699342292249437
(nth-root 15 3)                         ; 1.0759853156035497
(nth-root 30 3)                         ; 1.037303313143184
(nth-root 50 3)                         ; 1.0222129249399758
