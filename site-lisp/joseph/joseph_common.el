;;; -*- coding:utf-8 -*-
;;;;Time-stamp: <Joseph 2011-08-08 23:00:20 星期一>

;;; byte complie

(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
(require 'joseph_byte_compile_include)

(setq user-full-name "孤峰独秀")
(setq user-login-name "Joseph")
(setq user-mail-address "jixiuf@gmail.com")
;;在windows 上设置打开文件时默认的目录为d:/,而非 几乎永远不会在这里放文件的C:\Documents and Settings\Administrator
(when (equal system-type 'windows-nt)(setq default-directory "d:/"))
;;will reduce the number of messages that appear in the "*Messages*" window to 512.
(setq-default message-log-max 512)
(setq-default major-mode 'text-mode) ;;设置默认的mode 为text-mode x

(setq-default inhibit-startup-message t);隐藏启动显示画面
(setq-default initial-scratch-message nil);关闭scratch消息提示
(setq-default use-dialog-box nil  )  ;;不使用对话框进行（是，否 取消） 的选择，而是用minibuffer
(setq-default frame-title-format "%b  [%I] %f  GNU/Emacs") ;;标题显示文件名，而不是默认的username@localhost

;;; 状态栏显示时间的格式
;;(require 'time)
(setq-default display-time-24hr-format t)
(setq-default display-time-day-and-date t)
(setq-default display-time-interval 10)
(setq-default display-time-format "%m月%d日 %A %H:%M")
(display-time); mode-line 上显示时间
(display-time-mode t)
(column-number-mode t);;状态栏显示行号

;;(icomplete-mode 1)
;;; mode-line 上显示当前文件是什么系统的文件(windows 的换行符是\n\r)
(setq-default
 eol-mnemonic-dos "[ms]"
 eol-mnemonic-unix "[ux]"
 eol-mnemonic-mac "[mac]"
 eol-mnemonic-undecided "[?]"
 )
;; ** – modified since last save
;; -- – not modified since last save
;; %* – read-only, but modified
;; %% – read-only, not modifed

;;; 看没看见此文件的开头两三行处有一个 Time-stamp: <Joseph 2011-05-29 11:10:43>
;;在你每次保存文件的时候，更新上面所对应的时间，
;;前提是文件开头，你得有 Time-stamp: <> 字样，或Time-stamp: ""字样
(add-hook 'write-file-hooks 'time-stamp)
;;时间戳的格式为"用户名 年-月-日时:分:秒 星期"
(setq-default  time-stamp-format "%:u %04y-%02m-%02d %02H:%02M:%02S %:a")
(setq-default time-stamp-active t time-stamp-warn-inactive t)

;用空格代替tab进行缩进 ,因为要维持列的位置，tab 的宽度影响移动后光标的位置
(setq-default indent-tabs-mode nil);

;;; (require 'paren)
(show-paren-mode 1) ;显示匹配的括号
 ;;以高亮的形式显示匹配的括号,默认光标会跳到匹配的括号端，晃眼
(setq-default show-paren-style  'parenthesis)
(setq-default fill-column 75) ;;把 fill-column 设为 60. 这样的文字更好读。,到60字自动换行
(setq-default indent-tabs-mode nil tab-width 4) ;用空格代替tab



(setq-default x-stretch-cursor nil);;如果设置为t，光标在TAB字符上会显示为一个大方块
;(setq track-eol t) ;; 当光标在行尾上下移动的时候，始终保持在行尾。
(blink-cursor-mode 1);光标闪烁
;;(setq-default cursor-type t);;光标显示为一竖线
;;中键点击时的功能
;;不要在鼠标中键点击的那个地方插入剪贴板内容。
;;而是光标在什么地方,就在哪插入(这个时候光标点击的地方不一定是光标的所在位置)
(setq-default mouse-yank-at-point t)
(setq-default kill-ring-max 200) ;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西,默认是60个
(delete-selection-mode 1) ;;当选中内容时，输入新内容则会替换掉,启用delete-selection-mode
(setq-default kill-whole-line t) ;; 在行首 C-k 时，同时删除末尾换行符
(put 'scroll-left 'disabled nil);;允许屏幕左移
;;(put 'scroll-right 'disabled nil);;允许屏幕右移
;;
;;;防止頁面滾動時跳動 scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq-default scroll-step 1 scroll-margin 0 scroll-conservatively 10000)

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

(setq-default resize-mini-windows t) ;;允许minibuffer自由变化其大小（指宽度）
(setq-default column-number-mode t) ;状态栏显行号
(fset 'yes-or-no-p 'y-or-n-p) ;; 把Yes用y代替
;(setq next-line-add-newlines t);到达最后一行后继续C-n将添加空行
;;(setq-default line-spacing 1);;设置行距
(setq-default sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq-default sentence-end-double-space nil); ;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

;;; 设置不同的文件使用不同的mode

(setq auto-mode-alist
      (append
       '(
         ("\\.txt$" . org-mode)
         ("\\.doc$" . org-mode)
         ("\\.xaml$" . nxml-mode)
         ("\\.html$"  . nxml-mode)
         ("\\.htm$"   . nxml-mode)
         ("\\.phtml$" . nxml-mode)
         ("\\.php3$"  . nxml-mode)
         ("\\.jsp$" . nxml-mode)

         ("\\.xml$".  nxml-mode)
         ("\\.css$" . css-mode)
         ("\\.c$" .   c-mode)

         ("\\.C$" .   c++-mode)
         ("\\.cc$" .  c++-mode)
         ("\\.cpp$" . c++-mode)
         ("\\.cxx$" . c++-mode)
         ("\\.h$" .   c++-mode)
         ("\\.hh$" .  c++-mode)
         ("\\.hxx$" . c++-mode)

         ("\\.java$" . java-mode)
         ("\\.cs$" . java-mode)

;;         ("\\.a$" .   asm-mode)
         ("\\.asm$".  asm-mode)
         ("\\.s$" .   asm-mode)

         ("\\.sh$" .   shell-script-mode)
         ("\\.zsh$" .  shell-script-mode)
         ("\\rc$" .    shell-script-mode)
         ("\\.pl$"   . perl-mode)
         ("\\.perl$" . perl-mode)
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

;;; 设置备份文件的位置

;;(require 'tramp)
(setq-default tramp-persistency-file-name (concat joseph_root_install_path "cache/tramp"))
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
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (delete-file file))))
;;在auto-save到另外一个文件的同时,也保存到当前的文件
;;
(defun save-buffer-if-visiting-file (&optional args)
  "如果此buffer与文件进行了关联，则保存之."
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p)
           (not (string-match "ssh:" (buffer-file-name))))
      (save-buffer args)))(add-hook 'auto-save-hook 'save-buffer-if-visiting-file)

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

;;(require 'savehist)
(setq-default savehist-file "~/.emacs.d/cache/savehist_history")
(savehist-mode 1)


;;(require 'bookmark)
(setq-default bookmark-default-file "~/.emacs.d/cache/bookmark")


;(find-function-setup-keys)
;; 加入自己的 Info 目录
;; (dolist (path '("/media/hdb1/Programs/Emacs/home/info/perlinfo"
;;                 "/media/hdb1/Programs/Emacs/home/info"
;;                 "~/info" "~/info/perlinfo"))
;;   (add-to-list 'Info-default-directory-list path))
;;防止buffer重名
(require 'uniquify)
(setq-default uniquify-buffer-name-style 'post-forward-angle-brackets)

;;打开只读文件时,默认也进入view-mode.
(setq-default view-read-only t)
(setq-default large-file-warning-threshold nil);;打开大文件时不必警告
(setq-default require-final-newline t);; 文档末尾插入空行


;;读取buffer name 时忽略大小写
(setq-default read-buffer-completion-ignore-case t)
;;读取file name 时忽略大小写
(setq-default read-file-name-completion-ignore-case t)
;;注意这两个变量是与recentf相关的,把它放在这里,是因为
;;觉得recentf与filecache作用有相通之处,
(setq-default recentf-save-file "~/.emacs.d/cache/recentf")
;;匹配这些表达示的文件，不会被加入到最近打开的文件中
(setq-default recentf-exclude (quote ("\\.elc$" "cache/filelist$" "cache/recentf")))
(setq-default recentf-max-saved-items 200)
;;按说只需在emacs 退出的时候保存一次就够了，倒是当emacs --daemon 运行时
;;emacs 退出时，好像许多hook并没来得及运行
(when (equal system-type 'gnu/linux)
  (eval-after-load 'recentf
    '(progn (run-with-timer 600 600 'recentf-save-list)  )))

(when (equal system-type 'windows-nt) (setq visible-bell t))
(setq-default ring-bell-function '(lambda()"do nothing" ))
(setq echo-keystrokes -1);;立即回显，(当你按下`C-x'等，命令前缀时，立即将显回显，而不是等一秒钟)

;; highlight additional keywords

(font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
(dolist (mode '(c-mode c++-mode java-mode lisp-mode emacs-lisp-mode
                       lisp-interaction-mode sh-mode sgml-mode))
  (font-lock-add-keywords
   mode
   '(("\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\):" 1 font-lock-warning-face prepend)
     ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)
     )))

;; highlight too long lines
;;(font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t)))
;;; auto-insert
(setq-default auto-insert-directory "~/.emacs.d/auto-insert/")
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\\.el$" "el-auto-insert")
(define-auto-insert "\\.c$" "c-auto-insert")
(define-auto-insert "\\.org$" "org-auto-insert")
(defadvice auto-insert  (around yasnippet-expand-after-auto-insert activate)
  "expand auto-inserted content as yasnippet templete, so that we could use yasnippet in autoinsert mode"
  (let ((is-new-file (and (not buffer-read-only)
                          (or (eq this-command 'auto-insert)
                              (and auto-insert (bobp) (eobp))))))

    ad-do-it
    (let ((old-point-max (point-max)))
      (when is-new-file
        (goto-char old-point-max)
        (yas/expand-snippet (buffer-substring-no-properties (point-min) (point-max)))
        (delete-region (point-min) old-point-max)
        )
      )
    )
  )

(setq-default safe-local-variable-values (quote ((folded-file . t))))

;;; faces
;;(set-background-color "#2e2d28")
;;(set-foreground-color "#a1aca7")
;;(set-default-font "DejaVu Sans Mono:pixelsize=16")
;;几种不错的颜色 263111棕色 354022浅棕色 ;;48433d  41412e
;; (set-background-color "#263111")
;; (set-mouse-color "GreenYellow")
;; (set-foreground-color "#f7f8c6")
(tool-bar-mode -1);;关闭工具栏
(menu-bar-mode -1)
(setq-default window-system-default-frame-alist
              '( (x ;; if frame created on x display
                  (foreground-color . "#f7f8c6")
                  ;;        (background-color . "#2e2d28") ;;
                  (background-color . "#263111")
                  (cursor-color . "gold")
                  (mouse-color ."gold")
                  (mouse-color . "Gainsboro")
                  ;;         (font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
                  (font . "DejaVu Sans Mono:pixelsize=15"))
                 (w32
                  (foreground-color . "#f7f8c6")
                  ;;        (background-color . "#2e2d28") ;;
                  (background-color . "#263111")
                  (mouse-color . "gold")
                  (cursor-color . "gold")
                  (height . 40)
                  (width . 110)
                  (left . 200)
                  (top . 20)
                 ;; (visibility . nil)
                  ;;         (font . "fontset-gbk")
                  )
                 (nil ;; if on term
                  (background-color . "black")
                  (foreground-color . "white")
                  )))

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
;;; 关于没有选中区域,则默认为选中整行的advice
;;;;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice clipboard-kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;;; linum-mode
(global-linum-mode)

(provide 'joseph_common)


