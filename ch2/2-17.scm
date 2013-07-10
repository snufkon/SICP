
(define (last-pair list1)
  (define (iter lst result)
    (if (null? lst)
        result
        (iter (cdr lst) lst)))
  (iter (cdr list1) list1))


;;; 使用例
(last-pair (list 23 72 149 34))         ; (34)
(last-pair (list 23 72 149))            ; (149)
(last-pair (list 23))                   ; (23)
