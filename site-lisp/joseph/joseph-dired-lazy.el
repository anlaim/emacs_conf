(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
  (require 'joseph_byte_compile_include)
  (require 'dired)
  (require 'dired-x)
  (require 'wdired)
  (require 'dired-aux)
  (require  'helm)
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
(defun helm-dired()
  "call `helm' to show dired history and files in current buffers."
  (interactive)
  (require 'helm-dired-history)
  (let ((helm-execute-action-at-once-if-one t)
        (helm-quit-if-no-candidate
         (lambda () (message "No history record."))))
    (helm '(helm-c-source-dired-history helm-c-source-files-in-current-dir))))

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

;; C-a is nicer in dired if it moves back to start of files
;;;###autoload
(defun dired-smart-beginning-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (dired-move-to-filename)
    (and (= oldpos (point))
         (beginning-of-line))))

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

;;;###autoload
(defun dired-ediff(&optional arg)
  "在dired buffer中,如果mark了两个文件,则对此二文件进行diff
,如果仅mark了一个文件,则将其作为其中之一,另一个文件名则让用户选择,默认是光标下的文件
,如果没有mark任何文件,以当前文件作其一,另一,让用户选择.
默认使用ediff进行比较,`C-u'则使用diff"
  (interactive "P")
  (let ((marked-file-or-cur-file (dired-get-marked-files nil nil nil t))
        first  second)
    (cond
     ((and (= 2  (length marked-file-or-cur-file))
           (not (eq t (car marked-file-or-cur-file))));;mark 2 files
      (setq first (car marked-file-or-cur-file ))
      (setq second (nth 1 marked-file-or-cur-file )))
     ((and (= 2  (length marked-file-or-cur-file))
           (eq t (car marked-file-or-cur-file)));;mark 1 file
      (setq first (nth 1 marked-file-or-cur-file ))
      (setq second (read-file-name "Diff Marked file with(default:current file):"
                                   default-directory (dired-get-filename))))
     ((and (= 1 (length marked-file-or-cur-file))
           (not (file-directory-p (car marked-file-or-cur-file ))))
      (setq first (car marked-file-or-cur-file ));;no mark file
      (setq second (read-file-name "Diff current file with:" default-directory ))
      ))
    (if arg (progn (switch-to-buffer (diff first second))
                   (delete-other-windows))
      (ediff first second))))

(provide 'joseph-dired-lazy)
;;; joseph-dired-lazy.el ends here
