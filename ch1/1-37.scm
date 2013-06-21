
;;; 再帰的
(define (cont-frac n d k)
  (define (f i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (f (+ i 1))))))
  (f 1))

;;; 黄金比
(define golden-ratio 1.618)

;;; 1/Φ の値
(/ 1 golden-ratio)                      ; 0.6180469715698392

;;; k = 1 で計算してみる
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 1)          ; 1.0

;;; k = 10 で計算してみる
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 10)         ; 0.6179775280898876

;;; k = 11 で計算してみる
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 11)         ; 0.6180555555555556

;;; k >= 11 であれば４桁の精度の近似が得られる



;;; 反復的
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

;;; k = 11 で計算してみる
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 11)         ; 0.6180555555555556
