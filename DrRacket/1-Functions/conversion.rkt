;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname conversion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 01, Problem 4: Speed
;; *******************************************

;;
;; Part A
;;

(define mile-meters 1609.344)
(define hour-seconds 3600)

(define (m/s->mph v) (/ (* hour-seconds v) mile-meters))

(check-within (m/s->mph 1) 2.24 0.1)
(check-within (m/s->mph 2) 4.47 0.1)

;;
;; Part B
;;

(define smoot-meters 1.7018)
(define millifortnight-seconds 1209.6)

(define (mph->s/mfn v)
  (/ (* v mile-meters millifortnight-seconds)
     (* hour-seconds smoot-meters)))

(check-within (mph->s/mfn 1) 532224/1675 0.1)