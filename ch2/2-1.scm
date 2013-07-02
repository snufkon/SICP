
(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (> d 0)
                  1
                  -1)))
    (cons (* sign (/ n g))
          (* sign (/ d g)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;;; 使用例
(print-rat (make-rat 1 3))              ; 1/3

(print-rat (make-rat -1 3))             ; -1/3

(print-rat (make-rat 1 -3))             ; -1/3

(print-rat (make-rat -1 -3))            ; 1/3

(print-rat (make-rat -3 -9))            ; 1/3
