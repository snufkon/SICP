(define (reverse list1)
  (define (iter lst result)
    (if (null? lst)
        result
        (iter (cdr lst) (cons (car lst) result))))
  (iter list1 '()))


;;; 使用例
(reverse (list 1 4 9 16 25))            ; (25 16 9 4 1)
(reverse (list 1 4))                    ; (4 1)
