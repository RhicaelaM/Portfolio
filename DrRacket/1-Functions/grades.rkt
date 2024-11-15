;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 01, Problem 6: Grades
;; *******************************************


(define (final-cs135-grade participation midterm final-exam assignments)
  (+ (* 0.05 participation)
     (* 0.25 midterm)
     (* 0.45 final-exam)
     (* 0.25 assignments)))

(check-expect (final-cs135-grade 90 100 100 100) 99.5)

;;
;; Part B
;;

(define (cs135-final-exam-grade-needed participation midterm assignments)
  (/ (- 60 (* (/ (+
                  (* 0.05 participation)
                  (* 0.25 midterm)
                  (* 0.25 assignments)
                  ) 0.55)
              (- 1 0.45)))
     0.45))

(check-within (cs135-final-exam-grade-needed 90 70 40) 62.22 0.1)