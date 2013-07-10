(load "../lib/square")

(define nil '())

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;;; 使用すると逆順のリストになる
(square-list (list 1 2 3 4))            ; (16 9 4 1)

;;; 理由
;;; 取り出した値を cons でつなげる際、
;;; 後から取り出した値を先頭にくっつけているため。


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items nil))

;;; これもうまく動かない
(square-list (list 1 2 3 4))            ; ((((() . 1) . 4) . 9) . 16)

;;; 理由
;;; list をつくろうとしているが list の終端にあたる nil がないため。
;;; また、(list 1 2 3) は (cons 1 (cons 2 (cons 3 (cons 4 nil)))) と
;;; 同値であるが iter でこの形を作れていないため。
