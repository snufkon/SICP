
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))

(define (total-weight m)
  (define (branch-weight b)
    (cond ((pair? (branch-structure b))
           (+ (branch-weight (left-branch (branch-structure b)))
              (branch-weight (right-branch (branch-structure b)))))
          (else (branch-structure b))))
  (+ (branch-weight (left-branch m))
     (branch-weight (right-branch m))))

(define (balanced? m)
  (define (mobile? b)
    (pair? (branch-structure b)))
  (define (turning-force b)
    (if (mobile? b)
        (* (branch-length b) (total-weight (branch-structure b)))
        (* (branch-length b) (branch-structure b))))
  (let* ((lb (left-branch m))
        (rb (right-branch m))
        (lstructure (branch-structure lb))
        (rstructure (branch-structure rb)))
    (cond ((= (turning-force lb) (turning-force rb))
           (cond ((and (mobile? lb) (mobile? rb))
                  (and (balanced? lstructure)
                       (balanced? rstructure)))
                 ((mobile? lb) (balanced? lstructure))
                 ((mobile? rb) (balanced? rstructure))
                 (else #t)))
          (else #f))))

;;; テスト
(define m1 (make-mobile (list 1 2) (list 2 5)))
(define m2 (make-mobile (list 3 5) (list 4 8)))
(define m3 (make-mobile (list 5 4) (list 3 m1)))
(define m4 (make-mobile (list 3 4) (list 6 2)))
(define m5 (make-mobile (list 9 2) (list 3 m4)))

(total-weight m1)                       ; 7
(total-weight m2)                       ; 13
(total-weight m3)                       ; 11
(total-weight m4)                       ; 6
(total-weight m5)                       ; 8

(balanced? m1)                          ; #f
(balanced? m2)                          ; #f
(balanced? m3)                          ; #f
(balanced? m4)                          ; #t
(balanced? m5)                          ; #t


;;; d. 構成子を変更した場合
;;; 新しい変更に対応するためには、right-branch のみを変更すればよい
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (right-branch m)
  (cdr m))
