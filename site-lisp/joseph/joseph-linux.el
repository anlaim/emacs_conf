
;;; Code:
(defun etc-confd-find-file()
  (when (string-match  "/etc/conf\.d" (buffer-file-name))
    (sh-mode)
    ))

(add-hook 'find-file-hook 'etc-confd-find-file)

(provide 'joseph-linux)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-linux.el ends here
