(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;;; 置換えてみる
;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;; (lambda (f) (lambda (x) (f x)))

;;; 置換えの最後を one として定義する
(define one (lambda (f) (lambda (x) (f x))))


;;; one を使って置換えてみる
;; (add-1 one)
;; (lambda (f) (lambda (x) (f ((one f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;; (lambda (f) (lambda (x) (f (f x))))

;;; 置換えの最後を two として定義する
(define two (lambda (f) (lambda (x) (f (f x)))))


(define (add n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
