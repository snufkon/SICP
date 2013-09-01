(define (entry tree)
  (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

;;; a. 全ての木に対して同じ結果を生じるか？
(define tree1 (make-tree 7
                         (make-tree 3
                                    (make-tree 1 '() '())
                                    (make-tree 5 '() '()))
                         (make-tree 9
                                    '()
                                    (make-tree 11 '() '()))))

(tree->list-1 tree1)                    ; (1 3 5 7 9 11)
(tree->list-2 tree1)                    ; (1 3 5 7 9 11)

(define tree2 (make-tree 3
                         (make-tree 1 '() '())
                         (make-tree 7
                                    (make-tree 5 '() '())
                                    (make-tree 9
                                               '()
                                               (make-tree 11 '() '())))))

(tree->list-1 tree2)                    ; (1 3 5 7 9 11)
(tree->list-2 tree2)                    ; (1 3 5 7 9 11)

(define tree3 (make-tree 5
                         (make-tree 3
                                    (make-tree 1 '() '())
                                    '())
                         (make-tree 9
                                    (make-tree 7 '() '())
                                    (make-tree 11 '() '()))))

(tree->list-1 tree3)                    ; (1 3 5 7 9 11)
(tree->list-2 tree3)                    ; (1 3 5 7 9 11)

;;; どちらの手続きも全ての木から同じ結果を生じる。

;;; b. 要素が釣り合っている木を変換する際、必要なステップ数のオーダーに
;;; 違いはあるか？
;;;
;;; tree->list-1, tree->list-2 共に同じ回数の呼び出しが発生する。
;;; tree->list-1 では append を使っており、この append がリストの
;;; 増加に影響を受ける。
;;;
;;; したがって、計算に必要なステップ数は、tree->list-2の方がより遅く増加する。
