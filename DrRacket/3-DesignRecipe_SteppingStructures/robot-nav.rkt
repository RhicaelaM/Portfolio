;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname robot-nav) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 03, Problem 3
;; *******************************************

;;
;; Part A
;;

(define-struct state (x y dir))

;;
;; Part B
;;

;; (robot-ctl State command) produces a new State after applying the command to the robot

;; Commands:
;; 'forward: moves robot forward, but only within the bounds of= the grid
;; 'turn-left: turns robot to the left
;; 'turn-right: turns robot to the right

;; Examples:
(check-expect (robot-ctl (make-state 0 0 'North) 'turn-left) (make-state 0 0 'West))
(check-expect (robot-ctl (make-state 0 0 'North) 'forward) (make-state 0 1 'North))

;; robot-ctl: State Symbol -> State

(define (robot-ctl State command)
  (cond
    ; Forward
    [(symbol=? command 'forward)
     (cond
       [(symbol=? (state-dir State) 'North)
        (make-state (state-x State) (min (+ 1 (state-y State)) 10) (state-dir State))]
       [(symbol=? (state-dir State) 'South)
        (make-state (state-x State) (max (- (state-y State) 1) 0) (state-dir State))]
       [(symbol=? (state-dir State) 'East)
        (make-state (min (+ 1 (state-x State)) 10) (state-y State) (state-dir State))]
       [else
        (make-state (max (- (state-x State) 1) 0) (state-y State) (state-dir State))]
       )]

    ; Turn left
    [(symbol=? command 'turn-left)
     (make-state (state-x State) (state-y State)
                 (cond
                   [(symbol=? (state-dir State) 'North) 'West]
                   [(symbol=? (state-dir State) 'West) 'South]
                   [(symbol=? (state-dir State) 'South) 'East]
                   [else
                    'North])
                 )]

    ; Turn right
    [(symbol=? command 'turn-right)
     (make-state (state-x State) (state-y State)
                 (cond
                   [(symbol=? (state-dir State) 'North) 'East]
                   [(symbol=? (state-dir State) 'East) 'South]
                   [(symbol=? (state-dir State) 'South) 'West]
                   [else
                    'North])
                 )]
                     )
  )

;; Tests
(check-expect (robot-ctl (make-state 0 0 'North) 'turn-left) (make-state 0 0 'West))
(check-expect (robot-ctl (make-state 0 0 'North) 'turn-right) (make-state 0 0 'East))
