;;{{{ cygwin
(require 'cygwin-mount)
(cygwin-mount-activate)

;;我是将d:/usr/cygwin/bin/加入到了系统变量里,故这里少了许了代码多了注释
(let* ((cygwin-root "d:/usr/cygwin"))
  (when (file-readable-p cygwin-root)
    ;; (setq exec-path (cons cygwin-bin exec-path))
    ;; (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
    ;; (setenv "HOME" (concat cygwin-root "/home/eric"))
    ;; NT-emacs assumes a Windows shell. Change to baash.
    (setq shell-file-name "bash.exe")
    (setenv "SHELL" shell-file-name) 
    (setq explicit-shell-file-name shell-file-name) 
    ;; This removes unsightly ^M characters that would otherwise
    ;; appear in the output of java applications.
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))

;;; Use `bash' as the default shell in Emacs.
;;(setq exec-path (cons "C:/cygwin/bin" exec-path))
;;(setq shell-file-name "C:/cygwin/bin/bash.exe") ; Subprocesses invoked via the shell.
;;(setenv "SHELL" shell-file-name)
;;(setenv "PATH" (concat (getenv "PATH") ";C:\\cygwin\\bin"))
;;(setq explicit-shell-file-name shell-file-name) ; Interactive shell
(setq ediff-shell shell-file-name)      ; Ediff shell
(setq explicit-shell-args '("--login" "-i"))
;;;;; (setq shell-command-switch "-ic") ; SHOULD THIS BE "-c" or "-ic"?
(setq w32-quote-process-args ?\") ;; " @@@ IS THIS BETTER? ;@@@ WAS THIS BEFORE: (setq w32-quote-process-args t)

;;; Follow Cygwin symlinks.
;;; Handles old-style (text file) symlinks and new-style (.lnk file) symlinks.
;;; (Non-Cygwin-symlink .lnk files, such as desktop shortcuts, are still loaded as such.)
(defun follow-cygwin-symlink ()
  "Follow Cygwin symlinks.
Handles old-style (text file) and new-style (.lnk file) symlinks.
\(Non-Cygwin-symlink .lnk files, such as desktop shortcuts, are still
loaded as such.)"
  (save-excursion
    (goto-char 0)
    (if (looking-at
         "L\x000\x000\x000\x001\x014\x002\x000\x000\x000\x000\x000\x0C0\x000\x000\x000\x000\x000\x000\x046\x00C")
        (progn
          (re-search-forward
           "\x000\\([-A-Za-z0-9_\\.\\\\\\$%@(){}~!#^'`][-A-Za-z0-9_\\.\\\\\\$%@(){}~!#^'`]+\\)")
          (find-alternate-file (match-string 1)))
      (if (looking-at "!<symlink>")
          (progn
            (re-search-forward "!<symlink>\\(.*\\)\0")
            (find-alternate-file (match-string 1))))
      )))
(add-hook 'find-file-hooks 'follow-cygwin-symlink)

;;; Use Unix-style line endings.
;;(setq-default buffer-file-coding-system 'undecided-unix)

;;; Add Cygwin Info pages
(setq Info-default-directory-list (append Info-default-directory-list (list "c:/cygwin/usr/info/")))

;;;###autoload
(defun bash ()
  "Start `bash' shell."
  (interactive)
  (let ((binary-process-input t)
        (binary-process-output nil))
    (shell)))

(setq process-coding-system-alist
      (cons '("bash" . (raw-text-dos . raw-text-unix)) process-coding-system-alist))
;; From: http://www.dotfiles.com/files/6/235_.emacs
;;;###autoload
(defun set-shell-bash()
  "Enable on-the-fly switching between the bash shell and DOS."
  (interactive)
  ;; (setq binary-process-input t)
  (setq shell-file-name "bash")
  (setq shell-command-switch "-c")      ; SHOULD IT BE (setq shell-command-switch "-ic")?
  (setq explicit-shell-file-name "bash")
  (setenv "SHELL" explicit-shell-file-name)
  ;;;;;(setq explicit-sh-args '("-login" "-i")) ; Undefined?
  (setq w32-quote-process-args ?\") ;; "
  ;;;;;(setq mswindows-quote-process-args t)) ; Undefined?
  )

;;;###autoload
(defun set-shell-cmdproxy()
  "Set shell to `cmdproxy'."
  (interactive)
  (setq shell-file-name "cmdproxy")
  (setq explicit-shell-file-name "cmdproxy")
  (setenv "SHELL" explicit-shell-file-name)
  ;;;;;(setq explicit-sh-args nil)           ; Undefined?
  (setq w32-quote-process-args nil))

;;}}}

(defun joseph-shell-setup ()
  "For Cygwin bash under Emacs 20"
  (setq comint-scroll-show-maximum-output 'this)
  (make-variable-buffer-local 'comint-completion-addsuffix))
(setq shell-mode-hook 'joseph-shell-setup)
(setq comint-completion-addsuffix t)
;; (setq comint-process-echoes t) ;; reported that this is no longer needed
(setq comint-eol-on-send t)
(setq w32-quote-process-args ?\")

;;dired 使用外部的ls 程序
(setq ls-lisp-use-insert-directory-program t)      ;; use external ls
(setq insert-directory-program "c:/cygwin/bin/ls") ;; ls program name


;;有一些回显程序如echo.exe 默认情况下也会显示你执行的命令,这个hook
;;可以使它仅显示它应该显示的部分
;;如 $echo a
;;默认会显示为
;;echo a
;;a
;;有此后只显示a

(defun joseph-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'jose-comint-init)


(tool-bar-mode -1);;关闭工具栏
(global-set-key (kbd "C-x C-b") 'joseph-hide-frame)
(global-set-key (kbd "C-x C-z") 'joseph-hide-frame)
(create-fontset-from-fontset-spec
 (concat   "-outline-Courier New-normal-normal-normal-mono-15-*-*-*-c-*-fontset-gbk,"
           "chinese-gb2312:-outline-新宋体-normal-normal-normal-mono-15-*-*-*-c-*-gb2312.1980-0") t)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; The next line is only needed for the MS-Windows clipboard
(set-clipboard-coding-system 'utf-16le-dos)
(set-frame-font "-outline-SimSun-normal-normal-normal-*-16-*-*-*-p-*-iso8859-1")




(require 'server)
;;进行server认证的目录,
(setq server-auth-dir "~/.emacs.d/cache/")
(setq server-name "emacs-server-file")
;;上面两个值连起来即为emacsclient --server-file后面跟的参数
;;为方便计只需要设置EMACS_SERVER_FILE,值为emacs-server-file的绝对路径名称
;;如我的"d:\.emacs.d\cache\emacs-server-file"
;;注意在windows 上我把环境变量HOME设成了D:\,所以"~"就代表"D:\"了.
(server-start)

(setq window-system-default-frame-alist
      '((w32
         (foreground-color . "#f7f8c6")
         (background-color . "#2e2d28")
         (cursor-color . "white")
         (height . 35)
         (width . 95)
         (font . "fontset-gbk"))))
(provide 'joseph-w32)
