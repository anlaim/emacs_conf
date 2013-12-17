(defvar evil-mark-funs-marker nil)

(defadvice keyboard-quit (before save-marker-when-mark-region activate)
  "goto init position after quit mark region"
 (when (and (member last-command '(evil-mark-defun
                              evil-M-h
                              evil-mark-whole-buffer))
            (region-active-p)
            evil-mark-funs-marker)
   (goto-char (marker-position evil-mark-funs-marker))))

;;;###autoload
(defun evil-mark-defun(&optional arg)
  "call function binding to `C-M-h'"
  (interactive)
  (setq evil-mark-funs-marker (point-marker))
  (call-interactively (key-binding (kbd "C-M-h")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "C-M-h"))))))
;;;###autoload
(defun evil-M-h(&optional arg)
  "call function binding to `M-h'"
  (interactive)
  (setq evil-mark-funs-marker (point-marker))
  (call-interactively (key-binding (kbd "M-h")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "M-h"))))))
;;;###autoload
(defun evil-mark-whole-buffer(&optional arg)
  "call function binding to `C-xh'"
  (interactive)
  (setq evil-mark-funs-marker (point-marker))
  (call-interactively (key-binding (kbd "C-x h")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "C-x h"))))))
;;;###autoload
(defun evil-begin-of-defun(&optional arg)
  "call function binding to `C-M-a'"
  (interactive)
  (call-interactively (key-binding (kbd "C-M-a")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "C-M-a"))))))
;;;###autoload
(defun evil-end-of-defun(&optional arg)
  "call function binding to `C-M-e'"
  (interactive)
  (call-interactively (key-binding (kbd "C-M-e")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "C-M-e"))))))
;;;###autoload
(defun evil-C-M-f(&optional arg)
  "call function binding to `C-M-f'"
  (interactive)
  (call-interactively (key-binding (kbd "C-M-f")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "C-M-f"))))))
;;;###autoload
(defun evil-C-M-b(&optional arg)
  "call function binding to `C-M-b'"
  (interactive)
  (call-interactively (key-binding (kbd "C-M-b")))
  (message (concat "call function: "
                   (symbol-name (key-binding (kbd "C-M-b"))))))
;;;###autoload
(defun evil-copy-sexp-at-point(&optional arg)
  "call function binding to `C-M-kC-/'"
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'sexp))
         start end)
    (when bounds
      (setq start (car bounds))
      (setq end (cdr bounds))
     (kill-ring-save start end)
     (if (> (- end start) 30)
         (message "`sexp' at point copied")
       (message "\"%s\" are copied"
                (buffer-substring-no-properties start end))))))



(provide 'joseph-evil-lazy)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-lazy.el ends here
