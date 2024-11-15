;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bonus-a01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 01, Bonus
;; *******************************************

(define (calculated-grade participation midterm final-exam assignments)
  (+ (* 0.05 participation)
     (* 0.25 midterm)
     (* 0.45 final-exam)
     (* 0.25 assignments)))

(define (penalty final-exam assignments) (+ (max 0 (- 22.5 (* 0.45 final-exam))) ()))

(define (final-cs135-grade participation midterm final-exam assignments) ())

(check-expect (final-cs135-grade 100 90 80 90) 86) ; Passed the course
(check-expect (final-cs135-grade 100 100 48 100) 46) ; Failed, takes 46 as lowest grade
(check-expect (final-cs135-grade 60 60 35 45) 45) ; Failed, takes final grade as lowest grade