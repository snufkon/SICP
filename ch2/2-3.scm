
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))


;;; 長方形を幅と高さの値で表現する
(define (make-rect width height)
  (cons width height))

(define (width-rect rect) (car rect))

(define (height-rect rect) (cdr rect))

(define (perimeter-rect rect)
  (+ (* (width-rect rect) 2)
     (* (height-rect rect) 2)))

(define (area-rect rect)
  (* (width-rect rect)
     (height-rect rect)))

;;; 使用例
(define rect (make-rect 30 40))
(perimeter-rect rect)                   ; 140
(area-rect rect)                        ; 1200

;;; 長方形を対角線上にある点で表現する
(define (make-rect left top right bottom)
  (let ((upper-left (make-point left top))
        (lower-right (make-point right bottom)))
    (cons upper-left lower-right)))

(define (left-rect rect)
  (x-point (car rect)))

(define (top-rect rect)
  (y-point (car rect)))

(define (right-rect rect)
  (x-point (cdr rect)))

(define (bottom-rect rect)
  (y-point (cdr rect)))

(define (width-rect rect)
  (let ((left (left-rect rect))
        (right (right-rect rect)))
    (- right left)))

(define (height-rect rect)
  (let ((top (top-rect rect))
        (bottom (bottom-rect rect)))
    (- bottom top)))

;;; 使用例
(define rect (make-rect 10 20 40 60))
(perimeter-rect rect)                   ; 140
(area-rect rect)                        ; 1200

;;; perimeter-rect, area-rect はどちらの表現でも動作する
