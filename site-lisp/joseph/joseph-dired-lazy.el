(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
  (require 'joseph_byte_compile_include)
  (require 'dired)
  (require 'dired-x)
  (require 'wdired)
  (require 'dired-aux)
  (require  'anything)
  )

;;;###autoload
(defun dired-name-filter-only-show-matched-lines(filter-regexp)
  (interactive "s(only show matched):")
  (let ((dired-marker-char 16)
        (files (directory-files default-directory t)))
    ;;(dired-unmark-all-files dired-marker-char)
    (save-excursion
      (dolist (file files)
        (when (and (dired-goto-file  (expand-file-name file))
                   (not (string= "" filter-regexp))
                   (string-match filter-regexp (file-name-nondirectory file)))
          (dired-mark 1)
          )))
    (dired-toggle-marks)
    (dired-do-kill-lines nil (concat "Filter:'" filter-regexp "' omitted %d line%s"))
    (dired-move-to-filename)
    )
  )

;;;###autoload
(defun anything-dired()
  "call `anything' to show dired history and files in current buffers."
  (interactive)
  (require 'anything-dired-history)
  (let ((anything-execute-action-at-once-if-one t)
        (anything-quit-if-no-candidate
         (lambda () (message "No history record."))))
    (anything '(anything-c-source-dired-history anything-c-source-files-in-current-dir+))))

;;;###autoload
(defun dired-begining-of-buffer()
  (interactive)
  (goto-char (point-min))
  (dired-next-line 2)
  )

;;;###autoload
(defun dired-end-of-buffer()
  (interactive)
  (goto-char (point-max))
  (dired-previous-line 1)
  )

;;;###autoload
(defun dired-add-to-load-path-or-load-it()
  "on `dired-mode',if thing under point is directory add it to `load-path'
if it is a el-file ,then `load' it"
  (interactive)
  (let ((dir-or-file  (dired-get-filename)))
    (if (file-directory-p dir-or-file)
        (progn
          (add-to-list 'load-path dir-or-file)
          (message (concat dir-or-file " added to load-path" ))
          )
      (if (string-equal  (file-name-extension  dir-or-file ) "el")
          (load  dir-or-file)
        (message (concat dir-or-file "is loaded"))
        ))))
(provide 'joseph-dired-lazy)
;;; joseph-dired-lazy.el ends here
