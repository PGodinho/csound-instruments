  sr        =  48000
  ksmps     =  32
  nchnls    =  2

#include "base_macros.h.orc"
#include "spat.h.orc"
#include "uhjmacros.h.orc"
#include "fgen.h.orc"

; window for osc 2 and 3
  itmp      ftgen     2, 0, 16384, 20, 3, 1
; osc 1 waveform
  itmp      ftgen     384, 0, 16384, 7, 1, 16384, -1
  itmp      ftgen     385, 0, 4096, -31, 384, 1, 1.0, 0.0, 1, -1.0, 0.8, 2, 2.0, 0.0
$FGEN_128(l1'384'4096'385'1'sr/2)
; LFO waveform for triangle distribution
  itmp      ftgen     4, 0, 256, 7,  0, 16, 0.134, 16, 0.293, 16, 0.5, 16, 1, 16, 0.5, 16, 0.293, 16, 0.134, 16, 0, 16, -0.134, 16, -0.293, 16, -0.5, 16, -1, 16, -0.5, 16, -0.293, 16, -0.134, 16, 0
; sawtooth wave
  itmp      ftgen     257, 0, 16384, 7, 1, 16384, -1
$FGEN_128(l2'256'4096'257'1'sr/2)

instr 1

$S_NOTEPARM(0.2'0.1)

  iamp      =  iamp * 700.0                       ; output volume

; envelopes

  aamp1     linseg    0, 0.005, 1, 1, 1           ; osc 1 attack
  aamp1d    expseg    4, 0.5, 1, 1, 1             ; osc 1 decay
  aamp2     expseg    1, 0.05, 0.001, 1, 0.001    ; osc 2 + 3 decay 1
  aamp2     =  aamp2 + 1
  aamp3     expseg    1, 0.05, 0.001, 1, 0.001    ; osc 2 + 3 decay 2
  aamp3     =  aamp3 + 1

  kcps      =  icps                               ; osc 1, 2 frequency
  kcps2     =  kcps * 2.0                         ; osc 3 frequency
  iovrlp    =  16                                 ; osc 2, 3 overlap
$CPS2FNUM(kfnum'kcps'256)       ; table numbers
$CPS2FNUM(kfnum1'kcps'384)
$CPS2FNUM(kfnum2'kcps2'256)

#define OSCILLATOR #

; osc 1

  kl1minf   =  0.01 * kcps                        ; LFO min. frequency
  kl1maxf   =  0.02 * kcps                        ; LFO max. frequency

  a1        oscbnk    kcps, 0.0, kcps * 0.02, 0.0, 8, 0, kl1minf, kl1maxf, 0.0, 0.0, 128, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1, kfnum1, 4, 0, 0, 0, 0

; osc 2

  kwsiz     =  2.0 / kcps                         ; grain duration
  kdens     =  iovrlp / kwsiz                     ; density
  a2        grain3    kcps, 0.5, kcps * 0.02, 0.5, kwsiz, kdens, iovrlp + 1, kfnum, 2, -0.5, 0, 0, 18

; osc 3

  kwsiz     =  4.0 / kcps2                        ; grain duration
  kdens     =  iovrlp / kwsiz                     ; density
  a3        grain3    kcps2, 0.5, kcps2 * 0.02, 0.5, kwsiz, kdens, iovrlp + 1, kfnum2, 2, -0.5, 0, 0, 18

; filters

  a1        butterlp  a1 * aamp1d, 7000           ; osc 1 lowpass

  a2        =  a2 * 0.7 + a3 * 1.4                ; mix osc 2 and osc 3,
  a2x       butterhp  a2, 3000                    ; and boost high freq.
  a2        =  a2 * 0.33 * aamp2 + a2x

  a0        =  a1 * aamp1 + a2 * 0.5 * aamp3

  a0x       butterbp  a0, 10000, 4000             ; output filters
  a0        =  a0 + a0x
  a0        tone      a0, 12000
  a0        pareq     a0, 14000, 0, 1.2, 2

  a0        =  a0 * (aenv * aenv) * iamp          ; output: a0

#

/* LEFT channel */

$OSCILLATOR
$SPAT2(a0'-45'2)

/* RIGHT channel */

$OSCILLATOR
$SPAT2(a0'45'2)

endin

/* ------ output instrument ------ */

$OUT3CH(90'"voice_10.pcm")

