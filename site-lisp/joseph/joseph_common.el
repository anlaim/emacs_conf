;;; -*- coding:utf-8 -*-
;; Last Updated: 纪秀峰 2013-11-18 21:45:35 
;;; byte complie

(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;; other
(setq user-full-name "纪秀峰")
(setq user-login-name "Joseph")
(setq user-mail-address "jixiuf@gmail.com")
;;will reduce the number of messages that appear in the "*Messages*" window to 512.
(setq-default message-log-max 512)
;; (setq-default major-mode 'text-mode) ;;设置默认的mode 为text-mode x

(setq-default inhibit-startup-screen t);隐藏启动显示画面
(setq-default initial-scratch-message nil);关闭scratch消息提示
;; (setq  inhibit-startup-hooks nil)
;; (joseph-add-hooks
;;  'emacs-startup-hook '(lambda () "" (interactive) (kill-buffer "*scratch*") (kill-buffer (get-buffer  "*GNU Emacs*")) (message "ddddddddd")))
(setq-default use-dialog-box nil  )  ;;不使用对话框进行（是，否 取消） 的选择，而是用minibuffer

;;; frame Title
;; (defun joseph-set-frame-title()
;;   "show correct buffer name even in minibuffer"
;;   (let* ((title "")
;;          (size)
;;          (win-buf  (if (minibufferp)(window-buffer (next-window ))  (current-buffer)))
;;          (file-name (buffer-file-name win-buf))
;;          )
;;     (setq title (concat (buffer-name win-buf) "  "))
;;     (setq size (cond
;;                 ((> (buffer-size win-buf) 1000000) (format "%.1fM" (/ (buffer-size win-buf) 1000000.0)))
;;                 ((> (buffer-size win-buf) 1000) (format "%.1fk" (/ (buffer-size win-buf) 1000.0)))
;;                 (t (format "%d" (buffer-size win-buf)))))
;;     (setq title (format "  %s[%s]   %s    GNU/Emacs" title size (or file-name "")))
;;     title))

;; (setq frame-title-format '( (:eval (joseph-set-frame-title))))

(setq-default frame-title-format "%b  [%I] %f  GNU/Emacs") ;;标题显示文件名，而不是默认的username@localhost
;; (setq frame-title-format '("%b - " *user* "@" *hostname*
;;                            (:eval (concise-network-location)) " - "
;;                            (:eval (concise-buffer-file-name))))

;;; 状态栏显示时间的格式
;;(require 'time)
(setq-default display-time-24hr-format t)
(setq-default display-time-day-and-date t)
(setq-default display-time-interval 10)
(setq-default display-time-format "%m月%d日 %H:%M分 周%w")
(setq-default display-time-default-load-average nil)
;; (display-time); mode-line 上显示时间
(display-time-mode t)

(column-number-mode t);;状态栏显示行号

;;; mode-line 上显示当前文件是什么系统的文件(windows 的换行符是\n\r)
(setq-default
 eol-mnemonic-dos "\\nr"
 eol-mnemonic-unix "\\n"
 eol-mnemonic-mac "\\r"
 eol-mnemonic-undecided "[?]"
 )

;; ** – modified since last save
;; -- – not modified since last save
;; %* – read-only, but modified
;; %% – read-only, not modifed

;;; 看没看见此文件的开头两三行处有一个 Last Updated: <Joseph 2011-05-29 11:10:43>
;;在你每次保存文件的时候，更新上面所对应的时间，
;;前提是文件开头，你得有 Time-stamp: <> 字样，或Time-stamp: ""字样
(add-hook 'write-file-hooks 'time-stamp)
;;时间戳的格式为"用户名 年-月-日时:分:秒 星期"
(setq-default  time-stamp-format "%:U %04y-%02m-%02d %02H:%02M:%02S ")
(setq-default time-stamp-start "Last \\([M|m]odified\\|[r|R]evised\\|[u|U]pdated?\\)[ \t]*: +")
(setq-default time-stamp-end "$" )
(setq-default time-stamp-active t time-stamp-warn-inactive t)

;;; (require 'paren)
;; (show-paren-mode 1) ;显示匹配的括号
;;以高亮的形式显示匹配的括号,默认光标会跳到匹配的括号端，晃眼
(setq-default show-paren-style  'parenthesis)

(setq-default fill-column 78) ;;把 fill-column 设为 60. 这样的文字更好读。,到60字自动换行
(setq-default indent-tabs-mode nil tab-width 4) ;用空格代替tab

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


(setq-default x-stretch-cursor nil);;如果设置为t，光标在TAB字符上会显示为一个大方块
;(setq track-eol t) ;; 当光标在行尾上下移动的时候，始终保持在行尾。
(blink-cursor-mode 1);光标闪烁
(setq-default cursor-type 'bar);;光标显示为一竖线
;;中键点击时的功能
;;不要在鼠标中键点击的那个地方插入剪贴板内容。
;;而是光标在什么地方,就在哪插入(这个时候光标点击的地方不一定是光标的所在位置)
(setq-default mouse-yank-at-point t)
;; (setq-default kill-ring-max 200) ;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西,默认是60个
 (delete-selection-mode 1) ;;当选中内容时，输入新内容则会替换掉,启用delete-selection-mode
(setq-default kill-whole-line t) ;; 在行首 C-k 时，同时删除末尾换行符
(put 'scroll-left 'disabled nil);;允许屏幕左移
;;(put 'scroll-right 'disabled nil);;允许屏幕右移
;;
;;;防止頁面滾動時跳動 scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，(setq-default scroll-step 1 scroll-margin 0 scroll-conservatively 10000)

(setq-default kill-read-only-ok t);;kill read-only buffer内容时,copy之而不用警告
(setq-default kill-do-not-save-duplicates t) ;;不向kill-ring中加入重复内容

(mouse-wheel-mode  1);;支持鼠标滚动
;;鼠标在哪个window上,滚动哪个窗口,不必focus后才能滚动
(setq-default mouse-wheel-follow-mouse  t)
(mouse-avoidance-mode 'animate) ;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了 X下
 ;; scroll one line at a time (less "jumpy" than defaults)
(setq-default mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(scroll-bar-mode -1);;取消滚动条

(setq-default column-number-mode t) ;状态栏显行号
(fset 'yes-or-no-p 'y-or-n-p) ;; 把Yes用y代替
;(setq next-line-add-newlines t);到达最后一行后继续C-n将添加空行
;;(setq-default line-spacing 1);;设置行距
(setq-default sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq-default sentence-end-double-space nil); ;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

;;; 设置不同的文件使用不同的mode
(autoload 'js2-mode "js2" nil t)
(autoload 'csharp-mode "csharp-mode-0.8.5" "Major mode for editing C# code." t)
(autoload 'thrift-mode "thrift-mode" "Major mode for editing thrift code." t)

(defconst my-protobuf-style
  '((c-basic-offset . 8)
    (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook
          (lambda () (c-add-style "my-style" my-protobuf-style t)))


;;; 设置备份文件的位置

;;(require 'tramp)
(setq-default tramp-persistency-file-name  "~/.emacs.d/cache/tramp")
(setq-default backup-by-copying t    ;自动备份
              delete-old-versions t ; 自动删除旧的备份文件
              kept-new-versions 10   ; 保留最近的6个备份文件
              kept-old-versions 2   ; 保留最早的2个备份文件
              version-control t)    ; 多次备份
(setq-default backup-directory-alist `((".*" . "~/.emacs.d/cache/backup_files/")))
(setq-default auto-save-file-name-transforms `((".*" "~/.emacs.d/cache/backup_files/" t)))
(setq-default auto-save-list-file-prefix   "~/.emacs.d/cache/backup_files/saves-")
(setq-default abbrev-file-name   "~/.emacs.d/cache/abbrev_defs")
(message "Deleting old backup files 7 days ago...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files "~/.emacs.d/cache/backup_files" t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (nth 5 (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))
;;在auto-save到另外一个文件的同时,也保存到当前的文件
;;
(defun save-buffer-if-visiting-file (&optional args)
  "如果此buffer与文件进行了关联，则保存之."
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p)
           (not buffer-read-only)
           (not (string-match "ssh:" (buffer-file-name))))
      (save-buffer args)))
(add-hook 'auto-save-hook 'save-buffer-if-visiting-file)

;;; 关于会话session desktop 的设置

;; ;记住上次打开的文件，第一次加入此代码，需要运行一次desktop-save命令
;; (load "desktop")
;; (setq-default desktop-path (list joseph_cache_path))
;; (setq-default desktop-base-file-name   "emacs.desktop")
;; (setq-default desktop-base-lock-name   "emacs.desktop.lock")
;; (setq-default desktop-missing-file-warning nil)
;; (setq-default desktop-load-locked-desktop t) ;;即便会话文件被其他进程锁定也加载，（我只用一个会话文件，所以加载）
;; (setq-default desktop-save t)
;; (setq-default desktop-save-mode t);;每次退出时自动保存会话
;; (dolist (var (list 'command-history 'kill-ring 'file-name-history 'find-symbol-last-symbol
;;                         'extended-command-history 'grep-history 'compile-history 'last-template
;;                         'minibuffer-history 'query-replace-history 'regexp-history
;;                         'shell-command-history 'recentf-open-last-file 'describe-symbol-last-symbol
;;                         'switch-major-mode-last-mode))
;;        (add-to-list 'desktop-globals-to-save var))

;; (add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
;; (add-to-list 'desktop-locals-to-save 'tab-width)
;; (desktop-read)
;; ;;session管理 ，会记住上次的上次离开 Emacs 时的全局变量 (kill-ring，命令记录……)，局部变量，寄存器，打开的文件，修改过的文件和最后修改的位置
;; (require 'session)
;; (setq session-save-file "/home/jixiuf/.emacs.d/cache/session")
;; (add-hook 'after-init-hook 'session-initialize)

;;记住上次访问时的行号
(setq-default save-place t)
(require 'saveplace)
(setq-default save-place-file "~/.emacs.d/cache/saveplace")

(require 'savehist)
(setq-default savehist-file "~/.emacs.d/cache/savehist_history")
(setq savehist-additional-variables
      '( helm-replace-string-history
         helm-replace-string-history-candidates
         helm-dired-history-variable
         mew-passwd-alist
         kill-ring
         sqlserver-connection-info
         mysql-connection-4-complete
         sql-server
         sql-database
         sql-user
         magit-repo-dirs
         ))
(savehist-mode 1)



;;; (require 'bookmark)
(setq-default bookmark-default-file "~/.emacs.d/cache/bookmark")


;(find-function-setup-keys)
;; 加入自己的 Info 目录
;; (dolist (path '("/media/hdb1/Programs/Emacs/home/info/perlinfo"
;;                 "/media/hdb1/Programs/Emacs/home/info"
;;                 "~/info" "~/info/perlinfo"))
;;   (add-to-list 'Info-default-directory-list path))
;;防止buffer重名
(require 'uniquify)
(setq-default uniquify-buffer-name-style 'forward)

;;打开只读文件时,默认也进入view-mode.
(setq-default view-read-only t)
(setq-default large-file-warning-threshold nil);;打开大文件时不必警告

;;用 (require 'ethan-wspace)所以，取消require-final-newline的 customize
;; (setq-default require-final-newline t);; 文档末尾插入空行


;;注意这两个变量是与recentf相关的,把它放在这里,是因为
;;觉得recentf与filecache作用有相通之处,
(setq-default recentf-save-file "~/.emacs.d/cache/recentf")
;;匹配这些表达示的文件，不会被加入到最近打开的文件中
(setq-default recentf-exclude  `("\\.elc$" ,(regexp-quote (expand-file-name "~/.emacs.d/cache/"))  "^/tmp/" "/ssh:" "^/sudo:" "/TAGS$" "java_base.tag" ".erlang.cookie" "xhtml-loader.rnc"))
(setq-default recentf-max-saved-items 300)
(recentf-mode 1)

(setq-default ring-bell-function '(lambda()"do nothing" ))
(setq echo-keystrokes -1);;立即回显，(当你按下`C-x'等，命令前缀时，立即将显回显，而不是等一秒钟)


;;; 关于没有选中区域,则默认为选中整行的advice
;;;;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "已选中当前行!")
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice clipboard-kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;;; linum-mode 太慢了
;;(global-linum-mode)


;;(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
;; 因为经常按出c-x c-u，总是出upcase region的警告，
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(add-to-list 'byte-compile-not-obsolete-vars 'font-lock-beginning-of-syntax-function)
(add-to-list 'byte-compile-not-obsolete-vars 'font-lock-syntactic-keywords)
(setq-default safe-local-variable-values (quote ((folded-file . t) (tab-always-indent . nil))))


;; after-init-hook 所有配置文件都加载完之后才会运行此hook
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(defun after-init-hook-fun()
  (when (get-buffer "*Compile-Log*" ) (with-current-buffer  "*Compile-Log*" (append-to-buffer "*Messages*" (point-min)(point-max))) (kill-buffer  "*Compile-Log*"))
  (when (get-buffer "*compilation*" ) (with-current-buffer  "*compilation*" (append-to-buffer "*Messages*" (point-min)(point-max)))(kill-buffer  "*compilation*"))
  (setq auto-mode-alist
        (append
         '(
           ("\\.lua$" . lua-mode)
           ("\\.scpt\\'" . applescript-mode)
           ("\\.applescript$" . applescript-mode)
           ("/\\.?gitconfig\\'" . gitconfig-mode)
           ("/\\.git/config\\'" . gitconfig-mode)
           ("crontab\\'" . crontab-mode)
           ("\\.cron\\(tab\\)?\\'" . crontab-mode)
           ("cron\\(tab\\)?\\."    . crontab-mode)
           ("\\.mxml" . nxml-mode)
           ("\\.as" . actionscript-mode)
           ("\\.proto\\'" . protobuf-mode)
           ("\\.thrift" . thrift-mode)
           ("\\.md" . markdown-mode)
           ("\\.\\(frm\\|bas\\|cls\\|vba\\|vbs\\)$" . visual-basic-mode)
           ("\\.yaws$" . joseph-nxhtml-mode)
           ("\\.hrl$" . erlang-mode)
           ("\\.erl$" . erlang-mode)
           ("\\.rel$" . erlang-mode)
           ("\\.app$" . erlang-mode)
           ("\\.app.src$" . erlang-mode)
           ("\\.ahk$\\|\\.AHK$" . xahk-mode)
           ("\\.bat$"   . batch-mode)
           ("\\.cmd$"   . batch-mode)
           ("\\.pl$"   . cperl-mode)
           ("\\.pm$"   . cperl-mode)
           ("\\.perl$" . cperl-mode)
           ("\\.sqlo$"  . oracle-mode)
           ("\\.sqlm$"  . mysql-mode)
           ("\\.sqlms$"  . sqlserver-mode)
           ("\\.js$"  . js2-mode)
           ("\\.txt$" . org-mode)
           ("\\.doc$" . org-mode)

           ("\\.resx$" . nxml-mode)
           ("\\.xaml$" . nxml-mode)
           ("\\.xml$".  nxml-mode)
           ("\\.xsd$".  nxml-mode)

           ("\\.html$"  . joseph-nxhtml-mode)
           ("\\.htm$"   . joseph-nxhtml-mode)
           ("\\.phtml$" . joseph-nxhtml-mode)
           ("\\.php3$"  . joseph-nxhtml-mode)

           ("\\.jsp$" . joseph-nxhtml-mode)
           ("\\.java$" . java-mode)
           ("\\.cs$" . csharp-mode)

           ("\\.css$" . css-mode)
           ("\\.c$" .   c-mode)

           ("\\.C$" .   c++-mode)
           ("\\.cc$" .  c++-mode)
           ("\\.cpp$" . c++-mode)
           ("\\.cxx$" . c++-mode)
           ("\\.h$" .   c++-mode)
           ("\\.hh$" .  c++-mode)
           ("\\.hxx$" . c++-mode)


           ;;         ("\\.a$" .   asm-mode)
           ("\\.asm$".  asm-mode)
           ("\\.s$" .   asm-mode)

           ("\\.sh$" .   shell-script-mode)
           ("\\.zsh$" .  shell-script-mode)
           ("\\rc$" .    shell-script-mode)
           ("\\.el$" .   emacs-lisp-mode)
           ("\\.p$" .    pascal-mode)
           ("\\.pas$" .    pascal-mode)

           ("\\.tex$" . latex-mode)
           ("\\.tei$" . latex-mode)
           ("\\.ind$" . latex-mode)
           ("\\.ptx$" . TeX-mode)
           ("\\.aux$" . plain-tex-mode)
           ("\\.bbl$" . plain-tex-mode)
           ("\\.toc$" . plain-tex-mode)
           ("\\.lof$" . plain-tex-mode)
           ("\\.lot$" . plain-tex-mode)
           ("\\.idx$" . plain-tex-mode)
           ("\\.ind$" . plain-tex-mode)
           ("\\.glo$" . plain-tex-mode)

           ("\\.txi$" . Texinfo-mode)
           ("\\.w$"   . cweb-mode)
           ("\\.ch$"  . cweb-mode)
           ("\\.web$" . web-mode)


           ("mutt-" .  mail-mode)

           ("makefile" .  makefile-mode)
           ("Makefile" .  makefile-mode)
           ("\\.am$" .   makefile-mode)
           ("\\.mk$" .   makefile-mode)
           ("\\.mak$" .  makefile-mode)
           ("\\.make$" . makefile-mode)

           ;;         ("\\.html$"  . html-helper-mode)
           ;;         ("\\.htm$"   . html-helper-mode)
           ;;         ("\\.phtml$" . html-helper-mode)
           ;;         ("\\.php3$"  . html-helper-mode)

           ("\\.sgml$" . sgml-mode)
           ("\\.m$" .    octave-mode)

           ("\\.ma$"   . maplev-mode)
           ;;         ("\\.map$"   . maplev-mode)
           ;;         ("\\^maple-" . maple-mode)
           ("\\.maple$" . maplev-mode)
           ("\\.mpl$"   . maplev-mode)

           ("\\.mu$" .   mupad-mode)

           ("\\.mc$"   . maxima-mode)

           ("\\.gp$"  . gp-script-mode)
           ("\\.gpi$"  . gp-script-mode)
           ;;         ("\\.gp$"  . shell-script-mode)

           ("\\.bin$" . hexl-mode)
           ("\\.rb$" . ruby-mode)
           ("\\.py\\'" . python-mode)
           )
         auto-mode-alist
         )
        )
  )
(add-hook 'after-init-hook 'after-init-hook-fun)

(provide 'joseph_common)
