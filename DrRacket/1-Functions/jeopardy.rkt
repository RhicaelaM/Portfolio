;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname jeopardy) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 01, Problem5: Jeopardy!
;; *******************************************

;;
;; Part A
;;

(define (min-wager c1 c2 c3) (+ 1 (- (* 2 (max c2 c3)) c1)))

(check-expect (min-wager 10000 7000 8000) 6001)
(check-expect (min-wager 13000 4000 7000) 1001)

;;
;; Part B
;;

(define (missed-question c1 c2 c3) (- c1 (min-wager c1 c2 c3)))

(check-expect (missed-question 10000 7000 8000) 3999)
(check-expect (missed-question 13000 4000 7000) 11999)