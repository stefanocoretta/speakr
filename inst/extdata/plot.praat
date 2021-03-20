form Select data
  comment Set path to wav audio file and TextGrid:
  sentence file plot.png
  sentence wav ~/
  sentence tg ~/
  real start 0
  real end 0
  positive width 5
  sentence format png
  sentence pitch FALSE
  real pitch_min 0
  real pitch_max 500
endform

win_width = width - (0.7 * 2)
win_height = 2
wav_height = 0.5
sp_height = 1.5

# Read files ########################################################

wav = Read from file: wav$

if end == 0
  end = Get end time
endif

if pitch$ != "FALSE"
  pitch_height = 0.25
  sp_height = sp_height - 0.25
else
  pitch_height = 0
endif

if tg$ != "FALSE"
  tg = Read from file: tg$
  tg_tiers = Get number of tiers
  tg_height = win_height + (0.5 * tg_tiers)
endif

# To objects ########################################################

selectObject: wav
sp = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"

if pitch$ != "FALSE"
  selectObject: wav
  pitch_obj = To Pitch: 0, 75, 600
endif

# Set up plotting params ############################################

Erase all

10
Helvetica

# Plot ##############################################################

Select inner viewport: 0, win_width, wav_height, wav_height + sp_height

selectObject: sp
Paint: start, end, 0, 0, 100, "no", 70, 6, 0, "no"
Draw inner box

if pitch$ != "FALSE"
  Select inner viewport: 0, win_width, wav_height + sp_height, wav_height + sp_height + pitch_height

  selectObject: pitch_obj
  Line width: 3
  Maroon
  Draw: start, end, pitch_min, pitch_max, "no"
  Line width: 1
  Black
  Axes: start, end, pitch_min, pitch_max
  Marks right: 2, "yes", "yes", "no"
endif

Select inner viewport: 0, win_width, wav_height, wav_height + sp_height

Draw inner box

if tg$ != "FALSE"
  Select inner viewport: 0, win_width, 0, tg_height
  selectObject: tg
  Draw: start, end, "yes", "yes", "no"
  inner_height = tg_height
else
  inner_height = win_height
endif

Select inner viewport: 0, win_width, 0, wav_height

selectObject: wav
Silver
Draw: start, end, 0, 0, "no", "Curve"
Black

Select inner viewport: 0, win_width, wav_height, wav_height + sp_height

Axes: start, end, 0, 5000
Marks left: 2, "yes", "yes", "no"
Text left: "no", "Freq. (Hz)"

Select inner viewport: 0, win_width, 0, inner_height

Draw inner box
Marks bottom every: 1, 1, "yes", "yes", "no"
Text bottom: "yes", "Time (s)"

Select inner viewport: 0, win_width, 0, inner_height

if format$ == "png"
  Save as 600-dpi PNG file: file$
elif format$ == "pdf"
  Save as PDF file: file$
else
  writeInfoLine: "Format not recognised."
endif
