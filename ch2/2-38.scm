;;; fold-left, fold-right は gauche に関数がある
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))


;;; 解答
(fold-right / 1 (list 1 2 3))           ; 3/2

(fold-left / 1 (list 1 2 3))            ; 1/6

(fold-right list '() (list 1 2 3))      ; (1 (2 (3 ())))

(fold-left list '() (list 1 2 3))       ; (((() 1) 2) 3)


;;; 引数の並び順が変化しても答えは変化しないという性質
;;; 例えば、+ や * の計算

(= (+ 1 2 3)
   (+ 2 3 1))                           ; #t

(= (* 1 2 3)
   (* 3 2 1))                           ; #t

(= (fold-right + 1 (list 1 2 3))
   (fold-left + 1 (list 1 2 3)))        ; #t

(= (fold-right * 1 (list 1 2 3))
   (fold-left * 1 (list 1 2 3)))        ; #t
