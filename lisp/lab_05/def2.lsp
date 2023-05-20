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

(matmul '((7 4 9) (8 1 5) (8 1 5))  '((7 4 9) (8 1 5) (8 1 5)))