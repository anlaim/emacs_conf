;(put 'upcase-region 'disabled nil)
;(put 'set-goal-column 'disabled nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(nxml-slash-auto-complete-flag t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;(global-set-key [(control tab)] ' senator-completion-menu-popup)

;(add-to-list 'load-path  "~/.emacs.d/")
;(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
;(setq load-path (append load-path (list "~/.emacs.d")))
;(load "jixiuf_init")
(require 'jixiuf_init)
