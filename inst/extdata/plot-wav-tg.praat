form Select data
  comment Set path to wav audio file and TextGrid:
  sentence wav ~/
  sentence tg ~/
  sentence file plot.png
  positive width 5
  positive height 3
  sentence pitch FALSE
endform

wav = Read from file: wav$

if tg$ != "FALSE"
  tg = Read from file: tg$
endif

selectObject: wav
wav_end = Get end time
sp = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
selectObject: wav
pitch_obj = To Pitch: 0, 75, 600

Erase all

start = 0
end = wav_end

if tg$ != "FALSE"
  selectObject: tg
  tg_tiers = Get number of tiers
  height = 3 + 0.5 * (tg_tiers)
endif

10
Helvetica

Select inner viewport: 1, width, 1.5, 3

selectObject: sp
Paint: start, end, 0, 0, 100, "no", 70, 6, 0, "no"
Draw inner box

if pitch$ != "FALSE"
  Select inner viewport: 1, width, 3, 3.5

  selectObject: pitch_obj
  Line width: 3
  Draw: 0, 0, 0, 500, "no"
  Line width: 1
endif

Select inner viewport: 1, width, 1.5, 3.5

Draw inner box

if tg$ != "FALSE"
  Select inner viewport: 1, width, 1, height
  selectObject: tg
  Draw: start, end, "yes", "yes", "no"
endif

Select inner viewport: 1, width, 1, 1.5

selectObject: wav
Draw: start, end, 0, 0, "no", "Curve"

Select inner viewport: 1, width, 1.5, 3.5

Axes: start, end, 0, 5000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Freq. (Hz)"

Select inner viewport: 1, width, 1, height + 0.5

Draw inner box
Marks bottom every: 1, 0.25, "yes", "yes", "no"
Text bottom: "yes", "Time (s)"

Select outer viewport: 0.5, width + 0.5, 0.75, height + 1
Save as 600-dpi PNG file: file$
