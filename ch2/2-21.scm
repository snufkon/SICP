(load "../lib/square")

(define nil '())

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list items)
  (map square items))

;;; 使用例
(square-list (list 1 2 3 4))            ; (1 4 9 16)
