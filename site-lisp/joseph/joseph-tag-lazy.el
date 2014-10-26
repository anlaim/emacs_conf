;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'erlookup nil t))
;; (require 'bookmark-cycle)
(require 'bm)
(require 'find-func)
(require 'helm-gtags)

;;;###autoload
(defun goto-definition (&optional arg)
  "Make use of emacs' find-func and etags possibilities for finding definitions."
  (interactive "P")
  (let ((line (buffer-substring-no-properties
               (line-beginning-position) (line-end-position))))
    (bm-bookmark-add)
    (case major-mode
      (emacs-lisp-mode
       (if (or (string-match "(\\brequire\\b" line) (string-match "(\\bprovide\\b" line))
           (find-file (find-library-name (symbol-name (symbol-at-point))))
         (condition-case nil
             (if  (functionp (symbol-at-point))
                 (find-function (symbol-at-point))
               (condition-case nil
                   (when (variable-at-point) (find-variable (symbol-at-point)))
                 (error (helm-gtags-find-tag-and-symbol))))
           )))
      (lisp-interaction-mode
       (if (or (string-match "(\\brequire\\b" line) (string-match "(\\bprovide\\b" line))
           (find-file (find-library-name (symbol-name (symbol-at-point))))
         (condition-case nil
             (if  (functionp (symbol-at-point))
                 (find-function (symbol-at-point))
               (condition-case nil
                   (when (variable-at-point) (find-variable (symbol-at-point)))
                 (error (helm-gtags-find-tag-and-symbol))))
           )))
      (erlang-mode (erl-find-source-under-point))
      (c++-mode
       (if (string-match "[ ]*#[ \t]*include[ \t]+[\"<]\\(.*\\)[\">]" line)
           ;; for c++-mode ,in current line contains #include ,then try to open the include file using helm-gtags
           (helm-gtags-find-files (match-string 1 line))
         (helm-gtags-find-tag-and-symbol)))
      (c-mode
       (if (string-match "[ ]*#[ \t]*include[ \t]+[\"<]\\(.*\\)[\">]" line)
           ;; for c-mode ,in current line contains #include ,then try to open the include file using helm-gtags
           (helm-gtags-find-files (match-string 1 line))
         (helm-gtags-find-tag-and-symbol)))
      (lua-mode
       (call-interactively 'helm-etags+-select)
       )
      (csharp-mode
       (call-interactively 'helm-etags+-select)
       )
      (go-mode
       (call-interactively 'godef-jump)
       )
      (otherwise
       (helm-gtags-find-tag-and-symbol)))))


(add-hook 'helm-gtags-quit-or-no-candidates-hook 'bm-bookmark-remove)

(provide 'joseph-tag-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tag-lazy.el ends here
