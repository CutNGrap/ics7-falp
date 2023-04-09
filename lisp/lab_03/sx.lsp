(defun hv (a b c &aux (D (- (* b b) (* 4 a c))))
    (and 
        (>= D 0) 
        (cons 
            (/ (- (sqrt d) b) 2 a)
            (/ (- 0 (sqrt d) b) 2 a)
        )
    )
)