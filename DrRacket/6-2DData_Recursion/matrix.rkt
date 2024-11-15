;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname matrix) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 06, Problem 2
;; *******************************************

;;
;; Part A
;;

(define-struct row (elements))
;; A Row is a (make-row (listof Number)) where elements represent
;; the values in a single row of the matrix.

;; row-template: Row -> Any
(define (row-template r)
  (cond [(empty? r) ...]
        [else (cons (first r) (row-template (rest r)))]))

(define-struct matrix (rows))
;; A Matrix is a (make-matrix (listof Row))
;; Requires:
;; * Each row in matrix have the same length to maintain rectangular structure

;; matrix-template: Matrix -> Any
(define (matrix-template m)
  (cond [(empty? m) ...]
        [else (cons (row-template (first m)) (matrix-template (rest m)))]))

;;
;; Part B
;;

;; (matrix-item m row col) consumes a Matrix, m, a row number, and a column number, col.
;; It produces the item located at that row and column position in the matrix.

;; Examples:
(define M (list (list 1 2 3)
                (list 4 5 6)
                (list 7 8 9)))

(define N (list (list 1 0 0)
                (list 0 1 0)
                (list 0 0 1)))

(check-expect (matrix-item M 1 2) 6)
(check-expect (matrix-item M 2 0) 7)

;; matrix-item: Matrix Int Int -> Num
(define (matrix-item m row col)
  (get-col (get-row m row) col))

;; Tests
(check-expect (matrix-item M 0 1) 2)
(check-expect (matrix-item M 2 1) 8)


;; (get-col row col) is a helper function that returns the item at the specified
;; column in a row

;; Example
(check-expect (get-col (list 1 2 3) 0) 1)

;; get-col: (listof Any) Int -> Any
(define (get-col row col)
  (cond
    [(empty? row) (error "Column index out of bounds")]
    [(zero? col) (first row)]
    [else (get-col (rest row) (sub1 col))]))


;; (get-row m row) is a helper function that returns the row at the specified index
;; in the matrix.

;; Example
(check-expect (get-row M 0) (list 1 2 3))

;; get-row: (listof Any) Int -> Any
(define (get-row m row)
  (cond
    [(empty? row) (error "Column index out of bounds")]
    [(zero? row) (first m)]
        [else (get-row (rest m) (sub1 row))]))
;;
;; Part C
;;

;; (matrix-col m col) consumes a Matrix, m, and a column number, c, and produces a list
;; of items found in the c-th column of each row in m.

;; Examples:
(check-expect (matrix-col M 1) (list 2 5 8))
(check-expect (matrix-col M 0) (list 1 4 7))

;; matrix-col: Matrix Nat -> (listof Any)
(define (matrix-col m col)
  (cond [(empty? m) empty]
        [else (cons (get-col (first m) col)
                    (matrix-col (rest m) col))]))

;; Tests
(check-expect (matrix-col (list (list 100 200 300)
                                (list 400 500 600)
                                (list 700 800 900)) 
                          1)
              (list 200 500 800))
(check-expect (matrix-col (list (list 1 2 3 4 5)
                                (list 6 7 8 9 10)
                                (list 11 12 13 14 15)
                                (list 16 17 18 19 20)
                                (list 21 22 23 24 25)) 
                          4)
              (list 5 10 15 20 25))

;;
;; Part D
;;

;; (matrix-transpose m) consumes a Matrix, m, and produces a new matrix that is the transpose of m.
;; In the transpose of a matrix, each row becomes a column and each column becomes a row.

;; Examples:
(check-expect (matrix-transpose (list (list 1 2 3 4)
                                      (list 5 6 7 8)))
              (list (list 1 5)
                    (list 2 6)
                    (list 3 7)
                    (list 4 8)))
(check-expect (matrix-transpose M) (list (list 1 4 7)
                                        (list 2 5 8)
                                        (list 3 6 9)))

