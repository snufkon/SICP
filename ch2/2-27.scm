(define (deep-reverse x)
  (define (iter lst result)
    (cond ((null? lst) result)
          ((pair? (car lst))
           (iter (cdr lst) (cons (iter (car lst) '()) result)))
          (else
           (iter (cdr lst) (cons (car lst) result)))))
  (iter x '()))

(define x '((1 2) (3 4)))

;;; 使用例
(deep-reverse x)                        ; ((4 3) (2 1))
