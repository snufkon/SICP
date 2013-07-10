
(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values))
                coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))


(cc 100 us-coins)                       ; 292

;;; us-coins 並び順を変えて試してみる
(define us-coins-2 (list 10 5 1 50 25))
(cc 100 us-coins-2)                     ; 292

(define us-coins-3 (list 1 5 10 25 50))
(cc 100 us-coins-3)                     ; 292

(define us-coins-4 (list 5 50 25 10 1))
(cc 100 us-coins-4)                     ; 292


;;; 特に影響はなさそう
;;; ccの手続きが、coin-values の order に関係なく実装されているため。