;; matrix-transpose: Matrix -> Matrix
(define (matrix-transpose m)
  (cond [(empty? (first m)) empty] ; base case
        [else (cons (build-column m) ; build first row by collecting first element of each row in m

                    ; recursively transpose rest of matrix with first element removed from each row
                    (matrix-transpose (remove-column m)))]))

;; Tests
(check-expect (matrix-transpose (list (list 1 2)
                                      (list 3 4)
                                      (list 5 6)
                                      (list 7 8)
                                      (list 9 10)))
              (list (list 1 3 5 7 9)
                    (list 2 4 6 8 10)))

(check-expect (matrix-transpose (list (list 100 200 300 400 500)))
              (list (list 100)
                    (list 200)
                    (list 300)
                    (list 400)
                    (list 500)))


;; (build-column m) is a helper function that builds a column by taking the first element of each row
;; in Matrix, m.
;; build-column: Matrix -> (listof Any)
(define (build-column m)
  (cond [(empty? m) empty]
        [else (cons (first (first m)) (build-column (rest m)))]))

;; Example:
(check-expect (build-column M) (list 1 4 7))


;; (remove-column m) is a helper function that removes the first element of each row in Matrix, m.
;; remove-column: Matrix -> Matrix
(define (remove-column m)
  (cond [(empty? m) empty]
        [else (cons (rest (first m)) (remove-column (rest m)))]))

;; Example:
(check-expect (remove-column M) (list (list 2 3)
                                      (list 5 6)
                                      (list 8 9)))


;;
;; Part E
;;

;; (matrix-multiply a b) consumes two matrices, a and b, and produces their product matrix.

;; Examples:
(define MA (list (list 1 2)
                 (list 3 4)
                 (list 5 6)))
(define MB (list (list 7 8 9)
                 (list 10 11 12)))

(check-expect (matrix-multiply MA MB) (list (list 27 30 33)
                                            (list 61 68 75)
                                            (list 95 106 117)))
(check-expect (matrix-multiply (list (list 2 3)
                                     (list 4 5))
                               (list (list 1 2)
                                     (list 3 4)))
              (list (list 11 16)
                    (list 19 28)))

;; matrix-multiply: Matrix Matrix -> Matrix
(define (matrix-multiply a b)
  (cond [(empty? a) empty]
        [else (cons (build-row (first a) b 0) ; builds first row of C
                    (matrix-multiply (rest a) b))])) ; recursive call

;; Tests
(check-expect (matrix-multiply (list (list 2 4 6)
                                     (list 1 3 5)
                                     (list 7 8 9))
                               (list (list 1 0 0)
                                     (list 0 1 0)
                                     (list 0 0 1)))
              (list (list 2 4 6)
                    (list 1 3 5)
                    (list 7 8 9)))

(check-expect (matrix-multiply (list (list 10 20)
                                     (list 30 40))
                               (list (list 1 0)
                                     (list 0 1)))
              (list (list 10 20)
                    (list 30 40)))


;; (dot-product row col) is a helper function that computes the dot product of two lists,
;; row and col, which represents a row of Matrix A and a column of Matrix B, respectively.

;; Example:
(check-expect (dot-product (list 1 2 3) (list 4 5 6)) 32)

;; dot-product: (listof Num) (listof Num) -> Num
(define (dot-product row col)
  (cond [(empty? row) 0]
        [else (+ (* (first row) (first col))
                 (dot-product (rest row) (rest col)))]))


;; (build-row row-a b col) is a helper function that builds a row for the resulting matrix C
;; by computing the dot product of a row in A with each column in B

;; Example:
(check-expect (build-row (list 1 2 3) N 0) (list 1 2 3))

;; build-row: (listof Num) Matrix Int -> (listof Num)
(define (build-row row-a b col)
  (cond [(>= col (length (first b))) empty]
        [else (cons (dot-product row-a (matrix-col b col))
                    (build-row row-a b (add1 col)))]))































