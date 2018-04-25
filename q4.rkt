#lang racket
(provide (all-defined-out))

;; Add a contract here
;; Signature:
;; Type:
;; Purpose:
(define shift-left
  (lambda (ls)
    "Implement me"))

;; Add a contract here
;; Signature:
;; Type:
;; Purpose:
(define shift-k-left
  (lambda (ls k)
    "Implement me"))

;; Add a contract here
;; Signature:
;; Type:
;; Purpose:
(define shift-right
  (lambda (ls)
    "Implement me"))

;; Add a contract here
;; Signature: combine(ls1 ls2)
;; Type:[List(T1)*List(T2)->List(T1|T2)]
;; Purpose:takes two lists and combines them in an alternating manner starting from the first list.
;;          If one of the lists is empty, then the result of combine is the other list
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
;; Signature:sum-tree(tree)
;; Type: [Tree(number)->number]
;; Purpose:returns the sum of numbers present in all tree nodes
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
;; Signature: inverse-tree(tree)
;; Type:[Tree(Number|Boolean)->Tree(Number|Boolean)]
;; Purpose: returns the equivalent tree whose nodes are the (not node) if Boolean or (-node) if Number
(define inverse-tree
    (lambda (tree)
      (cond ((number? tree) (- 0 tree))
          ((boolean? tree) (not tree))
          ((empty? tree) '())
          (else (map inverse-tree tree)))))
  (inverse-tree '(-5 (1 (-2) (3) (#f)) (#t)))
  

