;; Write a file with random numbers
(with-open-file (stream (merge-pathnames #p"data.txt"
                                         (user-homedir-pathname))
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
  (dotimes (i 100)
    (format stream "~3,3f~%" (random 100))))

;; Read the content of the file
;(uiop:read-file-string (merge-pathnames #p"data.txt"
;                                        (user-homedir-pathname)))

