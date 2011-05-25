(setenv "HOME" "d:/")
;;;###autoload
(defun set-shell-bash()
  "Enable on-the-fly switching between the bash shell and DOS."
  (interactive)
  ;; (setq binary-process-input t)
  (setq shell-file-name "bash")
  (setq shell-command-switch "-c")      ; SHOULD IT BE (setq shell-command-switch "-ic")?
  (setq explicit-shell-file-name "bash") ;;term.el
  (setenv "SHELL" explicit-shell-file-name)
  (eval-after-load 'ediff-diff '(progn (setq ediff-shell shell-file-name))) ;;Ediff shell
  (setq w32-quote-process-args ?\") ;; "
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

(set-shell-bash) ;;now use bash as my shell ,
;; you can call (set-shell-cmdproxy )here to use cmdproxy as the shell.


(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; ;;(setq exec-path (cons "C:/cygwin/bin" exec-path))
;; ;;(setq shell-file-name "C:/cygwin/bin/bash.exe") ; Subprocesses invoked via the shell.
;; ;;(setenv "SHELL" shell-file-name)
;; ;;(setenv "PATH" (concat (getenv "PATH") ";C:\\cygwin\\bin"))
;; ;;(setq explicit-shell-file-name shell-file-name) ; Interactive shell

;;;###autoload
(defun bash ()
  "Start `bash' shell."
  (interactive)
  (let ((binary-process-input t)
        (binary-process-output nil))
    (shell)))

(setq process-coding-system-alist
      (cons '("bash" . (raw-text-dos . raw-text-unix)) process-coding-system-alist))
;; ;; From: http://www.dotfiles.com/files/6/235_.emacs


;; ;;dired 使用外部的ls 程序
(setq ls-lisp-use-insert-directory-program t)      ;; use external ls
(setq insert-directory-program "ls") ;; ls program name


;;有一些回显程序如echo.exe 默认情况下也会显示你执行的命令,这个hook
;;可以使它仅显示它应该显示的部分
;;如 $echo a
;;默认会显示为
;;echo a
;;a
;;有此后只显示a

(defun joseph-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'joseph-comint-init)


(tool-bar-mode -1);;关闭工具栏
(global-set-key (kbd "C-x C-b") 'joseph-hide-frame)
(global-set-key (kbd "C-x C-z") 'joseph-hide-frame)
;; (create-fontset-from-fontset-spec
;;  (concat   "-outline-Courier New-normal-normal-normal-mono-15-*-*-*-c-*-fontset-gbk,"
;;            "chinese-gb2312:-outline-新宋体-normal-normal-normal-mono-15-*-*-*-c-*-gb2312.1980-0") t)

;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; ;; The next line is only needed for the MS-Windows clipboard
;; (set-clipboard-coding-system 'utf-16le-dos)
;; (set-frame-font "-outline-SimSun-normal-normal-normal-*-16-*-*-*-p-*-iso8859-1")




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
         (cursor-color . "gold")
         (height . 35)
         (width . 85)
;;         (font . "fontset-gbk")
         )))
;;这台机器用是日文系统 ,所以一些配置,采用日文编码
(when (equal system-name "SB_QINGDAO")
  (setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码
  (setq file-name-coding-system 'shift_jis-dos) ;;文件名所用的编码,不过这样,中文文件名就有问题了
  )

;;中文系统采用的编码
(unless (equal system-name "SB_QINGDAO")
;;  (setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码
;;  (setq file-name-coding-system 'shift_jis-dos);;文件名所用的编码,不过这样,中文文件名就有问题了
  )
;; (prefer-coding-system (quote utf-8-auto-dos))
;; (set-file-name-coding-system 'shift_jis-dos)

;; (setq current-language-environment "UTF-8")
;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (set-clipboard-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8)
;; (setq default-process-coding-system '(utf-8 . utf-8))
;; (setq-default pathname-coding-system 'utf-8)
;; (prefer-coding-system 'gbk)
;; (prefer-coding-system (quote gbk-dos))
;; (prefer-coding-system 'utf-8)
(setq font-encoding-alist
      (append '(("MuleTibetan-0" (tibetan . 0))
                ("GB2312" (chinese-gb2312 . 0))
                ("JISX0208" (japanese-jisx0208 . 0))
                ("JISX0212" (japanese-jisx0212 . 0))
                ("VISCII" (vietnamese-viscii-lower . 0))
                ("KSC5601" (korean-ksc5601 . 0))
                ("MuleArabic-0" (arabic-digit . 0))
                ("MuleArabic-1" (arabic-1-column . 0))
                ("MuleArabic-2" (arabic-2-column . 0)))
              font-encoding-alist))

 (provide 'joseph-w32)
