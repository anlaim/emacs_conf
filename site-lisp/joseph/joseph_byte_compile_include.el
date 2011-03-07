 ;; -*-no-byte-compile: t; -*-
;;when byte-compile-a file eval this line
;;(add-to-list 'load-path  (concat joseph_site-lisp_install_path "ca2/"));;
;;(add-to-list 'load-path  (concat joseph_site-lisp_install_path "dired/"))

(defvar joseph_root_install_path (expand-file-name "~/.emacs.d/"))
(defvar joseph_site-lisp_install_path (expand-file-name (concat joseph_root_install_path "site-lisp/")))
(defvar joseph_joseph_install_path (expand-file-name (concat joseph_site-lisp_install_path "joseph/")))

(add-to-list 'load-path  joseph_root_install_path);; 加入配置文件的根路径
(add-to-list 'load-path  joseph_site-lisp_install_path);; 
(add-to-list 'load-path  joseph_joseph_install_path);; 
(add-to-list 'load-path (concat joseph_site-lisp_install_path "hide/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "dired//"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-config/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-config/extensions/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-config/developer-tools/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-etags+/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "ajc-java-complete/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "yasnippet-0.6.1c/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "auto-complete-1.3/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "icicles"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "js2"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "popwin-el"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "auto-install"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "quick-jump"))        
(add-to-list 'load-path (concat joseph_site-lisp_install_path "joseph-autopair"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "joseph-scroll-screen"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "joseph-term-toggle"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "palette"))

;;{{{ unused path
(add-to-list 'load-path (concat joseph_site-lisp_install_path "unused/elpa/company-0.5/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "unused/elpa/jtags"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "unused/sunrise/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "unused/ca2/"))
;;}}}





;; (joseph-files-in-directory-cyclely"~/.emacs.d/" "\\.el$")
(defun joseph-files-in-directory-cyclely(dir &optional pattern)
"return all files in `dir'  match `pattern'  cyclely, if pattern is nil return all"  
  (let((files (directory-files dir t)) (matched-files)
       (intern-pattern (or pattern ""))
       head)
    (while (> (length files) 0)
      (setq head (pop files))
      (when (file-readable-p head)
        (if (file-directory-p head)
            (when (and (not (string-match "^\\." (file-name-nondirectory head)))
                       (file-executable-p head))
              (setq files (append (directory-files head t) files )))
          (when (string-match intern-pattern (file-name-nondirectory head))
            (add-to-list 'matched-files head))  
          )
        )
      )
    matched-files
  ))
  
(defun joseph-byte-compile-files-outside (files)
  (let (file-strings cmd)
    (dolist (file files)
      (setq file-strings (concat file-strings " " file))
      )
    (setq cmd (format
               (concat " emacs  -batch    -l " joseph_joseph_install_path "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
               file-strings))
    
    (with-current-buffer (get-buffer-create "*joseph_compile*")
      (erase-buffer)
      (insert (shell-command-to-string cmd)))
    (switch-to-buffer (get-buffer-create "*joseph_compile*"))
    )
  )

(defun joseph-byte-compile-files-in-dir-cyclely(dir)
  (let ((files (joseph-files-in-directory-cyclely dir "\\.el$"))
        (elc-files (joseph-files-in-directory-cyclely dir "\\.elc$"))
        )
    (mapc 'delete-file elc-files)
    (joseph-byte-compile-files-outside files)
    ))

;;(joseph-byte-compile-files-in-dir-cyclely "~/.emacs.d/site-lisp/")

;(add-to-list 'load-path (expand-file-name "./"))
;; find . -name "*.el"  -exec emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile {} \;
;;emacs -batch -f batch-byte-compile  filename
;; emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile *.el


(provide 'joseph_byte_compile_include)
