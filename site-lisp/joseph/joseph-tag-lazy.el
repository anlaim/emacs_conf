;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'helm-gtags)
  (require 'find-func)
  (require 'bookmark)
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
     (if (string-match "([ ]*[\\(require\\)|\\(provide\\)]"
                       (buffer-substring-no-properties
                        (line-beginning-position) (line-end-position)))
         (find-file (find-library-name (symbol-name (symbol-at-point))))
       (condition-case nil
           (find-variable (symbol-at-point))
         (error (condition-case nil
                    (find-function (symbol-at-point))
                  (error (condition-case nil
                             (helm-gtags-find-tag-and-symbol)
                           (error (message "not found")))))))))
    (lisp-interaction-mode
     (if  (string-match "([ ]*[\\(require\\)|\\(provide\\)]"
                        (buffer-substring-no-properties
                         (line-beginning-position) (line-end-position)))
         (find-file (find-library-name (symbol-name (symbol-at-point))))
       (condition-case nil
           (find-variable (symbol-at-point))
         (error (condition-case nil
                    (find-function (symbol-at-point))
                  (error (condition-case nil
                             (helm-gtags-find-tag-and-symbol)
                           (error (message "not found")))))))))
    ;; (erlang-mode (erl-find-source-under-point))
    (c++-mode
     (let ((curline (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
       (if (string-match "[ ]*#include[ \t]+[\"<]\\(.*\\)[\">]" curline)
           ;; for c++-mode ,in current line contains #include ,then try to open the include file using helm-gtags
           (helm-gtags-find-files (match-string 1 curline))
         (condition-case nil
             (helm-gtags-find-tag-and-symbol)
           (error (message "not found"))))))
    (c-mode
     (let ((curline (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
       (if (string-match "[ ]*#include[ \t]+[\"<]\\(.*\\)[\">]" curline)
           ;; for c-mode ,in current line contains #include ,then try to open the include file using helm-gtags
           (helm-gtags-find-files (match-string 1 curline))
         (condition-case nil
             (helm-gtags-find-tag-and-symbol)
           (error (message "not found"))))))
    (otherwise
     (condition-case nil
         (helm-gtags-find-tag-and-symbol)
       (error (message "not found"))))))

(provide 'joseph-tag-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tag-lazy.el ends here
