;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 02, Problem 2
;; *******************************************

;;
;; Part A
;;

(define (manhattan-distance x1 y1 x2 y2)
  (+ (abs (- x1 x2))
     (abs (- y1 y2))))

(check-expect (manhattan-distance 1 2 3 4) 4)
(check-expect (manhattan-distance 0 4 9 7) 12)

;;
;; Part B
;;

(define (batter-slugging-average s d t hr ab)
  (/ (+ s
        (* 2 d)
        (* 3 t)
        (* 4 hr))
     ab))

(check-expect (batter-slugging-average 1 2 3 4 5) 6)
(check-expect (batter-slugging-average 2 2 2 2 4) 5)

;;
;; Part C
;;

(define (cone-area r h)
  (* pi r
     (+ r(sqrt
          (+ (expt h 2) (expt r 2))))))

(check-within (cone-area 1 1) 7.58 0.1)
(check-within (cone-area 3 2) 62.256 0.1)

;;
;; Part D
;;

(define G 6.674e-11)
(define (escape M r)
  (sqrt (/ (* 2 G M) r)))

(check-within (escape 1 1) 1.1553e-5 0.1)
(check-within (escape 9 2) 2.45e-5 0.1)

;;
;; Part E
;;

(define (partition-size-approximation n)
  (* (/ 1 (* 4 n (sqrt 3)))
     (exp (* pi (sqrt (/ (* 2 n) 3))))))

(check-within (partition-size-approximation 1) 1.88 0.1)
(check-within (partition-size-approximation 3) 4.09 0.1)

;;
;; Part F
;;

(define (d1 maturity rate volatility spot-price strike-price)
  (* (/ 1 (* volatility (sqrt maturity)))
     (+ (log (/ spot-price strike-price))
        (* maturity (+ rate (/ (sqr volatility) 2))))))

(check-within (d1 1 1 1 1 1) 1.5 1.0)
(check-within (d1 1 2 3 4 5) 2.09 1.0)