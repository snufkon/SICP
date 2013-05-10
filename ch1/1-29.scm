
(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f
          (+ a (/ dx 2.0))
          add-dx
          b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x)
    (+ x (* h 2)))
  (* (/ h 3)
     (+ (f a)                              ; y0
        (f (+ a (* n h)))                  ; yn
        (* 4 (sum f (+ a h) add-2h (+ a (* h (- n 1)))))
        (* 2(sum f (+ a (* 2 h)) add-2h (+ a (* h (- n 2))))))))


(simpson cube 0.0 1.0 100)
;; 0.23078806666666699

(simpson cube 0.0 1.0 1000)
;; 0.24800798800666748

(integral cube 0 1 0.01)
;; 0.24998750000000042

(integral cube 0 1 0.001)
;; 0.249999875000001
