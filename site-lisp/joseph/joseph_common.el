;;;;Time-stamp: <jixiuf 2010-12-19 15:09:20>
(tool-bar-mode -1) ;;隐藏工具栏，
;(menu-bar-mode -1)
(setq-default major-mode 'text-mode) ;;设置默认的mode 为text-mode x
;(setq default-directory "d:\program/")
;(set-buffer-file-coding-system 'dos)

(setq inhibit-startup-message t);隐藏启动显示画面
(setq initial-scratch-message nil);关闭scratch消息提示
(setq use-dialog-box nil  )  ;;不使用对话框进行（是，否 取消） 的选择，而是用minibuffer
(setq frame-title-format "<<%b>>   GNU/ Emacs") ;;标题显示文件名，而不是默认的username@localhost
;;;;状态栏显示时间的格式
(setq display-time-24hr-format t)
(setq display-time-interval 30)
(setq display-time-day-and-date t)
(display-time); mode-line 上显示时间

(custom-set-variables
 '(show-paren-mode t) ;显示匹配的括号
 ;;以高度的形式显示匹配的括号,默认光标会跳到匹配的括号端
 '(show-paren-style (quote parenthesis))
 )

(setq default-fill-column 60) ;;把 fill-column 设为 60. 这样的文字更好读。,到60字自动换行
(setq-default indent-tabs-mode nil tab-width 4) ;用空格代替tab

(setq x-stretch-cursor nil);;如果设置为t，光标在TAB字符上会显示为一个大方块:)
;(setq track-eol t) ;; 当光标在行尾上下移动的时候，始终保持在行尾。
(blink-cursor-mode -1);光标不要闪烁
;(setq-default cursor-type 'bar);;光标显示为一竖线
;;;防止頁面滾動時跳動 scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-step 3 scroll-margin 10 scroll-conservatively 10000)
(setq resize-mini-windows t) ;;允许minibuffer自由变化其大小（指宽度）
(setq column-number-mode t) ;状态栏显行号
(scroll-bar-mode nil);;取消滚动条
(mouse-wheel-mode t);;支持鼠标滚轮
(mouse-avoidance-mode 'animate) ;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了 X下 
(fset 'yes-or-no-p 'y-or-n-p) ;; 把Yes用y代替
;(setq next-line-add-newlines t);到达最后一行后继续C-n将添加空行


(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil); ;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。 

;;{{{ 设置不同的文件使用不同的mode 

(mapcar
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$".  nxml-mode)
   ("\\\.sh" . sh-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("\\.html$" . html-mode)
   ("\\.jsp$" . html-mode)
   ("\\.idl$" . idl-mode)))

;;}}}
;;{{{ 设置备份文件的位置
(setq backup-by-copying t    ;自动备份
     backup-directory-alist  '(("." . "~/.backup"))
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 10   ; 保留最近的6个备份文件
     kept-old-versions 2   ; 保留最早的2个备份文件
     version-control t)    ; 多次备份

;;}}} 
;;{{{ 关于会话session desktop 的设置
;; ;记住上次打开的文件，第一次加入此代码，需要运行一次desktop-save命令
;; (load "desktop") (desktop-load-default) (desktop-read)
;;      (setq desktop-save-mode 1) ;;每次退出时自动保存会话
;; (setq desktop-load-locked-desktop t) ;;即便会话文件被其他进程锁定也加载，（我只用一个会话文件，所以加载）

;; ;;session管理 ，会记住上次的上次离开 Emacs 时的全局变量 (kill-ring，命令记录……)，局部变量，寄存器，打开的文件，修改过的文件和最后修改的位置
;; (require 'session) (add-hook 'after-init-hook 'session-initialize)
;;}}}


;;;;Time-stamp: <jixiuf 2010-12-19 12:54:48>
;(setq user-full-name "Joseph")
;(setq user-mail-address "jixiuf@gmail.com")
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%:u %04y-%02m-%02d %02H:%02M:%02S")


;; 加入自己的 Info 目录
;; (dolist (path '("/media/hdb1/Programs/Emacs/home/info/perlinfo"
;;                 "/media/hdb1/Programs/Emacs/home/info"
;;                 "~/info" "~/info/perlinfo"))
;;   (add-to-list 'Info-default-directory-list path))

(provide 'joseph_common)




;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
