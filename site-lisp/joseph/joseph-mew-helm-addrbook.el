
;;; Commentary:

;;; Code:
(defvar joseph-mew-addrbook-candidates nil)

(defun joseph-mew-addrbook-candidates()
  (if joseph-mew-addrbook-candidates
      joseph-mew-addrbook-candidates
    (with-current-buffer (find-file-noselect mew-addrbook-file)
      (goto-char (point-min))
      (let (line prefix comment tokens short mail)
        (while (not (eobp))
          (setq line (buffer-substring (point-at-bol) (point-at-eol)))
          (setq tokens (split-string line "#"))
          (setq prefix (car tokens))
          (setq comment (nth 1 tokens))
          (setq tokens (split-string prefix "[: \t]" t))
          (setq short (car tokens))
          (setq mail (nth 1 tokens))
          (add-to-list 'joseph-mew-addrbook-candidates (cons (concat short comment) mail))
          (forward-line)))
      (kill-buffer))))

(defvar helm-c-source-mew-addrbook
  '((name . "Insert Email:")
    (init . joseph-mew-addrbook-candidates)
    (candidates . joseph-mew-addrbook-candidates)
    (action . (("Insert Email:" . (lambda(candidate)
                                    (let ((region (bounds-of-thing-at-point 'sexp))
                                          start end)
                                      (when region
                                        (setq start (car region))
                                        (setq end (cdr region))
                                        (delete-region start end)))
                                    (insert candidate)))))))

;;;###autoload
(defun helm-mew-addrbook-complete()
  "complete mew address book"
  (interactive)
  (let ((helm-execute-action-at-once-if-one t)
        (helm-quit-if-no-candidate
         (lambda () (message "No addrbook record."))))
    (helm '(helm-c-source-mew-addrbook)
              ;; Initialize input with current symbol
             (thing-at-point 'sexp)  nil nil "\t")))

(provide 'joseph-mew-helm-addrbook)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-mew-lazy.el ends here
