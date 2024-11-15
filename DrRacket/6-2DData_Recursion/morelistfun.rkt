;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname morelistfun) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 06, Problem 1
;; *******************************************

;;
;; Part A
;;

;; (my-list-ref lst index) consumes a list, lst, and a natural number, index. It returns the
;; element at the specified index in lst. The function assumes that the index is within
;; the bounds of the list.

;; Examples
(check-expect (my-list-ref (list 'a 'b 'c 'd) 2) 'c)
(check-expect (my-list-ref (list 'a 'b 'c 'd) 0) 'a)

;; my-list-ref: (listof Any) Nat -> Any
(define (my-list-ref lst index)
  (cond
    [(empty? lst) false] ; handle empty list case
    [(zero? index) (first lst)] ; base case, return first element

    ; recurse with the rest of the list, decrement index
    [else (my-list-ref (rest lst) (sub1 index))]))

;; Tests
(check-expect (my-list-ref (list 'Rose 'Lisa 'Jennie 'Jisoo) 1) 'Lisa)
(check-expect (my-list-ref (list 'Rose 'Lisa 'Jennie 'Jisoo) 3) 'Jisoo)

;;
;; Part B
;;

;; (zip lst1 lst2) consumes two lists, lst1 and lst2, and produces a new list where each element
;; is a two-element list containing the corresponding elements from lst1 and lst2.
;; If the lists have different lengths, zip stops when the shorter list runs out.

;; Examples
(check-expect (zip (list 1 2 3) (list 'a 'b 'c)) (list (list 1 'a) (list 2 'b) (list 3 'c)))
(check-expect (zip (list 4 5 6) (list 'd 'e 'f)) (list (list 4 'd) (list 5 'e) (list 6 'f)))

;; zip: (listof Any) (listof Any) -> (listof (list Any Any))
(define (zip lst1 lst2)
  (cond [(or (empty? lst1) (empty? lst2)) empty] ; base case
        [else (cons (list (first lst1) (first lst2)) ; pair first elements of each list
                    (zip (rest lst1) (rest lst2)))])) ; recurse with rest of both lists

;; Tests
(check-expect (zip (list 1 2) (list 'x 'y)) (list (list 1 'x) (list 2 'y)))
(check-expect (zip (list 'Jack 'Queen 'King) (list 11 12 13))
              (list (list 'Jack 11) (list 'Queen 12) (list 'King 13)))

;;
;; Part C
;;

;; (list-xor lon1 lon2) consumes two lists of numbers, lon1 and lon2, that are sorted in increasing
;; order. It produces a sorted list containing only the elements that are unique to each list,
;; (elements that appear in lon1 or lon2, but not in both).

;; Examples:
(check-expect (list-xor (list 1 2 3 4 5) (list 1 3 5)) (list 2 4))
(check-expect (list-xor (list 1 2 3) (list 1 2 4 5)) (list 3 4 5))

;; list-xor: (listof Num) (listof Num) -> (listof Num)
(define (list-xor lon1 lon2)
  (cond [(empty? lon1) lon2] ; if lon1 empty, return lon2
        [(empty? lon2) lon1] ; if lon2 empty, return lon1

        ; if first element same, skip them
        [(= (first lon1) (first lon2))
         (list-xor (rest lon1) (rest lon2))]

        ; if first element of lon1 is smaller, include
        [(< (first lon1) (first lon2))
         (cons (first lon1) (list-xor (rest lon1) lon2))]

        ; if first element of lon2 is smaller, include
        [else (cons (first lon2) (list-xor lon1 (rest lon2)))]
        ))

;; Tests
(check-expect (list-xor (list 1 3 5) (list 2 3 4)) (list 1 2 4 5))
(check-expect (list-xor empty (list 1 2 3)) (list 1 2 3))