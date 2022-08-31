; simple function definition
(defun add (a b)
  (print (+ a b)))

; call directly
(add 2 3)

; anonymous funcall
(funcall #'add 6 -3.5)

; anonymous apply
(apply #'add (list -5 6.666))

; multiple value return function
(defun many (n)
  (values n (* n 2) (/ n 3)))

; test multiple return values
(multiple-value-list (many 3))

; bind one special return value
(multiple-value-bind (v0 v1 v2)
  (many 3)
(list v0 v1 v2))

