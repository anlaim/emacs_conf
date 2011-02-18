(setq  etags-srcdir-tagfile-alist
  '(("/tmp/d/" "ctags -f /tmp/d/TAGS -e -R /tmp/d/")
   ; ("/tmp"  "ctags -f /tmp/TAGS -e -R /tmp/")
    )
  )

;;  ctags -e -R /tmp
 
(defun update-tagfile()
  (dolist (entity etags-srcdir-tagfile-alist)
    (when (string-match (car entity) (buffer-file-name))
      (shell-command (nth 1 entity))
      )
    )
  )
(add-hook 'after-save-hook 'update-tagfile)
