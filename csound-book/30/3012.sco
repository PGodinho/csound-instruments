;---------------------------------------------------------------------------
; DE-ESSER
;---------------------------------------------------------------------------
i 3002 0.0    1.6    16000  7.00   0      1      1    
i 3002 0.2    1.4    12000  7.05   .      .      .    
i 3002 0.4    1.2    10400  8.00   .      .      .    
i 3002 0.6    1.0    12000  8.05   .      .      .    
i 3002 0.8    0.8    16000  7.00   .      .      .    
i 3002 1.0    0.6    12000  7.05   .      .      .    
i 3002 1.2    0.4    10400  8.00   .      .      .    
i 3002 1.4    0.2    12000  8.05   .      .      .    

; DE-ESSER CURVE
f 6 0 1025  7     1     128   .5    128   .3    256   .2    256   .1    257   .01

; DE-ESSER
;    STA  DUR  RMSTIME  DELTIME  TABLE  FREQUENCY  POSTGAIN  INCH  OUTCH
i 3012 0      1.6    .02    .01    6      5000   1      1      2    

; MIXER
;      STA DUR  CH1  GAIN  PAN  CH2  GAIN  PAN  CH3  GAIN  PAN  CH4  GAIN  PAN
i 3099 0      2      2      1      1      2      1      0      6      0      1      7      0      0    
s
f0  1
s
;---------------------------------------------------------------------------
; PLAIN PLUCK
;---------------------------------------------------------------------------
;   STA  DUR  AMP   FQC   FUNC  METH  OUTCH
i 3002 0.0    1.6    16000  7.00   0      1      1    
i 3002 0.2    1.4    12000  7.05   .      .      .    
i 3002 0.4    1.2    10400  8.00   .      .      .    
i 3002 0.6    1.0    12000  8.05   .      .      .    
i 3002 0.8    0.8    16000  7.00   .      .      .    
i 3002 1.0    0.6    12000  7.05   .      .      .    
i 3002 1.2    0.4    10400  8.00   .      .      .    
i 3002 1.4    0.2    12000  8.05   .      .      .    

; MIXER
;     STA DUR  CH1  GAIN  PAN  CH2  GAIN  PAN  CH3  GAIN  PAN  CH4  GAIN  PAN
i 3099 0      2      1      1      1      1      1      0      3      0      1      4      0      0    


