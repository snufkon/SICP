(define (same-parity first . rest)
  (define (same? num)
    (if (odd? first)
        (odd? num)
        (even? num)))
  (define (iter lst result)
    (cond ((null? lst) result)
          ((same? (car lst))
           (iter (cdr lst) (append result (list (car lst)))))
          (else (iter (cdr lst) result))))
  (iter rest (list first)))


;;; 使用例
(same-parity 1 2 3 4 5 6 7)             ; (1 3 5 7)

(same-parity 2 3 4 5 6 7)               ; (2 4 6)
