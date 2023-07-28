(defun getrow(n matrix)
    (nth n matrix)
)

(defun _getcol(n mat res)
  (cond
    ((null mat) res)
    (T (_getcol n (cdr mat) (cons (nth n (car mat)) res)))
  )
)

(defun getcol(n matrix)
  (reverse (_getcol n matrix ()))
)

(defun rowXcol(row col) 
  ( apply #'+ 0 (mapcar #'* row col) )
)

(defun _rowXmatrix(row matrix matlen res counter) 
  (cond
    ((= matlen counter) res)
    (T 
      (_rowXmatrix 
        row 
        matrix 
        matlen
        (cons (rowXcol row (getcol (- matlen counter 1) matrix)) res)
        (+ 1 counter)
      )
    )
  )
)

(defun rowXmatrix(row matrix matlen) 
  (_rowXmatrix row matrix matlen () 0))

(defun matrixmul(mat1 mat2 res n) 
  (cond 
    ((= n 0) res)
    (T 
      (matrixmul 
        mat1 
        mat2 
        (cons 
          (rowXmatrix (getrow (- (length mat1) n) mat1) mat2 (length mat2)) 
          res
        )
        (- n 1)
      )
    )
  ))

(defun matmul (mat1 mat2) 
  (reverse
    (matrixmul mat1 mat2 () (length mat1))
  ))

(matmul '((7 4 9) (8 1 5) (8 1 5))  '((7 4 9) (8 1 5) (8 1 5)))

(matmul '((1 0 0) (0 1 0) (0 0 1)) '((1 2 3) (4 5 6) (7 8 9)))


(defun rowXcol(row col) 
  ( apply #'+ 0 (mapcar #'* row col) )
)

(defun rowXmatrix(row matrix) 
  (mapcar #'(lambda (mat_col)
        (rowXcol row mat_col)
      ) (transpose matrix)
  )
)

(defun matmul (mat1 mat2)
 (
    mapcar #'(lambda (row1)
        (rowXmatrix row1 mat2)
        ) mat1
  )
)

(defun transpose (matrix)
    (apply #'mapcar #'list matrix)
)