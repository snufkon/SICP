(define (reverse sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              '()
              sequence))

;;; 使用例
(reverse (list 1 4 9 16 25))            ; (25 16 9 4 1)
(reverse (list 1 4))                    ; (4 1)


(define (reverse sequence)
  (fold-left (lambda (x y)
               (cons y x))
             '()
             sequence))

;;; 使用例
(reverse (list 1 4 9 16 25))            ; (25 16 9 4 1)
(reverse (list 1 4))                    ; (4 1)
