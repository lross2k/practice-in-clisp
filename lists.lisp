; Saving a list to a variable
(defparameter list1 (list 1 2 3 4 5 6 7 8 9 10))

; Accessing the list in different ways
(print list1)
(print (first list1))
(print (tenth list1))

; Changing a value in the list
(setf (third list1) 11)
(print list1)
(setf (nth 9 list1) -1.102831)
(print list1)
(setf (nth 2 list1) "a")
(print list1)

; Simple function to test map
(defun map_test (n)
  (print (/ n 2)))

; Using map for simple addition
(mapcar #'map_test (list 1 2 3 4 5))

; Using reduce function
(print (reduce #'- (list 1 3 5 7 9 11)))

; Using the standard sort function
(print (sort (list 9 2 6 2 9 1 8 4 5) #'<))

; Destructuring list
(destructuring-bind (first third &rest all)
         (list 1 2 3 4 5 6 7)
         (print first)
         (print third)
         (print all))

