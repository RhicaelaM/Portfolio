;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname complexmath) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 03, Problem 2
;; *******************************************

(define-struct point(x y))
;; A Point is a (make-point Num Num)

;;
;; Part A
;;


;; (point-mult p1 p2) produces the product of two points p1 & p2

;; Examples
(check-expect (point-mult (make-point 1 2) (make-point 3 4)) (make-point -5 10))
(check-expect (point-mult (make-point 0 0) (make-point 2 2)) (make-point 0 0))

;; point-mult: Point Point -> Point

(define (point-mult p1 p2)
  (make-point (- (* (point-x p1) (point-x p2)) (* (point-y p1) (point-y p2)))
              (+ (* (point-x p1) (point-y p2)) (* (point-x p2) (point-y p1)))         
                      )
  )

;; Tests
(check-expect (point-mult (make-point 1 1) (make-point 2 2)) (make-point 0 4))
(check-expect (point-mult (make-point 1 2) (make-point 3 4)) (make-point -5 10))

;;
;; Part B
;;

;; (point-div p1 p2) produces the diviison of two points p1 & p2
;; Requires: The denominator (x2^2 + y2^2) must not be zero

;; Examples
(check-expect (point-div (make-point 1 2) (make-point 3 4)) (make-point 0.44 0.08))
(check-within (point-y (point-div (make-point 1 2) (make-point 3 4))) 0.08 0.01)

;; point-div: Point Point -> Point
;; Requires: (point-x p2)^2 + (point-y p2)^2 != 0

(define (point-div p1 p2)
  (make-point (/ (+ (* (point-x p1) (point-x p2)) (* (point-y p1) (point-y p2)))
                 (+ (sqr (point-x p2)) (sqr (point-y p2))))
              (/ (- (* (point-y p1) (point-x p2)) (* (point-x p1) (point-y p2)))
                 (+ (sqr (point-x p2)) (sqr (point-y p2))))
                     )
  )

;; Tests
(check-expect (point-div (make-point 1 2) (make-point 3 4)) (make-point 0.44 0.08))
(check-error (point-div (make-point 1 2) (make-point 0 0)))