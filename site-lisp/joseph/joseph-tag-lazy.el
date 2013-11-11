;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'helm-gtags)
  (require 'find-func)
  ;; (require 'helm-etags+)
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
         (find-file (find-library-name (symbol-name (symbol-at-point))))
       (error
        (condition-case nil
            (find-function (symbol-at-point))
          (error (condition-case nil
                     (find-variable (symbol-at-point))
                   (error (condition-case nil
                              (helm-gtags-find-tag-and-symbol)
                            (error (message "not found")))))))
        )))
    ;; (erlang-mode (erl-find-source-under-point))
    (otherwise
     (condition-case nil
         (helm-gtags-find-tag-and-symbol)
       (error (message "not found")))
     )))

(provide 'joseph-tag-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tag-lazy.el ends here
