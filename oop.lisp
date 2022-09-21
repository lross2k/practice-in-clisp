;; lisp has generic functions with methods that can allow for different behaivours, this means
;; functions have generics and abstraction integrated, nice

;; Generic function definition
(defgeneric description (object)
  (:documentation "Return a description of an object."))

;; Defining methods for the generic function
(defmethod description ((object integer))
  (format nil "The integer ~D" object))

(defmethod description ((object float))
  (format nil "The float ~3,3f" object))

;; Trying the different methods of the generic function
(print (description 10))
(print (description 3.14))

;; Classes
;; Superclass
(defclass vehicle ()
  ((speed :accessor vehicle-speed
          :initarg :speed
          :type real
          :documentation "The vehicle's current speed."))
  (:documentation "The base class of vehicles."))

;; Actual classes
(defclass bicycle (vehicle)
  ((mass :reader bicycle-mass
         :initarg :mass
         :type real
         :documentation "The bike's mass."))
  (:documentation "A bicycle."))

(defclass canoe (vehicle)
  ((rowers :reader canoe-rowers
           :initarg :rowers
           :initform 0
           :type (integer 0)
           :documentation "The number of rowers."))
  (:documentation "A canoe."))

;; Instantiation
(defparameter canoe (make-instance 'canoe
                                   :speed 10
                                   :rowers 6))
(print (canoe-rowers canoe))
;(print (canoe-speed canoe)) ;; Can't acces it like this because it's from the superclass
(print (vehicle-speed canoe))

;; Show information of a class with describe
(describe 'canoe)

