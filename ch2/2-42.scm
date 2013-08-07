(load "../lib/accumulate")

(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))


(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


(define empty-board '())


(define (adjoin-position row col rest-of-queens)
  (append rest-of-queens (list (list row col))))


(define (safe? k positions)
  (define (iter positions k-pos)
    (cond ((equal? (car positions) k-pos) ; 終了判定
           #t)
          ((= (caar positions)          ; 行の重複
              (car k-pos))
           #f)
          ((= (caar positions)          ; 左上重複
              (- (car k-pos)
                 (- (cadr k-pos) (cadar positions))))
           #f)
          ((= (caar positions)          ; 左下重複
              (+ (car k-pos)
                 (- (cadr k-pos) (cadar positions))))
           #f)
          (else (iter (cdr positions) k-pos))))

  (let ((k-pos (list-ref positions (- k 1))))
    (iter positions k-pos)))


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


;;; 使用例
(queens 4)  ; (((2 1) (4 2) (1 3) (3 4)) ((3 1) (1 2) (4 3) (2 4)))

;; エイト・クイーン の解の総数は 92 あるので正しい数のリストになるかチェック
(length (queens 8))                     ; 92
