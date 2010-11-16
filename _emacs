;(put 'upcase-region 'disabled nil)
;(put 'set-goal-column 'disabled nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(jde-compile-option-directory "./")
 '(jde-complete-function (quote jde-complete-menu))
 '(jde-help-docsets (quote (("JDK API" "/java/java/doc/j2ee6_api/index.html" nil))))
 '(jde-jdk-doc-url "/java/java/doc/j2ee6_api/index.html")
 '(jde-sourcepath (quote ("/opt/sun-jdk-1.6.0.22/src.zip" "/opt/sun-jdk-1.6.0.22/src")))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
);(global-set-key [(control tab)] ' senator-completion-menu-popup)
(global-set-key [(control return)] 'jde-complete)

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 'jixiuf_init)
;(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(setq kill-buffer-query-functions  nil) 