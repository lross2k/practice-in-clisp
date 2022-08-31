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

