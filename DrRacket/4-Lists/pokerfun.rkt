;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pokerfun) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 04, Problem 3
;; *******************************************

(define-struct card (rank suit))
;; A Card is a (make-card (anyof Int Sym) Sym)
;; Requires: rank is either an integer from 2 to 10
;; or one of 'Jack, 'Queen, 'King, 'Ace
;; suit is one of 'Club, 'Diamond, 'Heart, 'Spade

;;
;; Part A
;;

;; (rank-value rank) is a helper function that converts a symbolic rank to a numeric value.

;; rank-value: Sym -> Num
(define (rank-value rank)
  (cond [(symbol? rank)
         (cond [(symbol=? rank 'Ace) 14]
               [(symbol=? rank 'King) 13]
               [(symbol=? rank 'Queen) 12]
               [(symbol=? rank 'Jack) 11])]
        [else rank]))

;; (suit-value suit) is a helper function that converts a symbolic suit to a numeric value.

;; suit-value: Sym -> Num
(define (suit-value suit)
  (cond [(symbol=? suit 'Spade) 4]
        [(symbol=? suit 'Heart) 3]
        [(symbol=? suit 'Diamond) 2]
        [(symbol=? suit 'Club) 1]))

;; (sorted? cards) consumes a non-empty list of Card structs and produces true if the cards
;; is in increasing order and false otherwise

;; Examples
(check-expect (sorted? (cons (make-card 2 'Diamond) (cons (make-card 7 'Club) empty))) true)
(check-expect (sorted? (cons (make-card 'Ace 'Spade) (cons (make-card 'Ace 'Club) empty))) false)

;; sorted?: (listof Card) -> Bool

(define (sorted? cards)
  (cond [(empty? (rest cards)) true] ; base case

        ; check if current card is sorted by rank using helper function rank-value
        [(< (rank-value (card-rank (first cards))) (rank-value (card-rank (first (rest cards)))))
         (sorted? (rest cards))]

        ; if ranks are the same, check if suits are sorted
        [(and (= (rank-value (card-rank (first cards)))
                 (rank-value (card-rank (first (rest cards)))))
              (< (suit-value (card-suit (first cards)))
                 (suit-value (card-suit (first (rest cards))))))
         (sorted? (rest cards))]

        ; otherwise, list is not sorted
        [else false])
  )

;; Tests
(check-expect (sorted? (cons (make-card 9 'Club) (cons (make-card 7 'Heart) empty))) false)
(check-expect (sorted? (cons (make-card 'Queen 'Heart)
                             (cons (make-card 'King 'Spade)
                                   (cons (make-card 'Ace 'Club) empty)))) true)

;;
;; Part B
;;

;; (cheater? cards) consumes a non-empty sorted list of cards and returns true if
;; there are duplicate cards, and false otherwise

;; Examples
(check-expect (cheater? (cons (make-card 2 'Diamond)
                              (cons (make-card 7 'Club) empty))) false)
(check-expect (cheater? (cons (make-card 'Ace 'Spade)
                              (cons (make-card 'Ace 'Spade) empty))) true)

;; cheater?: (listof Card) -> Bool
(define (cheater? cards)
  (cond
    ; base case
    [(empty? (rest cards)) false]
    
    ; compare first card with the next card
    [(and (= (rank-value( card-rank (first cards))) (rank-value (card-rank (first (rest cards)))))
          (symbol=? (card-suit (first cards)) (card-suit (first (rest cards)))))
     true]

    ; recurse for the rest of the list
    [else (cheater? (rest cards))])
  )

;; Tests
(check-expect (cheater? (cons (make-card 5 'Heart)
                              (cons (make-card 7 'Club)
                                    (cons (make-card 7 'Club) empty)))) true)
(check-expect (cheater? (cons (make-card 5 'Heart)
                              (cons (make-card 7 'Spade)
                                    (cons (make-card 7 'Club) empty)))) false)


;;
;; Part C
;;

;; (is-straight? cards) consumes a sorted list of 5 cards and produces true if the cards
;; form a straight (5 cards are increasing by one rank in order) and false otherwise

;; Examples
(check-expect (is-straight? (cons (make-card 2 'Diamond)
                                  (cons (make-card 3 'Club)
                                        (cons (make-card 4 'Spade)
                                              (cons (make-card 5 'Club) empty))))) true)
(check-expect (is-straight? (cons (make-card 8 'Diamond)
                                  (cons (make-card 9 'Club)
                                        (cons (make-card 'Queen 'Spade)
                                              (cons (make-card 'King 'Club) empty))))) false)

;; is-straight?: (listof Card) -> Bool
(define (is-straight? cards)
  (cond [(empty? (rest cards)) true]
        [(= (+ 1 (rank-value (card-rank (first cards))))
            (rank-value (card-rank (first (rest cards)))))
         (is-straight? (rest cards))]
        [else false])
  )

;; Tests
(check-expect (is-straight? (cons (make-card 5 'Diamond)
                                  (cons (make-card 6 'Club)
                                        (cons (make-card 7 'Spade)
                                              (cons (make-card 8 'Club) empty))))) true)
(check-expect (is-straight? (cons (make-card 2 'Diamond)
                                  (cons (make-card 4 'Club)
                                        (cons (make-card 6 'Spade)
                                              (cons (make-card 8 'Club) empty))))) false)


;;
;; Part D
;;

;; (is-flush? cards) consumes a sorted list of 5 cards and prdocues true if
;; the cards form a flush (all cards have the same suit) and false otherwise

;; Examples:
(check-expect (is-flush? (cons (make-card 2 'Diamond)
                              (cons (make-card 3 'Diamond)
                                    (cons (make-card 4 'Diamond)
                                          (cons (make-card 5 'Diamond)
                                                (cons (make-card 6 'Diamond) empty)))))) 
              true)
(check-expect (is-flush? (cons (make-card 2 'Club)
                              (cons (make-card 5 'Club)
                                    (cons (make-card 10 'Heart)
                                          (cons (make-card 'Jack 'Club)
                                                (cons (make-card 'Ace 'Club) empty))))))
              false)

;; is-flush?: (listof Card) -> Bool
(define (is-flush? cards)
  (cond [(empty? cards) true] ; base case (empty hand)
        [(empty? (rest cards)) true] ; single card is a flush
        [(symbol=? (card-suit (first cards)) (card-suit (first (rest cards))))
         (is-flush? (rest cards))] ; if suits match, recurse
        [else false])
  )

;; Tests
(check-expect (is-flush? (cons (make-card 'Ace 'Spade)
                               (cons (make-card 'King 'Spade)
                                     (cons (make-card 10 'Spade)
                                           (cons (make-card 5 'Spade)
                                                 (cons (make-card 2 'Spade) empty))))))
              true)
(check-expect (is-flush? (cons (make-card 3 'Heart)
                               (cons (make-card 7 'Heart)
                                     (cons (make-card 'Jack 'Heart)
                                           (cons (make-card 9 'Club)
                                                 (cons (make-card 2 'Heart) empty))))))
              false)


;;
;; Part E
;;

;; (count-rank rank cards) is a helper function that counts how many times a
;; particular rank appears in a list of cards

;; count-rank: Sym (listof Card) -> Num
(define (count-rank rank cards)
  (cond [(empty? cards) 0]
        [(= (rank-value rank) (rank-value (card-rank (first cards))))
         (+ 1 (count-rank rank (rest cards)))]
        [else (count-rank rank (rest cards))]))

;; (find-second-rank first-rank cards) is a helper function that finds the
;; second distinct rank in the list of cards, different from the first-rank.

;; find-second-rank: Sym (listof Card) -> Sym
(define (find-second-rank first-rank cards)
  (cond [(empty? cards) 'None]
        [(= (rank-value first-rank) (rank-value (card-rank (first cards))))
         (find-second-rank first-rank (rest cards))]
        [else
         (card-rank (first cards))]))

;; (is-full-house? cards) consumes a sorted list of 5 cards and produces true if,
;; the card forms a full house (3 cards have same rank, and remaining 2 cards have
;; same rank), and false otherwise

;; Examples
(check-expect (is-full-house? (cons (make-card 2 'Diamond)
                                    (cons (make-card 2 'Heart)
                                          (cons (make-card 2 'Club)
                                                (cons (make-card 3 'Spade)
                                                      (cons (make-card 3 'Diamond) empty))))))
              true)
(check-expect (is-full-house? (cons (make-card 'Ace 'Diamond)
                                    (cons (make-card 'Ace 'Heart)
                                          (cons (make-card 'Ace 'Club)
                                                (cons (make-card 'Ace 'Spade)
                                                      (cons (make-card 'Queen 'Diamond) empty))))))
              false)

;; is-full-house?: (listof Card) -> Bool
(define (is-full-house? cards)
  (cond [(or

          ; full house: 3 cards of one rank and 2 cards of another
          (and (= (count-rank (card-rank (first cards)) cards) 3)
               (= (count-rank (find-second-rank (card-rank (first cards)) cards) cards) 2))

          ; or 2 cards of one rank and 3 cards of another
          (and (= (count-rank (card-rank (first cards)) cards) 2)
               (= (count-rank (find-second-rank (card-rank (first cards)) cards) cards) 3))
          )
         true]
        [else false])
  )

;; Tests
(check-expect (is-full-house? (cons (make-card 'King 'Club)
                                    (cons (make-card 'King 'Spade)
                                          (cons (make-card 10 'Diamond)
                                                (cons (make-card 10 'Heart)
                                                      (cons (make-card 10 'Spade) empty))))))
              true)
(check-expect (is-full-house? (cons (make-card 'King 'Club)
                                    (cons (make-card 'King 'Spade)
                                          (cons (make-card 9 'Diamond)
                                                (cons (make-card 10 'Heart)
                                                      (cons (make-card 10 'Spade) empty))))))
              false)

;;
;; Part F
;;

;; (replace-card cards) consumes two cards (target card and a new card) and a list of cards
;; and produces a new list of cards where the first occurence of the target card is replaced
;; by the new card

;; Examples
(check-expect (replace-card (cons (make-card 2 'Diamond)
                                  (cons (make-card 4 'Heart) empty))
                            (make-card 2 'Diamond)
                            (make-card 3 'Heart))
              (cons (make-card 3 'Heart)
                    (cons (make-card 4 'Heart) empty)))
(check-expect (replace-card (cons (make-card 'Ace 'Spade)
                                  (cons (make-card 5 'Heart) empty))
                            (make-card 'Ace 'Spade)
                            (make-card 'King 'Diamond))
              (cons (make-card 'King 'Diamond)
                    (cons (make-card 5 'Heart) empty)))

;; replace-card: Card Card (listof Card) -> (listof Card)
(define (replace-card cards target new-card)
  (cond [(empty? cards) empty] ; base case

        ; if the first card matches the target, replace it with new card
        [(and (= (rank-value (card-rank (first cards))) (rank-value (card-rank target)))
              (symbol=? (card-suit (first cards)) (card-suit target)))
         (cons new-card (rest cards))]

        ; otherwise, keep the first card and recurse
        [else
         (cons (first cards) (replace-card (rest cards) target new-card))]))

;; Tests
(check-expect (replace-card (cons (make-card 2 'Diamond)
                                  (cons (make-card 4 'Heart)
                                        (cons (make-card 7 'Spade) empty)))
                            (make-card 7 'Spade)
                            (make-card 'Jack 'Club))
              (cons (make-card 2 'Diamond)
                    (cons (make-card 4 'Heart)
                          (cons (make-card 'Jack 'Club) empty))))
(check-expect (replace-card (cons (make-card 10 'Spade) empty)
                            (make-card 10 'Spade)
                            (make-card 'Queen 'Club))
              (cons (make-card 'Queen 'Club) empty))

