(load "../lib/square")

;;; 高階手続きを使わずに定義
(define (square-tree tree)
  (cond ((null? tree) '())
        ((pair? tree)
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))
        (else (square tree))))


;;; map と再帰を使って定義
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))


;;; 使用例
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
