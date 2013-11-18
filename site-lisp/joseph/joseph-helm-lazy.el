;;; Code:

;;;###autoload
(defun push-curline-to-bookmark()
  (when (buffer-file-name)
    (bookmark-set  (replace-regexp-in-string
                    "^[ \t]*" ""
                    (buffer-substring-no-properties
                     (line-beginning-position) (line-end-position))))))


(provide 'joseph-helm-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-helm-lazy.el ends here
