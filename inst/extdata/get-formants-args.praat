sound = Read from file: "vowels.wav"
formant = To Formant (burg): 0, 5, 5000, 0.05, 50
textgrid = Read from file: "vowels.TextGrid"
header$ = "vowel,F1,F2,F3"
writeInfoLine: header$

form Get formants
    choice Measure 1
        button Hertz
        button Bark
    real Window_(sec) 0.03
endform

if measure == 1
    measure$ = "Hertz"
else
    measure$ = "Bark"
endif

selectObject: textgrid
intervals = Get number of intervals: 1

for interval to intervals - 1
    label$ = Get label of interval: 1, interval
    if label$ != ""
        start = Get start time of interval: 1, interval
        start = start + window
        end = Get end time of interval: 1, interval
        end = end - window
        vowel$ = Get label of interval: 1, interval

        selectObject: formant
        f1 = Get mean: 1, start, end, measure$
        f2 = Get mean: 2, start, end, measure$
        f3 = Get mean: 3, start, end, measure$

        resultLine$ = "'vowel$','f1','f2','f3'"
        appendInfoLine: resultLine$
        selectObject: textgrid
    endif
endfor
