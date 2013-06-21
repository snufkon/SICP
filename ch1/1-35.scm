
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (f x)
  (+ 1 (/ 1 x)))


;;; 黄金比
(define golden-ratio 1.618)


;;; 不動点f(x) = x であることを示す
(f golden-ratio)                        ; 1.6180469715698393


;;; fixed-point で計算
(fixed-point f 1.0)                     ; 1.6180327868852458
