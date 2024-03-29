;; CONDITIONALS
;; --------------------------------

;; 4.1 Write a function MAKE-EVEN that makes an odd number even by adding one to it.
;; If the input to MAKE-EVENT is already even, it should be returned unchanged.

(defun make-even (n)
  (if (oddp n)
      (+ n 1)
      n))

(make-even 1) ;; => 2
(make-even 2) ;; => 2


;; 4.2 Write a function FURTHER that makes a positive number larger by adding one to it,
;; and a negative number smaller by subtracting one from it.
;; What does your function do if given the number 0? => add one

(defun further (n)
  (if (< n 0)
      (- n 1)
      (+ n 1)))

(further 2) ;; => 2
(further 0) ;; => 1
(further -3) ;; => -4


;; 4.3 Recall the primitive function NOT:
;; It returns NIL for a true input and T for a false one.
;; Suppose Lisp didn't have a NOT primitive. Show how to write NOT using jus IF and constants. (no other functions)
;; Call your function MY-NOT

(defun my-not (input) (if (equal input nil) t nil))

(my-not nil) ;; => T
(my-not t) ;; => NIL


;; 4.4 Write a function ORDERED that takes two numbers as input and makes a list of them in ascending order.
;; (ORDERED 3 4) should return the list (3 4).
;; (ORDERED 4 3) should also return (3 4)
;; in other words, the first and second inputs should appear in reverse order when the first is greater than the sencond

(defun ordered (x y)
  (if (> x y)
      (list y x)
      (list x y)))

(ordered 3 4) ;; => (3 4)
(ordered 4 3) ;; => (3 4)


;; 4.6 Write a version of the absolute value function MY-ABS using COND instead of IF.

(defun my-abs (x)
  (cond (( < x 0) (-x))
        (t x)))

(my-abs 3) ;; => 3
(my-abs -3) ;; => 3


;; 4.8 Write EMPHASIZE3 which is like EMPHASIZE2 but adds the symbol VERY onto the list it it doesn't know how to emphasize it.
;; For example, EMPHASIZE3 of (LONG DAY) should produce (VERY LONG DAY).
;; What does EMPHASIZE3 of (VERY LONG DAY) produce?

