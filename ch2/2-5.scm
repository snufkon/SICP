
(define (my-cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (my-car c)
  (define (counter num count)
    (if (= (remainder num 2) 0)
        (counter (/ num 2) (+ count 1))
        count))
  (counter c 0))

(define (my-cdr c)
  (define (counter num count)
    (if (= (remainder num 3) 0)
        (counter (/ num 3) (+ count 1))
        count))
  (counter c 0))

;;; 使用例
(my-car (my-cons 3 4))                  ; 3
(my-car (my-cons 10 3))                 ; 10

(my-cdr (my-cons 3 4))                  ; 4
(my-cdr (my-cons 10 3))                 ; 3
