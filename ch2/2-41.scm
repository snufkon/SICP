(load "../lib/accumulate")

(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-triples n)
  (flatmap (lambda (k)
             (flatmap (lambda (j)
                    (map (lambda (i)
                           (list i j k))
                         (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- k 1))))
           (enumerate-interval 1 n)))

(define (sum-list lst)
  (if (null? lst)
      0
      (+ (car lst) (sum-list (cdr lst)))))

(define (equal-sum-triples n s)
  (filter (lambda (x)
            (if (= (sum-list x) s)
                #t
                #f))
          (unique-triples n)))

;;; 使用例
(equal-sum-triples 6 10)                ; ((2 3 5) (1 4 5) (1 3 6))
(equal-sum-triples 5 7)                 ; ((1 2 4))
