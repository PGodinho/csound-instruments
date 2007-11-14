;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;COPYRIGHT 1998 PAUL M. WINKLER, ZARMZARM@EROLS.COM
;****++++
;**** LAST MODIFIED: WED DEC  9 20:34:05 1998
;****----
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

f1 0  512  -7   30000 256 30000 0 -30000 256 -30000 ;square wave, !normalized

;  AT DUR PCH    WIDTH     

t 0 180
i1 0  1   6.00   100
i. +  .5  6.02   100
i. .  .    .     50
i. .  .   6.03   50 
i. .  .   6.00   10 
i. .  .   6.01   10  
i. .  .   6.10   10
i. .  .   7.10   20   
i. .  .   7.08   .
i. .  .   7.07   40
i. .  .   6.07   .
i. .  .   5.07   60
i. .  .   4.07   .
i. .  .   5.07   80
i. .  .   4.07   . 
i. .  .   5.07   100 
i. .  .   4.07    >
i. .  2   5.07   30

s
t 0 120
i2 1 3   5.00
i2 + 3   5.11
i2 . 3   6.10
i2 . 3   7.09
i2 . 3   8.08
i2 . 3   9.07
i2 . 3   10.06
i2 . 3   11.05     ; QUITE BAD ALIASING THERE!