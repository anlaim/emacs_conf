(tool-bar-mode -1) ;;隐藏菜单，
;(menu-bar-mode -1)
 (setq-default major-mode 'text-mode) ;;设置默认的mode 为text-mode x


(setq inhibit-startup-message t);隐藏启动显示画面
;(setq initial-scratch-message "")
(setq initial-scratch-message nil);关闭scratch消息提示
(setq use-dialog-box nil  )  ;;不使用对话框进行（是，否 取消） 的选择，而是用minibuffer
(setq frame-title-format "<<%b>>   GNU/ Emacs") ;;标题显示文件名，而不是默认的username@localhost
;(setq frame-title-format '("GNU/Emacs - [ " (buffer-file-name "%f \]" (dired-directory dired-directory "%b \]"))))
;;;;状态栏显示时间的格式
;; (setq display-time-24hr-format t)
;; (setq display-time-interval 30)
;; (setq display-time-day-and-date t)
;; (display-time); mode-line 上显示时间



(setq default-fill-column 60) ;;把 fill-column 设为 60. 这样的文字更好读。,到60字自动换行
(setq tab-stop-list ()) (loop for x downfrom 40 to 1 do (setq tab-stop-list (cons (* x 4) tab-stop-list)))
(setq-default indent-tabs-mode nil tab-width 4) ;用空格代替tab

(setq x-stretch-cursor nil);;如果设置为t，光标在TAB字符上会显示为一个大方块:)
(setq track-eol t) ;; 当光标在行尾上下移动的时候，始终保持在行尾。
(blink-cursor-mode -1);光标不要闪烁
;(setq-default cursor-type 'bar);;光标显示为一竖线
;;(setq default-major-mode 'text-mode)
;;;防止頁面滾動時跳動 scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)
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


;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。
 (setq mouse-yank-at-point t)
 (setq kill-ring-max 200) ;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西



(ido-mode t) ;;启用ido模式，C-x C-f 查找文件时的一种模式

(setq dired-recursive-copies 'top) ;;让 dired 可以递归的拷贝和删除目录。 
(setq dired-recursive-deletes 'top)

;;智能标记
;;根据光标所在位置的字符，智能标记区域。如果光标在一个单词上，
;;那就标记这个单词。如果光标在一个括号上，那么就标记括号对之间的内容。调用快捷键是 C-3
(defun wcy-mark-some-thing-at-point()
  (interactive)
  (let* ((from (point))
         (a (mouse-start-end from from 1))
         (start (car a))
         (end (cadr a))
         (goto-point (if (= from start )
                       end
                       start)))
    (if (eq last-command 'wcy-mark-some-thing-at-point)
      (progn
        ;; exchange mark and point
        (goto-char (mark-marker))
        (set-marker (mark-marker) from))
      (push-mark (if (= goto-point start) end start) nil t)
      (when (and (interactive-p) (null transient-mark-mode))
        (goto-char (mark-marker))
        (sit-for 0 500 nil))
      (goto-char goto-point))))
(define-key global-map (kbd "C-3") 'wcy-mark-some-thing-at-point)
(define-key global-map (kbd "M-C-SPC") 'wcy-mark-some-thing-at-point)


; Allow completions like em-s-region to complete to emacspeak-speak-region
;;部分补全 如em-s-region 会被 补全为emacspeak-speak-region
;(partial-completion-mode)

(provide 'joseph_common)



;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
