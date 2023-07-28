(defun sum (throw)
    (+ (car throw) (cdr throw)))

(defun 1_roll()
    (+ (random 6) 1))

(defun roll()
    (cons (1_roll) (1_roll)))

(defun reroll_d (sum_count)
    (or (= sum_count 2) (= sum_count 12)))

(defun win_d (sum_count)
    (or (= sum_count 7) (= sum_count 11)))



(defun turn (&aux (dices (roll)))
    (terpri)
    (princ "Rolled:")
    (princ dices)

    (cond 
        ((win_d (sum dices)) Nil)
        ((not (reroll_d (sum dices))) (sum dices))
        (T (turn))
    )
)

(defun second_turn (roll1 &aux (roll2 (turn)))
    (terpri)
    (princ "Second player's turn ended")
    (terpri)
    (terpri)

    (if roll2
        (cond
            ((> roll1 roll2) "First player wins!")
            ((= roll1 roll2) "Draw!")
            (T "Second player wins!")
        )
        "Second player wins!"
    )
)

(defun game (&aux (roll1 (turn)))
    (terpri)
    (princ "First player's turn ended")
    (terpri)
    (if roll1
        (second_turn roll1)
        "First player wins!"
    )
)

(defun w(x res)
    (
        cond
        ((cdr x) (w (cdr x) (cons (car x) res)))
        (T (reverse res))
    )
)