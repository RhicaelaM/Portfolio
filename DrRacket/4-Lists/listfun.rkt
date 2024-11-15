;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname listfun) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 04, Problem 2
;; *******************************************

;;
;; Part A
;;

;; (count-symbols l) is a helper functtion that consumes a list, l, that can contain
;; numbers, string, boolean, or symbols
;; and recursively counts how many symbols are present in the list.

;; count-symbols: (listof Any) -> Num

(define (count-symbols l)
    (cond [(empty? l) 0] ; if the list is empty, return 0
          
          ; if first element is a symbol, adds 1, and recurses 
          [(symbol? (first l)) (+ 1 (count-symbols (rest l)))] 
          [else
           (count-symbols (rest l))])) ; if not a symbol, recurses on rest of list


;; (list-has-exactly-4-symbols l) consumes a list, l (can containt numbers, string, boolean,
;; or symbols)
;; and determines if the list contains exactly 4 symbols.
;; Returns true if there are exactly 4 symbols, otherwise returns false.

;; Examples
(check-expect (list-has-exactly-4-symbols (cons 'Red
                                                (cons "Blue"
                                                      (cons "Yellow"
                                                            (cons 'Green
                                                                  (cons 1 empty)))))) false)
(check-expect (list-has-exactly-4-symbols (cons 'Mama
                                                (cons 'a
                                                      (cons 'girl
                                                            (cons 'behind
                                                                  (cons "you" empty)))))) true)


;; list-has-exactly-4-symbols: (list of (anyof Num Str Bool Sym)) -> Bool

(define (list-has-exactly-4-symbols l)
  (= 4 (count-symbols l))) ; Compares the count of symbols to 4
  
;; Tests
(check-expect (list-has-exactly-4-symbols (list 'one 'two 'three 'four 5 "hello" true)) true)
(check-expect (list-has-exactly-4-symbols (list 'one 'two "hello" false 10)) false)

;;
;; Part B
;;

;; (add-only-numbers l) consumes a list, l, (of anything) and returns the sum of all numbers.
;; Returns 0 if there are no numbers in the list

;; Examples
(check-expect (add-only-numbers (cons "A" (cons 1 (cons 'B (cons "C" (cons 2 empty)))))) 3)
(check-expect (add-only-numbers empty) 0)
              
;; add-only-numbers: (listof Any) -> Num

(define (add-only-numbers l)
  (cond
    [(empty? l) 0] ; if list is empty, return 0
    [(number? (first l)) (+ (first l) (add-only-numbers (rest l)))] ; if its a number, add 1st element
    [else
     (add-only-numbers (rest l))] ; if not a number, skip 1st element
    )
  )

;; Tests
(check-expect (add-only-numbers (list 1 'a "b" 3 5 "c")) 9)
(check-expect (add-only-numbers (list "a" "b" "c" "d")) 0)

;;
;; Part C
;;

;; (before-after s1 s2 s3 ls) consumes three strings (s1, s2, s3) and a list of strings (ls) and,
;; produces a new list of strings where each time s1 appears in ls,
;; s2 is added before it and s3 is added after it.
;; If s1 does not appear in ls, nothing happens.

;; Examples
(check-expect (before-after "girl" "a" "behind" (list "Mama" "girl" "you"))
              (list "Mama" "a" "girl" "behind" "you"))
(check-expect (before-after "is" "sky" "blue" (list "the" "is"))
              (list "the" "sky" "is" "blue"))

;; before-after: Str Str Str (listof Str) -> (listof Str)

(define (before-after s1 s2 s3 ls)
  (cond
    [(empty? ls) empty] ; if list is empty, return empty
    [(string=? (first ls) s1) ; if first element == s1
     (cons s2 (cons s1 (cons s3 (before-after s1 s2 s3 (rest ls)))))] ; add s2 before and s3 after s1
    [else
     (cons (first ls) (before-after s1 s2 s3 (rest ls)))] ; otherwise, keep element
    )
  )

;; Tests
(check-expect (before-after "fun" "very" "cool" (cons "this" (cons "is" (cons "fun" empty))))
              (cons "this" (cons "is" (cons "very" (cons "fun" (cons "cool" empty))))))

(check-expect (before-after "Jennie" "love" "Kim" (list "I" "Jennie"))
              (list "I" "love" "Jennie" "Kim"))

;;
;; Part D
;;

;; (exists? val l) consumes a value, val, and a list, l,
;; which both may contain numbers, strings, or symbols.
;; This function returns true if the consumed value is in the list and false otherwise.

;; Examples
(check-expect (exists? 'hello (cons 'hello (cons 'world empty))) true)
(check-expect (exists? 'hello (cons "this" (cons "is" (cons "a" (cons "test" empty))))) false)

;; exists? : (anyof Num Str Sym) (listof (anyof Num Str Sym)) -> Bool

(define (exists? val l)
  (cond
    [(empty? l) false] ; base case

    ; check if val == first element
    ; case 1: if both val and the first element are symbols
    [(and (symbol? val) (symbol? (first l)) (symbol=? val (first l))) true]

    ; case 2: if both val and the first element are strings
    [(and (string? val) (string? (first l)) (string=? val (first l))) true]

    ; case 3: if both val and the first element are numbers
    [(and (number? val) (number? (first l)) (= val (first l))) true]

    
    [else
     (exists? val (rest l))])) ; otherwise, recursively check the rest of the list

;; Tests
(check-expect (exists? 'blue (cons 'red (cons 'green (cons 'blue (cons 'yellow empty))))) true)
(check-expect (exists? 100 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty)))))) false)

;;
;; Part E
;;

;; (remove-duplicates l) consumes a list, l, that may contain numbers, strings, or symbols.
;; This function removes all but the last occurence of each element in the list.

;; Examples
(check-expect (remove-duplicates (cons 'a (cons 'b (cons 'a (cons 'c (cons 'b empty))))))
              (cons 'a (cons 'c (cons 'b empty))))
(check-expect (remove-duplicates (cons 'x (cons 'y (cons 'z empty))))
              (cons 'x (cons 'y (cons 'z empty))))

;; remove-duplicates: (listof (anyof Num Str Sym)) -> (listof (anyof Num Str Sym)

(define (remove-duplicates l)
  (cond
    [(empty? l) empty] ; base case

    ; uses exists? function from part D to check if an element exists in a list
    ; if first element exists in the rest of the list, skip it and recurse
    ; Remove the element since we only want to keep last occurence
    [(exists? (first l) (rest l)) (remove-duplicates (rest l))]

    ; if first element does not exist in the rest of the list, keep it
    ; add first element to the result and continue through rest of list
    [else
     (cons (first l) (remove-duplicates (rest l)))]))

;; Tests
(check-expect (remove-duplicates (cons 'cat
                                       (cons 'dog
                                             (cons 'cat
                                                   (cons 'mouse
                                                         (cons 'dog
                                                               (cons 'cat empty)))))))
              (cons 'mouse (cons 'dog (cons 'cat empty))))
(check-expect (remove-duplicates (cons 1 (cons 1 (cons 1 (cons 1 (cons 1 empty))))))
              (cons 1 empty))













