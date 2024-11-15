;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug-a01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))

;; ************************************
;; Rhicaela Miranda (21096228)
;; CS 135 Fall 2024
;; Assignment 01, Problem 1: Debugging
;; ************************************

(define (luminosity red-pixel green-pixel blue-pixel)
  (+ (* 0.3 red-pixel)
     (* 0.59 green-pixel)
     (* 0.11 blue-pixel)))

(check-expect (luminosity 1 1 1)1)
(check-expect (luminosity 1 2 3)1.81)
