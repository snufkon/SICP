(define list1 '(1 3 (5 7) 9))
(car (cdr (car (cdr (cdr list1)))))     ; 7


(define list2 '((7)))
(car (car list2))                       ; 7


(define list3 '(1 (2 (3 (4 (5 (6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list3)))))))))))) ; 7
