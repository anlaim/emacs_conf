;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (add-to-list 'load-path  (expand-file-name "../helm-etags-plus/"))
  (add-to-list 'load-path  (expand-file-name "../quick-jump/"))
  (require 'helm-etags+)
  (require 'quick-jump)
  )
;;;###autoload
(defun goto-definition (&optional arg)
  "Make use of emacs' find-func and etags possibilities for finding definitions."
  (interactive "P")
  (quick-jump-push-marker)
  (case major-mode
    (emacs-lisp-mode
     (condition-case nil
         (find-function (symbol-at-point))
       (error (condition-case nil
                  (find-variable (symbol-at-point))
                (error (condition-case nil
                           (helm-etags+-select arg)
                         (error (message "not found"))))))))
    ;; (erlang-mode (erl-find-source-under-point))
    (otherwise
     (condition-case nil
         (helm-etags+-select arg)
       (error (message "not found")))
     )))

(provide 'joseph-tag-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tag-lazy.el ends here
