#! /usr/local/bin/racket
#lang racket/base

; 1.1
(cons 	'a 
	(cons 	(cons 	'b (cons 'c '()) )
		(cons	'd 
			(cons 	(cons	(cons	'e  (cons 'f '()))
				(cons 	(cons 'g '())'()))
			'()
		)
	)
))

; 1.2
(define times-a-4 (cons * (cons 'a (cons '4 '()))))
((car times-a-4) 5 3)

; 2.1
(define (flatten l)
  (if (null? l)
  	'()
    (if (symbol? l)
        (cons l '())
        (append (flatten (car l)) (flatten (cdr l)))
	)
  )
)

(flatten '((a) ((b)) (c)))

; 2.2

(define rev
    (lambda (l)
        (if (null? l)
            '()
            (if (list? l)
                (append (rev (cdr l)) (cons (rev (car l)) '()))
                l
            )
        )
    )
)

(rev '(a b c (d e f (g (((h))) i))))

; 2.3
(define delete
    (lambda (a l)
      (cond
        ((null? l) '())
        ((symbol? l) l)
        ((list? l) (if (equal? (car l) a)
                       (if (null? (cdr l))
                           '()
                           (delete a (cdr l))
                       )
                       (cons (delete a (car l)) (delete a (cdr l))))
                   )
      )
    )
)

(delete 'e '(b c ((g e f)) d))

; 2.4

(define merge-sorted
  (lambda (x y)
    (cond
      ((null? x) y)
      ((null? y) x)
      ((< (car x) (car y)) (cons (car x) (merge-sorted (cdr x) y)))
      ((< (car y) (car x) ) (cons (car y) (merge-sorted x (cdr y))))
    )
  )
)

(merge-sorted '(1 3 5) '(2 6 8))

; 3.1
(define NewTable (lambda () '()))

; 3.2
(define InsertIntoTable
  (lambda (entry table)
    (cons entry table)
  )
)

; 3.3	`````	
(define LookupTable
  (lambda (variable table)
    (cond
      ((null? table) '())
      ((equal? (car (car table)) variable) (car (cdr (car table))))
      (else (LookupTable variable (cdr table)))
    )
  )
)

; 4
(define map  
	(lambda (f l)  
		(if (null? l)  
			'()  
			(cons (f (car l)) (map f (cdr l))) )))

(define reduce  
	(lambda (op l id)  
		(if (null? l)  
			id  
			(op (car l) (reduce op (cdr l) id)) )))


(define minSquareVal
  (lambda (l)
    (reduce
         (lambda(x y)(if (< x y) x y))
         (map (lambda(x)(* x x)) l)
         +inf.0
    )
  )
)


(define maxSquareVal
  (lambda (l)
    (reduce
         (lambda(x y)(if (> x y) x y))
         (map (lambda(x)(* x x)) l)
         -inf.0
    )
  )
)

(minSquareVal '(-5 3 -7 10 -11 8 7))
(maxSquareVal '(-5 3 -7 10 -11 8 7))
