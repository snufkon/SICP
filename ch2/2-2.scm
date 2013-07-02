
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))


(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point
     (/ (+ (x-point start) (x-point end)) 2.0)
     (/ (+ (y-point start) (y-point end)) 2.0))))


;;; 使用例
(print-point (make-point 3 5))          ; (3,5)

(print-point
 (midpoint-segment
  (make-segment (make-point 3 5)
                (make-point 7 10))))    ; (5.0,7.5)
