;;   This allows the powermate dial to be used to rotate the view in coot, in +/- x,y,z.
;;   The F1 key rotates forward, and the F2 key rotates in reverse.  The F3 key permutes the
;;   direction of rotation from x to y to z to x. To use this, assign F1/F2 to left/right rotation,
;;   and F3 to push down in the Powermate Driver software.
;;   
;;   William Scott and Alastair Fyfe, Sept. 12, 2007. Revised Aug. 20, 2009.


;; Set the initial direction to y
    (define direction 2)

;; Bind the F3 key to toggle direction
    (add-key-binding "Toogle direction" "F3"   (lambda () (cond
            ((= direction 1) (set! direction 2 ))
            ((= direction 2) (set! direction 3 ))
            ((= direction 3) (set! direction 1 ))
              ))
    )


;; bind the F1 key, action depends on the current value of variable "direction"

    (add-key-binding "rotate forward in predefined direction" "F1"   (lambda () (cond
                   ((= direction 1) (rotate-x-scene 1 3.0 ))
                   ((= direction 2) (rotate-y-scene 1 3.0 ))
                   ((= direction 3) (rotate-z-scene 1 3.0 ))          ))    
    )
    
    
;; bind the F2 key, action depends on the current value of variable "direction"

    (add-key-binding "rotate reverse in predefined direction" "F2"   (lambda () (cond
                   ((= direction 1) (rotate-x-scene 1 -3.0 ))
                   ((= direction 2) (rotate-y-scene 1 -3.0 ))
                   ((= direction 3) (rotate-z-scene 1 -3.0 ))          ))    
    )
