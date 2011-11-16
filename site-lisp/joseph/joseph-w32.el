;; -*- coding:utf-8 -*-
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph-file-util)
  (require 'ls-lisp)
  )

(setenv "HOME" "d:/")

;;now use bash as my shell ,
;; you can call (set-shell-cmdproxy )here to use cmdproxy as the shell.
;; (set-shell-bash)

;; ;;(setq exec-path (cons "C:/cygwin/bin" exec-path))
;; ;;(setq shell-file-name "C:/cygwin/bin/bash.exe") ; Subprocesses invoked via the shell.
;; ;;(setenv "SHELL" shell-file-name)
;; ;;(setenv "PATH" (concat (getenv "PATH") ";C:\\cygwin\\bin"))
;; ;;(setq explicit-shell-file-name shell-file-name) ; Interactive shell


;;; ;;dired 使用外部的ls 程序
(setq ls-lisp-use-insert-directory-program t)      ;; use external ls
(setq insert-directory-program "ls") ;; ls program name

;;;dired 下,"Z" 无法使用gunzip 解压文件,原因是gunzip 是一个指向gzip的软链接,
(defadvice dired-check-process (around gunzip-msys-symlink activate)
  "on msys ,the gunzip is a symlink to gzip ,and dired can't
        fine gunzip.exe to uncompress,this advice ,replace gunzip
        with gzip -d"
  (when (string-equal program "gunzip")
    (setq program "gzip")
    (add-to-list 'arguments "-d"))
  ad-do-it
  )
;; (eval-after-load 'dired-aux
;;   '(progn
;;      ))


;; (global-set-key (kbd "C-x C-b") 'joseph-hide-frame)
;; (global-set-key (kbd "C-x C-z") 'joseph-hide-frame)
;; (create-fontset-from-fontset-spec
;;  (concat   "-outline-Courier New-normal-normal-normal-mono-15-*-*-*-c-*-fontset-gbk,"
;;            "chinese-gb2312:-outline-新宋体-normal-normal-normal-mono-15-*-*-*-c-*-gb2312.1980-0") t)

;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; ;; The next line is only needed for the MS-Windows clipboard
;; (set-clipboard-coding-system 'utf-16le-dos)
;; (set-frame-font "-outline-SimSun-normal-normal-normal-*-16-*-*-*-p-*-iso8859-1")

(setenv "PATH" (concat (get-system-file-path (expand-file-name "~/gnutls-2.10.1/bin")) ";" (getenv "PATH")))
(add-to-list 'exec-path (expand-file-name "~/gnutls-2.10.1/bin"))

;; mew 用到
(setenv "PATH" (concat (get-system-file-path (expand-file-name "~/.emacs.d/bin/stunnel")) ";" (getenv "PATH")))
(add-to-list 'exec-path (expand-file-name "~/.emacs.d/bin/stunnel"))
;; (setenv "PATH" (concat (get-system-file-path (expand-file-name "~/.emacs.d/bin/mew-6.4/bin")) ";" (getenv "PATH")))
;; (add-to-list 'exec-path (expand-file-name "~/.emacs.d/bin/mew-6.4/bin"))


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
;; (when (equal system-name "SB_QINGDAO")
;;   (setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码
;;                                         ;  (setq file-name-coding-system 'shift_jis-dos) ;;文件名所用的编码,不过这样,中文文件名就有问题了
;;   (setq file-name-coding-system 'undecided-unix)
;;   (prefer-coding-system 'utf-8)
;;   )
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'cp936)
(setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码

;; ;;中文系统采用的编码
;; (unless (equal system-name "SB_QINGDAO")
;; ;;  (setq buffer-file-coding-system 'utf-8) ;;写文件时使用什么编码
;; ;;  (setq file-name-coding-system 'shift_jis-dos);;文件名所用的编码,不过这样,中文文件名就有问题了
;;   )
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
