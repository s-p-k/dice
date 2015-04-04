;;;; See LICENSE file for details.
;;;; A small dice game I wrote for fun.


;; get a random element from a list

(define (random-element lst)
  (list-ref lst (random (length lst))))

;; quotes that the player sees after the game finishes

(define lose-quotes
  (list "Better luck next time."
	"Try Pokemon next time."
	"Born to lose, live to win."
	"Can't you even win on a single dice game?"))

(define win-quotes
  (list "Bingo!"
	"Good game bro."
	"Try poker next time."
	"Dice from the paradise."
	"The probability of the impossible."))

;; check if dice result is valid

(define valid-result?
  (lambda (n)
    (if (eq? n 0) #f #t)))

;; compare dice result

(define compare-results
  (lambda (n1 n2)
    (cond ((eq? n1 n2) (format #t "It's a draw.~%~A~%"
			       (random-element lose-quotes)))
	  ((> n1 n2) (format #t "Computer wins.~%~A~%"
			     (random-element lose-quotes)))
	  (else (format #t "Player wins.~%~A~%"
			(random-element win-quotes))))))

;; roll the dice for a player

(define roll-dice-for-player
  (lambda (player)
    (let ((res (random 7)))
      (if (valid-result? res) (cons res player)
	   (roll-dice-for-player player)))))

;; what the user actully uses. 
;; use (roll-dice) to play with opponent your computer.

(define roll-dice
  (lambda ()
    (let ((computer (roll-dice-for-player 'computer))
	  (player (roll-dice-for-player 'player)))
      (format #t "Computer got: ~A\nPlayer got: ~A\n"
	      (car computer) (car player))
      (compare-results (car computer) (car player)))))
