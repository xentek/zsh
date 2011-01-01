;; Toggle Zalman Stereo mode
    ;; bind the S (shift-s) key to get Stereo
    (add-key-binding "Zalman Stereo" "S" zalman-stereo-mode)
    ;; bind the M (shift-m) key to get Mono
    (add-key-binding "Undo Zalman Stereo" "M" mono-mode)
;;
;; The font needs to be cranked up to be visible in stereo
    (set-font-size 3)
;;
;; Specific for Zalman monitor set to the left of main display.  Edit as required.
    ;; These should be even numbers to keep the stereo
    ;; the right way around
        (set-graphics-window-position 0 0)
        (set-graphics-window-size 1680 1000)
    ;; Make these appear on the right-hand monitor
        (set-model-fit-refine-dialog-position 1900 0)
        (set-delete-dialog-position 1700 50)
        (set-go-to-atom-window-position 1847 67)

 

