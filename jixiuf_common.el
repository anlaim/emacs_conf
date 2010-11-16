(tool-bar-mode -1) ;;隐藏菜单，
;(menu-bar-mode -1)

(setq inhibit-startup-message t);隐藏启动显示画面
(setq initial-scratch-message "")
(setq use-dialog-box nil  )  ;;不使用对话框进行（是，否 取消） 的选择，而是用minibuffer

;;状态栏显示时间的格式
(setq display-time-24hr-format t)
(setq display-time-interval 30)
;(setq display-time-day-and-date t)
(display-time); mode-line 上显示时间

(setq-default save-place t) ;记住光标位置,再次打开同一个文件，光标处在相同位置
(require 'saveplace)

;设置备份文件的位置
(setq
     backup-by-copying t    ;自动备份
     backup-directory-alist  '(("." . "~/.backup"))
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 6   ; 保留最近的6个备份文件
     kept-old-versions 2   ; 保留最早的2个备份文件
     version-control t)    ; 多次备份
;;关于剪切板
(setq x-select-enable-clipborad t) ;选中内容，即copy ,可以在其它程序中粘贴。
;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(define-key ctl-x-map "y" 'clipboard-yank)
;(global-set-key  "\C-x y" 'clipboard-yank)
;(set-clipboard-coding-system 'chinese-iso-8bit) ;; 剪切板，用于和其他程序之间复制内容
;(set-clipboard-coding-system 'ctext)
;; For my language code setting (UTF-8)设置编码
 (setq current-language-environment "UTF-8")
 (setq locale-coding-system 'utf-8)
 (set-terminal-coding-system 'utf-8)
 (set-keyboard-coding-system 'utf-8)
 (set-selection-coding-system 'utf-8)
 (prefer-coding-system 'utf-8)
;;;;copy 整个缓冲区到剪切板，与其他程序共享
(global-set-key [C-f5] 'my-copy-buffer)
(defun my-copy-buffer ()
  "copy whole buffer to clipboard."
  (interactive)
  (beginning-of-buffer)
  (setq start (point))
  (end-of-buffer)
  (setq end (point))
  (clipboard-kill-ring-save start end)
  )

;;前景背景色
(add-to-list 'default-frame-alist '(background-color . "#2e2d28") )
(add-to-list 'default-frame-alist  '(foreground-color . "#f7f8c6"))
(add-to-list 'default-frame-alist  '(cursor-color . "white") )
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
;;;;字体设置
;;(set-fontset-font "fontset-default" 'gb18030 '("WenQuanYi Bitmap Song" . "unicode-bmp")) ;; 设置中文字体  
;; (set-default-font "Courier New-13")  
;; (set-fontset-font "fontset-default" 'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))
;; (create-fontset-from-fontset-spec
;;  "-misc-dejavu sans mono-bold-r-normal--0-0-0-0-m-0-fontset-mymono,
;;  chinese-gb2312:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1,
;;  chinese-gbk:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1,
;;  chinese-gb18030:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1"
;; )

;; (setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))
;; (set-default-font "fontset-mymono")
;(set-fontset-font "fontset-default" 'ascii '("WenQuanYi Bitmap Song" . "unicode-bmp")) ;; 设置中文字体  
;; (set-fontset-font "fontset-default" 'cjk-misc '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'han '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'bopomofo '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'symbol '("YaHei Consolas Hybrid" . "unicode-bmp"))



(setq resize-mini-windows t) ;;允许minibuffer自由变化其大小（指宽度）
(setq column-number-mode t) ;状态栏显行号
(scroll-bar-mode nil);;取消滚动条
(mouse-wheel-mode t);;支持鼠标滚轮
(mouse-avoidance-mode 'animate) ;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了 X下 
(fset 'yes-or-no-p 'y-or-n-p) ;; 把Yes用y代替
;(setq next-line-add-newlines t);到达最后一行后继续C-n将添加空行
(global-set-key [(meta g)] 'goto-line) ;alt+g 跳到指定行

;;java c c++里自动补全() {} []
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
;;                   (?` ?` _ "''")
                   (?\( ?  _ " )")
                   (?\[ ?  _ " ]")
                   (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
(add-hook 'java-mode-hook 'my-c-mode-auto-pair)

(setq-default indent-tabs-mode nil tab-width 4) ;用空格代替tab
(setq track-eol t) ;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq default-major-mode 'text-mode)
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

;alt+/ 代码补全
(global-set-key [(meta /)] 'hippie-expand)
(require 'hippie-exp)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        yas/hippie-try-expand
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-expand-whole-kill))
;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;默认情况下C-w剪切一个区域，但是如果没有区域被选中，则剪切当前行
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))


;Emacs下c-s对应渐进搜索。不过我们更多的时候需要搜索某种模式，所以用得最多的还是渐进式的正则表达式搜索。正则表达式搜索有个烦人的问题：搜索结束时光标不一定停留在匹配字串的开端。幸好这个问题容易解决：
;头两行重新绑定标准搜索键c-s和c-r，把isearch换成regex-isearch。后面三行加入定制函数。关键的语句是(goto-char isearch-other-end)，保证光标停留在匹配字串的开头，而不是缺省的末尾。
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control r)] 'isearch-backward-regexp)
;; Always end searches at the beginning of the matching expression.
(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))


(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; 退出 emacs 时，自动关闭当前 buffer 


(show-paren-mode t) ;;高亮显示匹配的括号
(setq show-paren-style 'parenthesis);;;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。

;;shell emacs 之间快速切换
  (autoload 'shell-toggle "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
  (autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
  (global-set-key [M-f1] 'shell-toggle)
  (global-set-key [C-f1] 'shell-toggle-cd)


;;两个切换buffer的选项，比默认的好
;; (require 'ibuffer)
;; (global-set-key ( kbd "C-x C-b ")' ibuffer)
;;CRM bufer list
(global-set-key "\C-x\C-b" 'electric-buffer-list)

;; (load "gnuserv-compat")
;; (load-library "gnuserv")
;; (gnuserv-start)
;; ;; When loading files reuse existing frames.
;; (setq gnuserv-frame (car (frame-list)))


 (provide 'jixiuf_common)




 
