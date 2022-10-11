#|
- 230V / 4H
- inverse time automatic breakers except for 15 HP motors which have instantaneous breaker
- service factor of 1,1
- star connection 208V
- one of the 4 15 HP motors is used as a backup, in case one of the other 3 fails
- average temperature of 33ºC
- 53kW load corresponds to illumination distributed charges in a triphasic system
- motors work continously with a PF of 0,85
- induction motor with coil rotor has an efficiency of 86% at nominal demand

1. Current from the system source conductor
2. AWG conductor in aluminum of the source conductor of a 2 by phase EMT duct of 38 meters
3. Breaker of the principal box that protects the source conductor
|#

(defun apply-temp-correction (current)
  (if (> current 99)
    (/ current 0.94)
    (/ current 0.91)))

; one 30 HP induction motor with coil rotor branch and capacitors
(princ "230V, coil rotor, 30HP") (terpri)
; 86% efficiency means there is another value for input power
; I = P / (sqrt3 V FP)
(defvar i-30 (/ (* (/ 30 0.86) 746) (* (sqrt 3) (* 230 0.85))))
(defvar i-30-temp (apply-temp-correction i-30))
(princ "I_30 = ")
(write i-30)
(princ " A")

(terpri)
(terpri)

; two 40 HP syncronic motors
(princ "230V, syncronic motor, 40HP") (terpri)
(princ "I_40 = ")
(defvar i-40 (* 83 (/ 1 0.85)))
(defvar i-40-temp (apply-temp-correction i-40))
(write i-40)
(princ " A")
 
(terpri)
(terpri)

; four 15 HP squirrel cage induction motors
(princ "230V, squirrel cage rotor motor, 15HP") (terpri)
(princ "I_15 = ")
(defparameter i-15 42)
(defparameter i-15-temp (apply-temp-correction i-15))
(write i-15)
(princ " A")

(terpri)
(terpri)

; 53 kW installed load, DF max 0,85 with PF 1, not continous load
(princ "53 kW luminic load") (terpri)
(defvar i-load (* (/ 53e3 (* 230 (* (sqrt 3) 1))) 0.85))
(defvar i-load-temp (apply-temp-correction i-load))
(princ "I_load = ")
(write i-load)
(princ " A")

(terpri)
(terpri)

; whole system's source conductor
(defvar i-system (+ (* (+ i-40 i-load) 1.25) (+ i-40 (+ i-30 (* 3 i-15)))))
(princ "Feeder current without temperature correction: ")
(write i-system)
(princ " A") (terpri)
(defvar i-system-temp (+ (* (+ i-40-temp i-load-temp) 1.25) (+ i-40-temp (+ i-30-temp (* 3 i-15-temp)))))
(princ "Feeder current with temperature correction: ")
(write i-system-temp)
(princ " A")

(terpri)

; AWG conductor for the system in copper, 1 by phase in cable trays
(princ "Copper AWG #500 MCM which can whitstand 620 A @ 75ºC") ; NEC 310.15(B)(17)

(terpri)
(terpri)

; Copper conductors for each motor derivation
(princ "125% because of 430.22(A)") (terpri)

(princ "230V, coil rotor, 30HP") (terpri)
(princ "I_30 = ") (write (apply-temp-correction (* i-30 1.25))) (princ " A") (terpri)
(princ "Copper AWG #4 which can whitstand 125 A @75ºC") (terpri)

(princ "230V, syncronic motor, 40HP") (terpri)
(princ "I_40 = ") (write (apply-temp-correction (* i-40 1.25))) (princ " A") (terpri)
(princ "Copper AWG #3 which can whitstand 145 A @75ºC, but it isn't available in Costa Rica") (terpri)
(princ "therefore Copper AWG #2 which can whitstand 170 A @75ºC") (terpri)

(princ "230V, squirrel cage rotor motor, 15HP") (terpri)
(princ "I_15 = ") (write (apply-temp-correction (* i-15 1.25))) (princ " A") (terpri)
(princ "Copper AWG #8 which can whitstand 60 A @60ºC")

(princ "static load") (terpri)
(princ "I_load = ") (write (apply-temp-correction (* i-load 1.25))) (princ " A") (terpri)
(princ "Copper AWG #2 which can whitstand 170 A @75ºC")

(terpri)
(terpri)

; Breaker for the main branch
(princ "150% for the 30 HP motor: ") (write (* i-30 1.5)) (princ " A") (terpri)
(princ "110 A breaker") (terpri)
(princ "250% for the 40 HP motors: ") (write (* i-40 2.5)) (princ " A") (terpri)
(princ "225 A breaker") (terpri)
(princ "800% for 15 HP motors: ") (write (* i-15 8.0)) (princ " A") (terpri)
(princ "300 A breaker") (terpri)
(princ "ilumination loads: ") (write i-load) (princ " A")

(terpri)
(terpri)

(princ "Therefore, the current for main branch is: ")
(write (+ 300 (+ i-30 (+ (* i-40 2) (+ (* i-15 2) i-load))))) (princ " A") (terpri)
(princ "700 A breaker for the main branch") ; 240.6(A)

(terpri)

