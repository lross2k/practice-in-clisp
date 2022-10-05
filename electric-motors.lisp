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

; one 30 HP induction motor with coil rotor branch and capacitors
(print "230V, coil rotor, 30HP")
(print "FLA = 80A")
; 86% efficiency means there is another value for input power
(defvar p-30 (* (/ 30 0.86) 746))
(print "real input kW")
(print p-30)
; I = P / (sqrt3 V FP)
(defvar i-30 (/ p-30 (* (sqrt 3) (* 230 0.85))))
(print "real input A")
(print i-30)

(print "")

; two 40 HP syncronic motors
(print "230V, syncronic motor, 40HP")
(print "FLA = 83A")
(print "two motors, so the source conductor has")
(defvar i-40 (+ (* 83 1.25) 83))
(print "source conductor A")
(print i-40)

(print "")

; four 15 HP squirrel cage induction motors
(print "230V, squirrel cage rotor motor, 15HP")
(print "FLA = 42A")
(print "four motors, only three active, so the source conductor has")
(defvar i-15 (+ (* 42 1.25) (* 2 83)))
(print "source conductor A")
(print i-15)

(print "")

; 53 kW installed load, DF max 0,85 with PF 1, not continous load
(defvar i-load (* (/ 53e3 (* 230 (* (sqrt 3) 1))) 0.85))
(print "FLA for 53 kW load")
(print i-load)

(print "")

; whole system's source conductor
(defvar i-system (+ (+ (* i-15 1.25) (+ i-40 i-30)) i-load))
(print "general feed conductor A")
(print i-system)

(print "")

; AWG conductor for the system in aluminum, 2 by phase of 38 meters
(print "half of the current would be in each conductor")
(print (/ i-system 2))
(print "applying 0,94 factor due to 33ºC")
(print (/ (/ i-system 0.94) 2))
(print "and 2 by phase for a tri-phasic system 4 threads means 6 ")
(print "current conductors, which has an 80% factor due to proximity")
(print (/ (/ (/ i-system 0.8) 0.94) 2))
(print "in aluminum would be AWG #1000 MCM which can whitstand 445 A @ 75ºC")

(print "")

; Breaker for the main feed conductor
(print "using 150% for the 30 HP motor")
(print (* i-30 1.5))
(print "110 A breaker")
(print "using 250% for the 40 HP motors")
(print (* i-40 2.5))
(print "450 A breaker")
(print "using 800% for 15 HP motors")
(print (* i-15 8.0))
(print "1600 A breaker")
(print "The static load branch had and amperage of:") 
(print i-load)
(print "110 A breaker")
(print "")
(print "Therfore, the current for the whole system is")
(print (+ 1600 (+ i-30 (+ i-40 i-load))))
(print "1600 A breaker for the whole system") ; 240.6(A)

