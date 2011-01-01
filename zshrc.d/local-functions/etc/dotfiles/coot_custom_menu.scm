;; Customize menu bar for PowerMate Dial and Zalman monitor
(let ((menu (coot-menubar-menu "Custom")))
  (add-simple-coot-menu-menuitem
   menu "PowerMate"
   (lambda ()
 (load (append-dir-file (getenv "ZDOT") "zshrc.d/local-functions/etc/dotfiles/cootrc_powermate_and_keybindings.scm"))))
  (add-simple-coot-menu-menuitem
   menu "Zalman Stereo ON"
   (lambda ()
 (zalman-stereo-mode)))
  (add-simple-coot-menu-menuitem
   menu "Zalman Stereo OFF"
   (lambda ()
 (mono-mode)))
  (add-simple-coot-menu-menuitem
   menu "Zalman Full-Screen"
   (lambda ()
 (set-graphics-window-position 0 0)(set-graphics-window-size 1680 1000))))
 

