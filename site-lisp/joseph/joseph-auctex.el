
(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(provide 'joseph-auctex)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-auctex.el ends here
