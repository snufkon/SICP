;;; 再帰的
(define (cont-frac n d k)
  (define (f i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (f (+ i 1))))))
  (f 1))

(define (napier-approx k)
  (+
   (cont-frac (lambda (i) 1.0)
              (lambda (i)
                (if (= (remainder (- i 2) 3) 0)
                    (* 2
                       (+ (/ (- i 2) 3) 1))
                    1))
              k)
   2))

(napier-approx 20)                      ; 2.718281828459045
