(load "../lib/square")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my-length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))


;;; 使用例
(my-map square (list 1 2 3 4 5))        ; (1 4 9 16 25)
(my-append (list 1 2 3) (list 4 5 6))   ; (1 2 3 4 5 6)
(my-length (list 1 2 3 4 5))            ; 5
