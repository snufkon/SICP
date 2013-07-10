
(define (for-each proc items)
  (cond ((null? items) #t)
        (else
         (proc (car items))
         (for-each proc (cdr items)))))


;;; 使用例
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

;;; 結果出力
;; 57
;; 321
;; 88
