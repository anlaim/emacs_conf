;;;;;;;;;;;; this stuff help you to switch between edit current buffer as root and as  common user
;;;;;;;;;;;(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
;;;;;;;;;;;; also you can  /usr/bin/emacsclient -t -e "(wl-sudo-find-file \"$1\" \"$PWD\")" 
;(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
(defvar toggle-to-root-hook nil
  "Normal hook for functions to run after toggle to \"root\" user to edit this file ")
(defvar hostname "localhost")   ;;default is localhost ,you may set hostname to your hostname
(defvar toggle-to-common-user-hook nil
  "Normal hook for functions to run after toggle back to read-only state")
  
(defun toggle-read-only-file-with-sudo ()
  (interactive)
  (let ((fname (or buffer-file-name
                   dired-directory)))
(shell-command (concat "logger before " fname)  )
    (when fname
      (if (string-match "^/sudo:" fname) 
            (setq fname  (replace-regexp-in-string  (concat  "^/sudo:root@" hostname  ":" )  ""  (replace-regexp-in-string "^/sudo:root@localhost:"   "" fname) ) )
                (setq fname (concat "/sudo:root@localhost:"  fname))
        )
      (find-alternate-file fname) ;;this is the function 
      (if  (string-match "^/sudo:" fname)
          (run-hooks 'toggle-to-root-hook) 
          (run-hooks 'toggle-to-common-user-hook) 
        )
      
      )))

(defun wl-sudo-find-file (file dir)
  (find-file (concat "/sudo:root@localhost:" (expand-file-name file dir)))
          (run-hooks 'toggle-to-root-hook) 

)

(defface toggle-to-root-header-face
  '((t (:foreground "white" :background "red3")))
  "*Face use to display header-lines for files opened as root.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; define a funtion ,and link it to hook toggle-to-root-hook
(defun toggle-to-root-header-warning ()
  "*Display a warning in header line of the current buffer.
   This function is suitable to add to `toggle-to-root-hook'."
  (let* ((warning "WARNING: EDITING FILE AS ROOT!")
	 (space (+ 6 (- (window-width) (length warning))))
	 (bracket (make-string (/ space 5) ?-))
	 (warning (concat bracket bracket warning bracket bracket bracket )))
    (setq header-line-format
	  (propertize  warning 'face 'toggle-to-root-header-face))))
(add-hook 'toggle-to-root-hook 'toggle-to-root-header-warning)

;(remove-hook 'toggle-to-root-hook 'toggle-to-root-header-warning)
(provide 'jixiuf_sudo)
