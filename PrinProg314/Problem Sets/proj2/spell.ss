#lang racket
; *********************************************
; *  314 Principles of Programming Languages  *
; *  Spring 2023                              *
; *  Student Version                          *
; *********************************************

;; contains "ctv", "A", and "reduce" definitions
(load "include.ss")

;; contains simple dictionary definition
(load "test-dictionary.ss")

;; Imported stuff because LOAD doesn't work
; (define ctv  (lambda (x)   (cond ((eq? x 'a) 1) ((eq? x 'b) 2) ((eq? x 'c) 3) ((eq? x 'd) 4) ((eq? x 'e) 5) ((eq? x 'f) 6)
;       ((eq? x 'g) 7) ((eq? x 'h) 8) ((eq? x 'i) 9) ((eq? x 'j) 10) ((eq? x 'k) 11) ((eq? x 'l) 12) ((eq? x 'm) 13) ((eq? x 'n) 14)
;       ((eq? x 'o) 15) ((eq? x 'p) 16) ((eq? x 'q) 17)  ((eq? x 'r) 18) ((eq? x 's) 19) ((eq? x 't) 20) ((eq? x 'u) 21) ((eq? x 'v) 22)
;       ((eq? x 'w) 23) ((eq? x 'x) 24) ((eq? x 'y) 25) ((eq? x 'z) 26))))
; (define A 0.6779339887)
; (define reduce(lambda (op l id)(if (null? l) id (op (car l) (reduce op (cdr l) id)) )))
; (define dictionary '( (h e l l o) (m a y) (t r e e f r o g) ))

;; -----------------------------------------------------
;; HELPER FUNCTIONS

(define max-2 (lambda (x y) (if (> x y) x y)))
(define min-2 (lambda (x y) (if (< x y) x y)))

(define max-list (lambda (l)(reduce max-2 l -inf.0)))
(define min-list (lambda (l)(reduce min-2 l +inf.0)))

(define delete 
  (lambda (a l)
    (cond
      ((null? l) '())
      ((number? l) l)
      ((list? l)
        (if (= (car l) a)
          (if (null? (cdr l))
            '()
            (delete a (cdr l))
          )
          (cons (delete a (car l)) (delete a (cdr l)))
)))))

(define insertion-sort
  (lambda (l op) (if (null? l) '()
    (let ((m ((if (equal? op >) max-list min-list) l))) (cons m (insertion-sort (delete m l) op))
))))

(define make-initialized-bitvector
  (lambda (size offset hashes)
    (define iter
      (lambda (i l h)
        (if (< i 0) l
          (if (null? h) 
            (iter (- i 1) (cons #f l) '())
            (let ((idx (- (car h) offset)))
              (cond
                ((= idx i) (iter (- i 1) (cons #t l) (cdr h)))
                ((> i idx) (iter (- i 1) (cons #f l) h))
                ((< i idx) (iter (- i 1) (cons #f l) (cdr h)))
    ))))))
    (list->vector (iter size '() hashes))
))

(define make-hashtable
  (lambda (hashfunction dict)
    (define hashes (insertion-sort (map hashfunction dict) >))
    (let ((min-hash (min-list hashes)) (max-hash (max-list hashes)))
    (list (list hashfunction min-hash max-hash) (make-initialized-bitvector (- max-hash min-hash) min-hash hashes))
)))

(define make-hashtable-list 
  (lambda (hashfunctionlist dict) 
    (map (lambda (f) (make-hashtable f dict)) hashfunctionlist)
))

(define check-hashtable
  (lambda (hashtable-data word)
    (let (
      (hash ((caar hashtable-data) word))
      (min-hash (cadar hashtable-data))
      (max-hash (caddar hashtable-data))
      (hashtable (cadr hashtable-data))
    )
      (cond 
        ((< hash min-hash) #f)
        ((> hash max-hash) #f)
        (else (vector-ref hashtable (exact-floor (- hash min-hash))))
      )
)))

(define check-hashtable-family
  (lambda (hashtable-family word)
    (define get-hash (lambda (hashtable prev) (and (check-hashtable hashtable word) prev)))
    (reduce get-hash hashtable-family #t)
))

;; *** CODE FOR ANY HELPER FUNCTION GOES HERE ***

;; -----------------------------------------------------
;; KEY FUNCTION
(define key
  (lambda (w)
    (if (null? w) 
      5077
      (+ (* 29 (key (cdr w))) (ctv (car w)))
)))

;; -----------------------------------------------------
;; EXAMPLE KEY VALUES
;; (key '(h e l l o))        ;= 104146015601
;; (key '(m a y))            ;= 123844020
;; (key '(t r e e f r o g))  ;= 2539881083658035

;; -----------------------------------------------------
;; HASH FUNCTION GENERATORS

;; value of parameter "size" should be a prime number
(define gen-hash-division-method
  (lambda (size) ;; range of values: 0..size-1
    (lambda (k) (modulo (key k) size))
))

;; Note: hash functions may return integer values in "real"
;;       format, e.g., 17.0 for 17

(define gen-hash-multiplication-method
  (lambda (size) ;; range of values: 0..size-1
    (lambda (k)
      (floor (* size (- (* (key k) A) (floor (* (key k) A)))))
)))


;; -----------------------------------------------------
;; EXAMPLE HASH FUNCTIONS AND HASH FUNCTION LISTS

(define hash-1 (gen-hash-division-method 70111))
(define hash-2 (gen-hash-division-method 89997))
(define hash-3 (gen-hash-multiplication-method 7221))
(define hash-4 (gen-hash-multiplication-method 900))

(define hashfl-1 (list hash-1 hash-2 hash-3 hash-4))
(define hashfl-2 (list hash-1 hash-3))
(define hashfl-3 (list hash-2 hash-3))

;; -----------------------------------------------------
;; EXAMPLE HASH VALUES
;;   to test your hash function implementation
;;
;;  (hash-1 '(h e l l o))       ;==> 51317
;;  (hash-1 '(m a y))           ;==> 27994
;;  (hash-1 '(t r e e f r o g)) ;==> 33645
;;
;;  (hash-2 '(h e l l o))       ;==> 47249
;;  (hash-2 '(m a y))           ;==> 8148
;;  (hash-2 '(t r e e f r o g)) ;==> 53006
;;
;;  (hash-3 '(h e l l o))       ;==> 4322.0
;;  (hash-3 '(m a y))           ;==> 3288.0
;;  (hash-3 '(t r e e f r o g)) ;==> 0.0
;;
;;  (hash-4 '(h e l l o))       ;==> 538.0
;;  (hash-4 '(m a y))           ;==> 409.0
;;  (hash-4 '(t r e e f r o g)) ;==> 0.0

;; -----------------------------------------------------
;; SPELL CHECKER GENERATOR

(define gen-checker
  (lambda (hashfunctionlist dict)
    (define hashtable-family (make-hashtable-list hashfunctionlist dict) )
    (lambda (word)
      (check-hashtable-family hashtable-family word)
)))

;; -----------------------------------------------------
;; EXAMPLE SPELL CHECKERS

; (define checker-1 (gen-checker hashfl-1 dictionary))
; (define checker-2 (gen-checker hashfl-2 dictionary))
; (define checker-3 (gen-checker hashfl-3 dictionary))

;; EXAMPLE APPLICATIONS OF A SPELL CHECKER
;;
;;  (checker-1 '(a r g g g g))  ;==> #f
;;  (checker-2 '(h e l l o))    ;==> #t
;;  (checker-2 '(a r g g g g))  ;==> #f  

