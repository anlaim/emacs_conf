;;; Code:

;;;###autoload
(defun push-curline-to-bookmark()
  (when (buffer-file-name)
    (bookmark-set  (concat (buffer-substring-no-properties (line-beginning-position) (line-end-position))
                           " "  (buffer-file-name)))))


(provide 'joseph-helm-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-helm-lazy.el ends here
