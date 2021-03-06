;;; load-nano.el -*- lexical-binding: t; -*-

;; This file loads nano. Enable by putting (require 'load-nano) in config.el

; necessary for proper appearance of nano
(setq doom-theme 'nil)

(require 'nano-layout)
(require 'nano-theme-light)
(require 'nano-faces)
(nano-faces)
(require 'nano-theme)
(nano-theme)
(require 'nano-modeline)
(require 'nano-face-override)

(setq display-line-numbers-type nil
      evil-default-cursor t
      custom-blue "#718591"
      custom-yellow "#BDA441")


; still haven't figured out what is up with point
; related to nano. this is a stopgap measure to
; get a decent looking cursor
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (set-cursor-color custom-blue))))
  (set-cursor-color custom-blue))

(defun set-yellow ()
  (interactive)
  (set-cursor-color custom-yellow))
(defun set-blue ()
  (interactive)
  (set-cursor-color custom-blue))

; not working
(add-hook 'evil-emacs-state-entry-hook 'set-yellow)
(add-hook 'evil-emacs-state-exit-hook 'set-blue)

(provide 'load-nano)
