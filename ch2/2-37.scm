(load "../lib/accumulate")

(define nil '())

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op
                        init
                        (map (lambda (x)
                               (car x))
                             seqs))
            (accumulate-n op
                          init
                          (map (lambda (x)
                                 (cdr x))
                               seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))


(define (matrix-*-vector m v)
  (map (lambda (w)
         (dot-product v w))
       m))


(define (transpose mat)
  (accumulate-n cons nil mat))


(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v)
           (matrix-*-vector cols v)) m)))


(define v '(1 2 3 4))
(define w '(2 2 5 8))
(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define n '((1 2 3) (1 2 3) (1 2 3) (1 2 3)))

;;; 使用例
(dot-product v w)                       ; 53

(matrix-*-vector m v)                   ; (30 56 80)

(transpose m)                           ; ((1 4 6) (2 5 7) (3 6 8) (4 6 9))

(matrix-*-matrix m n)                   ; ((10 20 30) (21 42 63) (30 60 90))
