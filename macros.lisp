;; Simple while loop as you can clearly see
(let ((i 0))
 (loop while (< i 3) do
       (progn (incf i)))
 (print i)
)

;; Handy macro to make the while loop more C like
(defmacro while (condition &body body)
  `(loop while ,condition do (progn ,@body)))

;; Same while loop from the beginning, less lisp-y
(let ((i 0))
 (while (< i 3)
    (incf i))
 (print i)
)

