; Defining variables
(let ((str "Hello, world!"))
  (print str))

; Defining and operating on variables
(let ((str "Goodbye, world!"))
  (string-upcase str)
  (print str))

; Defining multiple variables
(let ((x 1)
      (y 5))
  (+ x y)
  (print x))

; Variables with initial values dependant on other vars
(let* ((x 1)
       (y (+ x 1)))
  y
  (print y))

#|----------------------
    Dynamic variables
 (kinda like global vars)
------------------------|#

; defparameter requires an initial value, defvar doesn't
; defparameter values are changed after code reload, defvar isn't 

; Defining parameters
(defparameter salute "Hello, world, again!")
(defvar sayonara "I'm done!")
(print salute)
(print sayonara)

; Changing the values temporally
(let ((salute "Oh no"))
  (print salute))
(let ((sayonara "Not anymore"))
  (print sayonara))

; Printing the final values
(print salute)
(print sayonara)

