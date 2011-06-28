;;; -*- coding:utf-8 -*-
(setenv "HOME" "d:/")
;; (setq process-coding-system-alist
;;       (cons '("bash" . (raw-text-dos . raw-text-unix)) process-coding-system-alist))
(setq process-coding-system-alist (cons '("bash" . undecided-unix) process-coding-system-alist))

;;now use bash as my shell ,
;; you can call (set-shell-cmdproxy )here to use cmdproxy as the shell.
(eval-after-load 'shell
'(progn
;;;###autoload
   (defun set-shell-bash()
     "Enable on-the-fly switching between the bash shell and DOS."
     (interactive)
     ;; (setq binary-process-input t)
     (setq comint-scroll-show-maximum-output 'this)
     (setq shell-file-name "bash")
     (setq shell-command-switch "-c")      ; SHOULD IT BE (setq shell-command-switch "-ic")?
     (setq explicit-shell-file-name "bash") ;;term.el
     (setenv "SHELL" explicit-shell-file-name)
     (setq explicit-bash-args '("-login" "-i"))
     (make-variable-buffer-local 'comint-completion-addsuffix)
     (setq comint-completion-addsuffix t);;目录补全时,在末尾加一个"/"字符
     (setq comint-eol-on-send t)
     (setq comint-file-name-quote-list '(?\  ?\")) ;;当文件名中有这些(空格引号)特殊字符时会把这些特殊字符用"\"转义
     (setq w32-quote-process-args ?\")  ;;再给程序传递参数的时候,使用这个字符将参数括起来
     (eval-after-load 'ediff-diff '(progn (setq ediff-shell shell-file-name))) ;;Ediff shell
     (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m nil t)
     ;; Unfortunately, when you visit a DOS text file within an
     ;; encoded file, you'll see CRs (^Ms) in the buffer.
     ;; If `binary-process-output' is set to `nil', this problem goes
     ;; away, which is fine for files of type `.gz'.
     (setq binary-process-input t)
     (setq binary-process-output nil)
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
  (set-shell-bash)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ))


;; ;;(setq exec-path (cons "C:/cygwin/bin" exec-path))
;; ;;(setq shell-file-name "C:/cygwin/bin/bash.exe") ; Subprocesses invoked via the shell.
;; ;;(setenv "SHELL" shell-file-name)
;; ;;(setenv "PATH" (concat (getenv "PATH") ";C:\\cygwin\\bin"))
;; ;;(setq explicit-shell-file-name shell-file-name) ; Interactive shell





;; ;;dired 使用外部的ls 程序
(setq ls-lisp-use-insert-directory-program t)      ;; use external ls
(setq insert-directory-program "ls") ;; ls program name

;;;dired 下,"Z" 无法使用gunzip 解压文件,原因是gunzip 是一个指向gzip的软链接,
(eval-after-load 'dired-aux
  '(progn
     (defadvice dired-check-process (around gunzip-msys-symlink activate)
       "on msys ,the gunzip is a symlink to gzip ,and dired can't
        fine gunzip.exe to uncompress,this advice ,replace gunzip
        with gzip -d"
       (when (string-equal program "gunzip")
         (setq program "gzip")
         (add-to-list 'arguments "-d"))
       ad-do-it
       )))


;; (global-set-key (kbd "C-x C-b") 'joseph-hide-frame)
;; (global-set-key (kbd "C-x C-z") 'joseph-hide-frame)
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

;;这台机器用是日文系统 ,所以一些配置,采用日文编码
(when (equal system-name "SB_QINGDAO")
  (setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码
;  (setq file-name-coding-system 'shift_jis-dos) ;;文件名所用的编码,不过这样,中文文件名就有问题了
  (setq file-name-coding-system 'undecided-unix)
   (prefer-coding-system 'utf-8)
  )

;;中文系统采用的编码
(unless (equal system-name "SB_QINGDAO")
 (setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码
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


(provide 'joseph-w32)


