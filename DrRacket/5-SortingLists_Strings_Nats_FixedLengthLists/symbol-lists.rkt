;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname symbol-lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 05, Problem 3
;; *******************************************

;; (make-symbol-list n sym) is a helper function that creates a list of length n,
;; composed only of the given symbol, sym.
;; make-symbol-list: Nat Sym -> (listof Sym)
(define (make-symbol-list n sym)
  (cond [(= n 0) empty] ; if n is 0, return an empty list
        [else
         (cons sym (make-symbol-list (- n 1) sym))])) ; recursively build list of symbols


;; (make-symbol-lists k sym) consumes a list of natural numbers, k, and a symbol, sym,
;; and produces a nested list where each inner list's length corresponds to the numbers in k
;; and is filled with sym.

;; Examples
(check-expect (make-symbol-lists (list 2 1 3) 'X)
              (list (list 'X 'X) (list 'X) (list 'X 'X 'X)))
(check-expect (make-symbol-lists (list 4 0 2) 'O)
              (list (list 'O 'O 'O 'O) empty (list 'O 'O)))

;; make-symbol-lists: (listof Nat) Sym -> (listof (listof Sym))
(define (make-symbol-lists k sym)
  (cond [(empty? k) empty] ; base case
        [else
         (cons (make-symbol-list (first k) sym) ; create a symbol list and recurse
               (make-symbol-lists (rest k) sym))]))

;; Tests
(check-expect (make-symbol-lists (list 3 2 0) 'A)
              (list (list 'A 'A 'A) (list 'A 'A) empty))
(check-expect (make-symbol-lists (list 1 5) 'B)
              (list (list 'B) (list 'B 'B 'B 'B 'B)))