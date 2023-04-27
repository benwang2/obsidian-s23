; *********************************************
; *  314 Principles of Programming Languages  *
; *  Spring 2023                              *
; *  Student Version                          *
; *********************************************

;; contains "ctv", "A", and "reduce" definitions
(load "include.ss")

;; contains simple dictionary definition
(load "dictionary.ss")

;; -----------------------------------------------------
;; HELPER FUNCTIONS

(define max-2 (lambda(x y)(if(> x y) x y)))
(define max-list (lambda(l)(reduce max-2 l -inf.0)))

(define min-2 (lambda(x y)(if(< x y) x y)))
(define min-list (lambda(l)(reduce min-2 l +inf.0)))

(define make-hashtable
  (lambda (hashfunction dict)
    (define hashes (map hashfunction dict))
    (let ((min-hash (min-list hashes)) (max-hash (max-list hashes)))
    (list (list hashfunction min-hash max-hash) hashes)
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
        (else (reduce (lambda (a b) (or (= a hash) b)) hashtable #f))
))))

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
(define hash-3 (gen-hash-multiplication-method 7224))
(define hash-4 (gen-hash-multiplication-method 900))

(define hashfl-1 (list hash-1 hash-2 hash-3 hash-4))
(define hashfl-2 (list hash-1 hash-3))
(define hashfl-3 (list hash-2 hash-3))

;; -----------------------------------------------------
;; EXAMPLE HASH VALUES
;;   to test your hash function implementation
;;
;  (hash-1 '(h e l l o))       ;==> 51317
;  (hash-1 '(m a y))           ;==> 27994
;  (hash-1 '(t r e e f r o g)) ;==> 33645

;  (hash-2 '(h e l l o))       ;==> 47249
;  (hash-2 '(m a y))           ;==> 8148
;  (hash-2 '(t r e e f r o g)) ;==> 53006

;  (hash-3 '(h e l l o))       ;==> 711.0
;  (hash-3 '(m a y))           ;==> 4747.0
;  (hash-3 '(t r e e f r o g)) ;==> 5418.0

;  (hash-4 '(h e l l o))       ;==> 88.0
;  (hash-4 '(m a y))           ;==> 591.0
;  (hash-4 '(t r e e f r o g)) ;==> 675.0

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

(define checker-1 (gen-checker hashfl-1 dictionary))
(define checker-2 (gen-checker hashfl-2 dictionary))
(define checker-3 (gen-checker hashfl-3 dictionary))

;; EXAMPLE APPLICATIONS OF A SPELL CHECKER
;;
;;  (checker-1 '(a r g g g g))  ;==> #f
;;  (checker-2 '(h e l l o))    ;==> #t
;;  (checker-2 '(a r g g g g))  ;==> #f