#lang racket
(provide (all-defined-out))

;; Add a contract here
(define shift-left
  (lambda (ls)
    "Implement me"))

;; Add a contract here
(define shift-k-left
  (lambda (ls k)
    "Implement me"))

;; Add a contract here
(define shift-right
  (lambda (ls)
    "Implement me"))

;; Add a contract here
(define combine
  (lambda (ls1 ls2)
  (let
    (
        (continue_with_two_lists (lambda (ls1 ls2)(cons (car ls2) (combine ls1 (cdr ls2)))))
    )
(cond
    ((and (empty? ls1) (empty? ls1)) '())
    ((empty? ls1) ls2)
    ((empty? ls2) ls1)
    ((eq? #t #t) (continue_with_two_lists ls2 ls1))
    ))))

;; Add a contract here
(define sum-tree (lambda (tree)
        (let
            (
                (recursive (lambda (list acc) (+ (sum-tree acc) (sum-tree list))))
            )
            (cond
              ((number? tree) tree)
              ((empty? tree) 0)
              ((empty? (cdr tree)) (car tree))
              (else (foldl recursive (car tree) (cdr tree)))))))
            
;; Add a contract here
(define inverse-tree
  (lambda (tree)
    "Implement me"))

    (define even? (lambda (n)(eq? (modulo n 2) 0)))(even? 5)