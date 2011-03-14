(tool-bar-mode -1);;关闭工具栏
(global-set-key (kbd "C-x C-b") 'make-frame-invisible)
(global-set-key (kbd "C-x C-z") 'make-frame-invisible)
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
