alias clear, mstop; mclear; hide all
alias nogui, set internal_gui=0
alias gui, set internal_gui=1
alias shiny, set spec_power=250; set spec_refl=1.5; set antialias=2; ray
alias grab, os.system("open -a Grab")
alias stop, quit
alias exit, quit
alias white, bg_color white; set depth_cue=0; set ray_trace_fog=0
alias ribbonize,\
    hide; show cartoon; set cartoon_fancy_helices, 1; \
    hide cartoon, ( resname A or resname G or resname C or resname U or resname T ); \
    show sticks, ( resname A or resname G or resname C or resname U or resname T ); \
    util.rainbow; color hotpink, ( resname A or resname G or resname C or resname U or resname T )

 

