;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname course-selection) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;; *******************************************
;;     Rhicaela Miranda (21096228)
;;     CS 135 Fall 2024
;;     Assignment 05, Problem 2
;; *******************************************

;; A DesiredCourses is one of:
;; * empty
;; * (cons (list Str (listof Sym)) DesiredCourses)

(define selections
  (list
   (list "mpines" (list 'CS135 'MATH135 'MATH137 'ENGL109 'FINE100))
   (list "w46dles" (list 'ARBUS101 'ECON101 'ECON102 'ECON206 'LS101))
   (list "d32pines" (list 'CS115 'MATH135 'MATH137 'ENGL109 'FINE100))
   (list "gnclstan" (list 'ANTH241 'LS201 'AMATH231 'PMATH347))))

(define selections2
  (list
   (list "rose" (list 'CS135 'MATH137))
   (list "jennie" (list 'MATH135 'MATH137))
   (list "lisa" (list 'CS100 'ENGL109))))


;;
;; Part A
;;

;; (missed-deadline-add DesiredCourses student-id) adds a student-id (given by Quest username) to the 
;; DesiredCourses list if they have missed the deadline and do not appear in DesiredCourses.
;; If they do appear, the list is unchanged.

;; Examples
(check-expect (missed-deadline-add selections "s0os")
              (list
               (list "mpines" (list 'CS135 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "w46dles" (list 'ARBUS101 'ECON101 'ECON102 'ECON206 'LS101))
               (list "d32pines" (list 'CS115 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "gnclstan" (list 'ANTH241 'LS201 'AMATH231 'PMATH347))
               (list "s0os" empty)
               ))

(check-expect (missed-deadline-add selections "d32pines")
              (list
               (list "mpines" (list 'CS135 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "w46dles" (list 'ARBUS101 'ECON101 'ECON102 'ECON206 'LS101))
               (list "d32pines" (list 'CS115 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "gnclstan" (list 'ANTH241 'LS201 'AMATH231 'PMATH347))))

;; missed-deadline-add: DesiredCourses Str -> DesiredCourses
(define (missed-deadline-add DesiredCourses student-id)
  (cond [(empty? DesiredCourses) (list (list student-id empty))] ; base case

        ; if student-id is found in the list, return the unchanged list
        [(string=? (first (first DesiredCourses)) student-id) DesiredCourses]

        ; if student-id is not found, keep the first student in the list and recurse
        [else
         (cons (first DesiredCourses) (missed-deadline-add (rest DesiredCourses) student-id))]))

;; Tests
(check-expect (missed-deadline-add selections2 "jisoo")
              (list
               (list "rose" (list 'CS135 'MATH137))
               (list "jennie" (list 'MATH135 'MATH137))
               (list "lisa" (list 'CS100 'ENGL109))
               (list "jisoo" empty)))

(check-expect (missed-deadline-add selections2 "lisa")
              (list
               (list "rose" (list 'CS135 'MATH137))
               (list "jennie" (list 'MATH135 'MATH137))
               (list "lisa" (list 'CS100 'ENGL109))))

;;
;; Part B
;;

;; (course-in-list? course-list course-code) is a helper function to check if a course
;; is in course-list
;; course-in-list?: (listof Sym) Sym -> Bool
(define (course-in-list? course-list course-code)
  (cond [(empty? course-list) false] ; Base case
        [(symbol=? (first course-list) course-code) true] ; if courses match, return true
        [else
         (course-in-list? (rest course-list) course-code)] ; otherwise, recurse
        ))

;; (taking-course? DesiredCourses student-id course-code) checks if a given student, with student-id,
;; is enrolled in a specific course-code. It returns true if the student is taking the course,
;; false otherwise. If the student does not appear in the DesiredCourses, returns false.

;; Examples
(check-expect (taking-course? selections "d32pines" 'CS115) true)
(check-expect (taking-course? selections "d32pines" 'CS135) false)

;; taking-course?: DesiredCourses Str Sym -> Bool
(define (taking-course? DesiredCourses student-id course-code)
  (cond [(empty? DesiredCourses) false] ; base case
        [(string=? (first (first DesiredCourses)) student-id) ; check if student-id matches
         (course-in-list? (second (first DesiredCourses)) course-code)] ; check if coursee
        [else
         (taking-course? (rest DesiredCourses) student-id course-code)] ; otherwise, recurse
        ))

;; Tests
(check-expect (taking-course? selections2 "lisa" 'CS100) true)
(check-expect (taking-course? selections2 "jennie" 'MATH128) false)

;;
;; Part C
;;

;; (append-course course-list course-code) adds the course-code at the end of the course-list
;; append-course: (listof Sym) Sym -> (listof Sym)
(define (append-course course-list course-code)
  ( cond [(empty? course-list) (list course-code)] ; if course list is empty, start a new list
         [else
          (cons (first course-list) (append-course (rest course-list) course-code))])) ; recurse


;; (add-course DesiredCourses student-id course-code) adds a course-code to the list of courses
;; for a student, student-id, in the DesiredCourses. If the student doesn't exist,
;; it adds the student with the course-code. If the course already exists, no changes are made

;; Examples
(check-expect (add-course selections "mpines" 'CS136)
              (list
               (list "mpines" (list 'CS135 'MATH135 'MATH137 'ENGL109 'FINE100 'CS136))
               (list "w46dles" (list 'ARBUS101 'ECON101 'ECON102 'ECON206 'LS101))
               (list "d32pines" (list 'CS115 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "gnclstan" (list 'ANTH241 'LS201 'AMATH231 'PMATH347))))
              
(check-expect (add-course selections "s0os" 'CS246)
              (list
               (list "mpines" (list 'CS135 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "w46dles" (list 'ARBUS101 'ECON101 'ECON102 'ECON206 'LS101))
               (list "d32pines" (list 'CS115 'MATH135 'MATH137 'ENGL109 'FINE100))
               (list "gnclstan" (list 'ANTH241 'LS201 'AMATH231 'PMATH347))
               (list "s0os" (list 'CS246))))

;; add-course: DesiredCourses Str Sym -> DesiredCourses
(define (add-course DesiredCourses student-id course-code)
  (cond
    ; if list is empty, add a new student with their course
    [(empty? DesiredCourses) (list (list student-id (list course-code)))]

    ; if student-id is found, check if course-code is already in their list
    [(string=? (first (first DesiredCourses)) student-id)
     (cond
       ; if course exists, return unchanged
       [(course-in-list? (second (first DesiredCourses)) course-code) DesiredCourses]

       ; if course does not exist, add course to the student's course list
       [else
        (cons (list student-id (append-course (second (first DesiredCourses)) course-code))
              (rest DesiredCourses))])]

    ; if student-id is not found, recurse
    [else
     (cons (first DesiredCourses) (add-course (rest DesiredCourses) student-id course-code))]))

;; Tests
(check-expect (add-course selections2 "rose" 'CS246)
              (list
               (list "rose" (list 'CS135 'MATH137 'CS246))
               (list "jennie" (list 'MATH135 'MATH137))
               (list "lisa" (list 'CS100 'ENGL109))))

(check-expect (add-course selections2 "jisoo" 'CS136)
              (list
               (list "rose" (list 'CS135 'MATH137))
               (list "jennie" (list 'MATH135 'MATH137))
               (list "lisa" (list 'CS100 'ENGL109))
               (list "jisoo" (list 'CS136))))

;;
;; Part D
;;

;; (create-classlist DesiredCourses course-code) produces a list of student IDs
;; that are enrolled in the course with the given course-code.
;; If no students are taking the course, it returns an empty list.

;; Examples
(check-expect (create-classlist selections 'MATH137)
              (list "mpines" "d32pines"))
(check-expect (create-classlist selections 'ARBUS101)
              (list "w46dles"))

;; create-classlist: DesiredCourses Sym -> (listof Str)
(define (create-classlist DesiredCourses course-code)
  (cond [(empty? DesiredCourses) empty] ; base case

        ; if student is enrolled in the course, add ID to the classlist
        [(course-in-list? (second (first DesiredCourses)) course-code)
         (cons (first (first DesiredCourses))
               (create-classlist (rest DesiredCourses) course-code))]

        ; if student is not enrolled in the course, skip them
        [else
         (create-classlist (rest DesiredCourses) course-code)]))

;; Tests
(check-expect (create-classlist selections2 'MATH137)
              (list "rose" "jennie"))
(check-expect (create-classlist selections2 'CS100)
              (list "lisa"))

