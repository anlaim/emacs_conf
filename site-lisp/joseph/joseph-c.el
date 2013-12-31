;;; config

;; (require 'gdb-ui)

;; (require 'info-look)
;; ;; C-hS
;; ;; C-whi (helm-info-at-point)
;; (info-lookup-add-help
;;  :mode 'c-mode
;;  :regexp "[^][()'\" \t\n]+"
;;  :ignore-case t
;;  :doc-spec '(("(libc)Symbol Index" nil nil nil)))

(setq-default gdb-many-windows t)
(add-hook 'c-mode-hook 'flymake-mode-on)
(add-hook 'c++-mode-hook 'flymake-mode-on)
;; (global-set-key [f6] 'gud-step)
;; (global-set-key [f7] 'gud-next)
;; (global-set-key [f8] 'gud-finish)


(provide 'joseph-c)
;;; joseph-c.el ends here