(defun emphasize3 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
        ((equal (first x) 'bad) (cons 'awful (rest x)))
        (t (cons 'very x))))

(emphasize3 '(good day)) ;; => (great day)
(emphasize3 '(bad day)) ;; => (awful day)
(emphasize3 '(very long day)) ;; => (very very long day)


;; 4.10 Write a function CONSTRAIN that takes three inputs called X, MAX and MIN.
;; If X is less than MIN, it should return MIN;
;; If X is greater than MAX, it should return MAX.
;; Otherwise, since X is between MIN and MAX, it should return x.
;; (CONSTRAIN 3 -50 50) should return 3.
;; (CONSTRAIN 92 -50 50) should return 50
;; Write one version using COND and another using nested IFS.

(defun constrain (x max min)
  (cond ((< min x) min)
        ((> max x) max)
        (t x)))

(defun constrain (x max min)
  (if (< x min) min
      (if (> x max) max
          x)))

(constrain 3 -50 50) ;; => 3
(constrain 92 -50 50) ;; => 50

;; 4.11 Write a function FIRSTZERO that takes a list of three numbers as input and returns a word
;; (one of "first", "second", "third", or "none") indicating where the first zero appears in the list.
;; Example: (FIRSTZERO '(3 0 4)) should return SECOND.
;; What happens if you try to call FIRSTZERO with three separate numbers instead of a list of three numbers, as in (FIRSTZERO 3 0 4)? => wrong number of arguments

(defun firstzero (list-numbers)
  (cond ((equal (car list-numbers) 0) 'FIRST)
        ((equal (cadr list-numbers) 0) 'SECOND)
        ((equal (caddr list-numbers) 0) 'THIRD)
        (t 'NONE)))

(defun firstzero (x)
  (cond ((zerop (first x)) 'first)
        ((zerop (second x)) 'second)
        ((zerop (third x)) 'third)
        (t 'none)))

(firstzero '(3 0 4)) ;; => SECOND
(firstzero '(0 1 2)) ;; => FIRST
(firstzero '(1 2 0)) ;; => THIRD
(firstzero '(1 2 3)) ;; => NONE


;; 4.12 Write a function CYCLE that cyclically counts from 1 to 99. CYCLE
;; called with an input of 1 should return 2, with an input of 2 should
;; return 3, with an input of 3 should return 4, and so on. With an input of
;; 99, CYCLE should return 1. That’s the cyclical part. Do not try to
 ;; solve this with 99 COND clauses!

(defun cycle (n)
  (cond ((equal n 99) 1)
        (t (+ n 1))))

;; 4.13 Write a function HOWCOMPUTE that is the inverse of the COMPUTE
;; function described previously. HOWCOMPUTE takes three numbers
;; as input and figures out what operation would produce the third from
;; the first two. (HOWCOMPUTE 3 4 7) should return SUM-OF.
;; (HOWCOMPUTE 3 4 12) should return PRODUCT-OF.
;; HOWCOMPUTE should return the list (BEATS ME) if it can’t find a
;; relationship between the first two inputs and the third. Suggest some
;; ways to extend HOWCOMPUTE.

(defun howcompute (x y z)
  (cond ((equal z (+ x y)) 'sum-of)
        ((equal z (* x y)) 'product-of)
        (t '(beats me))))

(howcompute 3 4 7) ;; => sum-of
(howcompute 3 4 12) ;; => product-of
(howcompute 1 2 4) ;; => (beats me)


;; 4.15 Write a predicate called GEQ that returns T if its first input is greater than or equal to its second input.

(defun geq (x y)
  (or (> x y) (equal x y)))

(geq 5 6) ;; => T
(geq 5 5) ;; => T
(geq 4 7) ;; => NIL


;; 4.16 Write a function that squares a number if it is odd and positive, doubles it if it is odd an negative, and otherwise divides the number by 2.

(defun operations (n)
  (cond ((and (> n 0) (oddp n)) (* n n))
        ((and (< n 0) (oddp n)) (+ n n))
        (t (/ n 2))))

(operations 3) ;; => 9
(operations -7) ;; => -14
(operations 4) ;; => 2


;; 4.17 Write a predicate that returns T if the first input is either BOY or GIRL
;; and the second input is CHILD, or the first input is either MAN or WOMAN and the second input is ADULT.

(defun child-or-adult (person old)
  (or (and (or (equal person 'boy)
               (equal person 'girl))
           (equal old 'child))
  (and (or (equal person 'man)
           (equal person 'woman))
       (equal old 'adult))))

(child-or-adult 'boy 'child) ;; => T
(child-or-adult 'woman 'adult) ;; => T
(child-or-adult 'boy 'adult) ;; => NIL


;; 4.18 Write a function to act as referee in the Rock-Scissors-Paper game. In
;; this game, each player picks one of Rock, Scissors, or Paper, and then
;; both players tell what they picked. Rock ‘‘breaks’’ Scissors, so if the
;; first player picks Rock and the second picks Scissors, the first player
;; wins. Scissors ‘‘cuts’’ Paper, and Paper ‘‘covers’’ Rock. If both
;; players pick the same thing, it’s a tie. The function PLAY should take
;; two inputs, each of which is either ROCK, SCISSORS, or PAPER, and
;; return one of the symbols FIRST-WINS, SECOND-WINS, or TIE.
;; Examples: (PLAY ’ROCK ’SCISSORS) should return FIRST-WINS.
;; (PLAY ’PAPER ’SCISSORS) should return SECOND-WINS.

(defun rock-scissors-paper (x y)
  (cond ((equal x y) 'tie)
        ((or (and (equal x 'rock)
                  (equal y 'scissors))
             (and (equal x 'scissors)
                  (equal y 'paper))
             (and (equal x 'paper)
                  (equal y 'rock)))
         'first-wins)
        (t 'second-wins)))

(rock-scissors-paper 'rock 'scissors) ;; => first-wins
(rock-scissors-paper 'paper 'scissors) ;; => second-wins
(rock-scissors-paper 'paper 'paper) ;; => tie



;; 4.19. Show how to write the expression (AND X Y Z W) using COND
;; instead of AND. Then show how to write it using nested IFs instead of AND.

(cond ((not x) nil)
      ((not y) nil)
      ((not z) nil)
      (t w))

(if x
    (if y
        (if z w)))


;; 4.20. Write a version of the COMPARE function using IF instead of COND.
;; Also write a version using AND and OR.

(defun compare (x y)
  (if (equal x y)
      'numbers-are-the-same
      (if (< x y)
          'first-is-smaller
          'first-is-bigger)))

(compare 2 3) ;; => first-is-smaller
(compare 3 3) ;; => numbers-are-the-same
(compare 7 5) ;; => first-is-bigger

(defun compare (x y)
  (or (and (equal x y) 'numbers-are-the-same)
      (and (< x y) 'first-is-smaller)
      'first-is-bigger))

(compare 2 3) ;; => first-is-smaller
(compare 3 3) ;; => numbers-are-the-same
(compare 7 5) ;; => first-is-bigger


;; 4.21. Write versions of the GTEST function using IF and COND

(defun gtest (x y)
  (if (> x y) t
      (if (zerop x) t
          (zerop y))))

(gtest 3 2) ;; => T
(gtest 0 1) ;; => T

(defun gtest (x y)
  (cond ((> x y) t)
        (( zerop x) t)
        (t (zerop y))))


(gtest 1 2) ;; => nil
(gtest 2 1) ;; => T


;; 4.22. Use COND to write a predicate BOILINGP that takes two inputs,
;; TEMP and SCALE, and returns T if the temperature is above the
;; boiling point of water on the specified scale. If the scale is
;; FAHRENHEIT, the boiling point is 212 degrees; if CELSIUS, the
;; boiling point is 100 degrees. Also write versions using IF and
;; AND/OR instead of COND.

(defun boilingp (temp scale)
  (cond ((equal scale 'fahrenheit) (> temp 212))
        ((equal scale 'celsius) (> temp 100))))

(defun boilingp (temp scale)
  (if (equal scale 'fahrenheit) (> temp 212)
      (if (equal scale 'celsius) (> temp 100))))

(defun bolingp (temp scale)
  (or (and (equal scale 'fahrenheit) (> temp 212))
      (and (equal scale 'celsius) (> temp 100))))

(boilingp 101 'celsius) ;; => T
(boilingp 99 'celsius) ;; => nil
(boilingp 213 'fahrenheit) ;; => T
(boilingp 211 'fahrenheit) ;; => nil


;; 4.29. Write versions of LOGICAL-AND using IF and COND instead of AND.

(defun logical-and (x y)
  (if x
      (if y t)))

(defun logical-and (x y)
  (cond (x (cond (y t)))))


;; 4.30. Write LOGICAL-OR. Make sure it returns only T or NIL for its result.

(defun logical-or (x y)
  (if x t
      (if y t)))

(defun logical-or (x y)
  (cond (x t)
        (y t)
        (t nil)))


;; 4.35. Write down the DeMorgan equations for the three-input versions of AND and OR

(defun demorgan-and (x y z)
  (not (or (not x) (not y) (not z))))

(defun demorgan-or (x y z)
  (not (and (not x) (not y) (not z))))
