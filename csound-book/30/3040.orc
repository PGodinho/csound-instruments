;---------------------------------------------------------------------------
; MIKELSON'S MULTI-FX SYSTEM
;---------------------------------------------------------------------------
; 3002. PLUCK
; 3040. STEREO DELAY
; 3099. MIX
;---------------------------------------------------------------------------
  sr        =  44100
  kr        =  4410
  ksmps     =  10
  nchnls    =  2
;---------------------------------------------------------------------------
            zakinit   30, 30
;---------------------------------------------------------------------------
; SOUND SOURCE
;---------------------------------------------------------------------------
; PLUCK PHYSICAL MODEL
;---------------------------------------------------------------------------
instr   3002
  iamp      =  p4                                 ; AMPLITUDE
  ifqc      =  cpspch(p5)                         ; CONVERT TO FREQUENCY
  itab1     =  p6                                 ; INITIAL TABLE
  imeth     =  p7                                 ; DECAY METHOD
  ioutch    =  p8                                 ; OUTPUT CHANNEL
  kamp      linseg    0, .002, iamp, p3-.004, iamp, .002, 0 ; DECLICK
  aplk      pluck     kamp, ifqc, ifqc, itab1, imeth ; PLUCK WAVEGUIDE MODEL
            zawm      aplk, ioutch                ; WRITE TO OUTPUT
  gifqc     =  ifqc
endin
;---------------------------------------------------------------------------
; DELAY
;---------------------------------------------------------------------------
instr   3040
  itim1     =  p4
  ifdbk1    =  p5
  ixfdbk1   =  p6
  itim2     =  p7
  ifdbk2    =  p8
  ixfdbk2   =  p9
  izinl     =  p10
  izinr     =  p11
  izoutl    =  p12
  izoutr    =  p13
  aoutl     init      0
  aoutr     init      0
  asigl     zar       izinl
  asigr     zar       izinr                               
  aoutl     delayr    itim1
            delayw    asigl+ifdbk1*aoutl+ixfdbk1*aoutr ; SUM DELAYED SIGNAL WITH ORIGINAL                                                   
  aoutr     delayr    itim2                       ; AND ADD CROSS-FEEDBACK SIGNAL.
            delayw    asigr+ifdbk2*aoutr+ixfdbk2*aoutl
            zaw       aoutl, izoutl
            zaw       aoutr, izoutr
endin
;---------------------------------------------------------------------------
; MIXER SECTION
;---------------------------------------------------------------------------
instr   3099    
  asig1     zar       p4                          ; p4 = ch1 IN
  igl1      init      p5*p6                       ; p5 = ch1 GAIN
  igr1      init      p5*(1-p6)                   ; p6 = ch1 PAN
  asig2     zar       p7                          ; p7 = ch2 IN
  igl2      init      p8*p9                       ; p8 = ch2 GAIN
  igr2      init      p8*(1-p9)                   ; p9 = ch2 PAN
  asig3     zar       p10                         ; p10 = ch3 IN
  igl3      init      p11*p12                     ; p11 = ch3 GAIN
  igr3      init      p11*(1-p12)                 ; p12 = ch3 PAN
  asig4     zar       p13                         ; p13 = ch4 IN
  igl4      init      p14*p15                     ; p14 = ch4 GAIN
  igr4      init      p14*(1-p15)                 ; p15 = ch4 PAN
  asigl     =  asig1*igl1+asig2*igl2+asig3*igl3+asig4*igl4 
  asigr     =  asig1*igr1+asig2*igr2+asig3*igr3+asig4*igr4 
            outs      asigl, asigr    
            zacl      0, 30   
endin
