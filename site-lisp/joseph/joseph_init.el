;;{{{ 时间戳

;;;;Time-stamp: <jixiuf 2010-12-29 16:25:00>

;;}}}

;;{{{ byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;}}}
;; 一些与键绑定相关的配置
(require 'joseph_keybinding);
(require 'joseph_folder)
;;其他零碎的配置都放到joseph_common.el文件
(require 'joseph_common)

;;引入关于vim快捷键相关的一些配置，在joseph_vim.el
(require 'joseph_vim)

;;{{{ 行号的设置

;显行号 引入linum+.el文件
(require 'linum+)
;(global-linum-mode t)
;(set-scroll-bar-mode nil)   ; no scroll bar, even in x-window system (recommended)
;(require 'wb-line-number)
;(wb-line-number-toggle)

;;}}} 

;;{{{ 模仿eclipse 中的一个小功能，用;alt+up alt+down 上下移动当前行
(require 'joseph_move_line)
;;}}}

;;{{{ 所有关于矩形操作的配置都在joseph_rect_angle.el文件中
(require 'joseph_rect_angle)
;;}}}

;;{{{ javascript.el

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;;}}}

;;{{{ joseph_sudo 通过sudo 以root 用户身份打开当前文件(一键切换)
(when (eq system-type 'gnu/linux)
     ;;emacs 自带一个功能实现编辑只读文件C-x C-q  toggle-read-only
     ;; now you can use "C-c o" to toggle between root and common user to edit current file
      (require 'joseph_sudo)
      (global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
      ;;(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file) ;;不好用,可以从脚本里--eval
      )
;;}}}

;;{{{ 所有关于自动补全的功能都在joseph_complete.el 文件中进行配置
(require 'joseph_complete)
;;}}}

;;{{{ 与 剪切板 以及编码相关的东西都在joseph_clipboard_and_encoding.el
(require 'joseph_clipboard_and_encoding)
;;}}}

;;{{{ shell emacs 之间快速切换

   (autoload 'shell-toggle "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
   (global-set-key [M-f1] 'shell-toggle)
;   (autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;  (global-set-key [C-f1] 'shell-toggle-cd)

;;}}}
;;{{{ elpa  a package install

(eval-and-compile
  (add-to-list 'load-path
               (expand-file-name (concat joseph_site-lisp_install_path "elpa/"))) )
;(when (load "package")  (package-initialize)) ;; a tools to downlaod el files
(require 'package)(package-initialize)

;;}}}
;;{{{ browse-kill-ring+ 的设置 ,关于列出剪切环中的内容以供选择
;;不在使用,因为anything 中提供了基本相同的功能
;;when M-y ,will show a window to select stuff in kill-ring
;;      q      quit
;;  	RET 	插入当前 kill-ring 的内容并关闭 browse-kill-ring 的窗口
;;      tab  切换到下一个 (跟n 相同)
;;  	U 	在原来那个窗口里面执行 Undo 命令
;;  	e 	编辑当前 kill-ring 项，编辑完之后按 C-c C-c 提交修改
;;  	d 	输出当前 kill-ring 项
;;  	n 	往前移动
;;  	p 	往后移动
;;  	s 	往前搜索
;;  	r 	往后搜索
;;  	i 	插入当前 kill-ring 项
;;  	y 	插入当前 kill-ring 项
;;  	a 	在末尾添加当前 kill-ring 项
;;  	b 	在开头插入当前 kill-ring 项
;;  	o 	插入当前 kill-ring 项，并把它提升到 kill-ring 的首部
;;  	u 	同上，但是插入之后关闭 browse-kill-ring 窗口
;;  	x 	插入当前 kill-ring 项，并把它从 kill-ring 中删除
;;  	<mouse-2>  	插入鼠标选中的内容

;(require 'second-sel) ;;second-selection support ,i don't use it now 
;;浏览剪切环的工具，使用方法M-y
;; (when (eq system-type 'gnu/linux)
;;       (add-to-list 'load-path  (concat joseph_site-lisp_install_path "browse-kill-ring/" ))
;;       (require 'browse-kill-ring+)
;;       )


;;}}}

;;{{{ tabbar 的设置，注释掉了
;; tabbar
;; (require 'tabbar)
;; (tabbar-mode t)
;; (global-set-key (kbd "M--") 'tabbar-backward-group)
;; (global-set-key (kbd "M-=") 'tabbar-forward-group)
;; (global-set-key (kbd "M-1") 'tabbar-backward)
;; (global-set-key (kbd "M-2") 'tabbar-forward)    
;; (require 'tabbar)
;; (setq tabbar-speedkey-use t)
;; (setq tabbar-speedkey-prefix (kbd "C-z d"))
;; (tabbar-mode 1)
;;}}}

;;{{{ hide-region.el hide-lines.el

(eval-and-compile
  (add-to-list 'load-path
               (expand-file-name (concat joseph_site-lisp_install_path "hide/"))) )
(require 'hide-region)
(global-set-key (kbd "C-z h ") (quote hide-region-hide));;隐藏选区
(global-set-key (kbd "C-z H ") (quote hide-region-unhide));;重现选区
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t) ;;隐藏符合正则表达式的行，或只现示符合的行
(global-set-key (kbd  "C-z l") 'hide-lines);;;All lines matching this regexp will be ;; hidden in the buffer
;;加一个前缀参数C-u C-z l  则 只显示符合表达式的行
(global-set-key (kbd "C-z L" ) 'show-all-invisible);; 显示隐藏的行

;;}}}

;;{{{ 将选区或者当前buffer 生成html格式（带语法着色）
;; M-x htmtize-file 
(require 'htmlize)
;;}}}

;;{{{mmm-mode 多个主major-mode共存
;; ;(add-to-list 'load-path (concat  joseph_root_install_path "mmm-mode-0.4.8"))
;; (require 'mmm-mode)
;; (require 'mmm-auto)
;; (require 'mmm-vars)
;; (require 'mmm-class)
;; (require 'mmm-cmds)
;; (require 'mmm-rpm)
;; (require 'mmm-cweb)
;; (setq mmm-submode-decoration-level 1)
;; ;(setq mmm-global-mode 'maybe)
;; (setq mmm-global-mode t)
;; (mmm-add-mode-ext-class 'html-mode "\\.jsp\\'" 'jsp)
;; ;; (mmm-add-group 'jsp
;; ;;                `((jsp-code
;; ;;                   :submode java
;; ;;                   :match-face (("<%!" . mmm-declaration-submode-face)
;; ;;                                ("<%=" . mmm-output-submode-face)
;; ;;                                ("<%"  . mmm-code-submode-face))
;; ;;                   :front "<%[!=]?"
;; ;;                   :back "%>"
;; ;;                   :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
;; ;;                            (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
;; ;;                            (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;; ;;                   )
;; ;;                  (jsp-directive
;; ;;                   :submode text-mode
;; ;;                   :face mmm-special-submode-face
;; ;;                   :front "<%@"
;; ;;                   :back "%>"
;; ;;                   :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @))
;; ;;                   )))

;; ;; (mmm-add-group
;; ;;      'fancy-html
;; ;;      '(
;; ;;        (html-php-tagged
;; ;;         :submode php-mode
;; ;;         :face mmm-code-submode-face
;; ;;         :front "<[?]php"
;; ;;         :back "[?]>")
;; ;;        (html-css-attribute
;; ;;         :submode css-mode
;; ;;         :face mmm-declaration-submode-face
;; ;;         :front "styleNO=\""
;; ;;         :back "\"")
;; ;;        (jsp-code
;; ;;         :submode java
;; ;;         :match-face (("<%!" . mmm-declaration-submode-face)
;; ;;     		 ("<%=" . mmm-output-submode-face)
;; ;;     		 ("<%"  . mmm-code-submode-face))
;; ;;         :front "<%[!=]?"
;; ;;         :back "%>"
;; ;;         :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
;; ;;     	     (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
;; ;;     	     (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;; ;;         )
;; ;;        (jsp-directive
;; ;;         :submode text-mode
;; ;;         :face mmm-special-submode-face
;; ;;         :front "<%@"
;; ;;         :back "%>"
;; ;;         :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @))
;; ;;         )
;; ;;        ))
;;}}}

;;{{{ multi-mode
;(require 'multi-mode)
;; (autoload 'multi-mode "multi-mode" "Allowing multiple major modes in a buffer." t)

;; (defun jsp-mode () (interactive)
;;       (multi-mode 1
;;                   'html-mode
;;                   '("<%--" indented-text-mode)
;;                   '("<%@" indented-text-mode)
;;                   '("<%=" html-mode)
;;                   '("<%" java-mode)
;;                   '("%>" html-mode)
;;                   '("<script" java-mode)
;;                   '("</script" html-mode)
;;                   ))
;;}}}

;;{{{ config about ecb ,一个浏览文件的工具
;(Add-to-list 'load-path  (concat joseph_root_install_path "ecb-2.40"))
;;         (require 'ecb)
;;         (require 'ecb-autoloads)
;; (setq ecb-auto-activate t ecb-tip-of-the-day nil);;自动启用ecb
;; ;;;; 各窗口间切换
;; (global-set-key [M-left] 'windmove-left)
;; (global-set-key [M-right] 'windmove-right)
;; (global-set-key [M-up] 'windmove-up)
;; (global-set-key [M-down] 'windmove-down)

;; ;;;; 隐藏和显示ECB窗口
;; (define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
;; (define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;  ;;;; 使某一ecb窗口最大化
;; (define-key global-map "\C-c1" 'ecb-maximize-window-directories)
;; (define-key global-map "\C-c2" 'ecb-maximize-window-sources)
;; (define-key global-map "\C-c3" 'ecb-maximize-window-methods)
;; (define-key global-map "\C-c4" 'ecb-maximize-window-history)
;; ;;;; 恢复原始窗口布局
;; (define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)
;;}}}

;;{{{ sunrise File Manager

(eval-and-compile
  (add-to-list 'load-path
               (expand-file-name (concat joseph_site-lisp_install_path "sunrise/"))) )
(require 'sunrise-commander)
(require 'sunrise-x-buttons) ;;add button for new users, can't use together with x-popviewer
(require 'sunrise-x-mirror) ;full read/write access to compressed archives
;;In order to perform your copy or rename operation in the background,
;;the only thing you have to do is add an empty prefix to the usual keystroke
;;C will perform a regular copy in the foreground and C-u C will do it in the background
(require 'sunrise-x-loop) ;copying and renaming files in the background
;(require 'sunrise-x-popviewer);making the viewer window float, it show in new frame , i don't like it 

(require 'sunrise-x-modeline); show current path on modeline
(require 'sunrise-x-tabs) ;;tab brower ,C-j(new) C-k(kill) C-n (next) C-p (prev),
(require 'sunrise-x-tree) ;;tree
;(custom-set-variables
 ;;设置默认使用sunrise ,而不是dired
; '(find-directory-functions (quote (sr-dired cvs-dired-noselect dired-noselect)))
;)
;;当C-x C-f 打开一个目录时,优先使用sr-dired打开目录
(setq find-directory-functions (quote (sr-dired cvs-dired-noselect dired-noselect)))

(setq sr-modeline-use-utf8-marks t)
(global-set-key "\C-cx" (quote sunrise))
(global-set-key "\C-cX" (quote sunrise-cd))
;;sunrise mode  press h for help
(setq sr-modeline-use-utf8-marks t)
;;;; * C-t + Space (alternatively C-t + Return) - switch between tree and normal
(setq tree-widget-image-enable t) 
(setq sr-virtual-listing-switches " --time-style=locale --group-directories-first -alDphgG")
(setq sr-listing-switches " --time-style=locale --group-directories-first -alDphgG")
(setq sr-show-hidden-files nil);;C-o toggle
(setq sr-window-split-style (quote top)); C-c C-s toggle style 
;;C-c t  open terminal cuurent dir
(define-key sr-mode-map "z"       'sr-fuzzy-narrow)

;;}}}

;;{{{ dired
;;指定隐藏哪些文件 : C-o toggle
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$\\|^.*~$\\|^#.*#$\\|^\\.git$\\|^\\.svn$"))
(setq dired-recursive-deletes 'top;让 dired 可以递归的拷贝和删除目录。 
      dired-recursive-copies 'top
      dired-dwim-target t
      dired-guess-shell-alist-user '(("\\.pdf$" "acroread")))

;(require 'dired-x) ; 有些特殊的功能
;;}}}

;;{{{ ido模式，C-x C-f 查找文件时的一种模式

;; (add-hook 'ido-define-mode-map-hook 'ido-my-keys)

;; (defun ido-my-keys ()
;;   "Set up the keymap for `ido'."

;;   ;; common keys
;;   (define-key ido-mode-map "\C-e" 'ido-edit-input)   
;;   (define-key ido-mode-map "\t" 'ido-complete) ;; complete partial
;;   (define-key ido-mode-map "\C-j" 'ido-select-text)
;;   (define-key ido-mode-map "\C-m" 'ido-exit-minibuffer)
;;   (define-key ido-mode-map "?" 'ido-completion-help) ;; list completions
;;   (define-key ido-mode-map [(control ? )] 'ido-restrict-to-matches)
;;   (define-key ido-mode-map [(control ?@)] 'ido-restrict-to-matches)

;;   ;; cycle through matches
;;   (define-key ido-mode-map "\C-r" 'ido-prev-match)
;;   (define-key ido-mode-map "\C-s" 'ido-next-match)
;;   (define-key ido-mode-map [right] 'ido-next-match)
;;   (define-key ido-mode-map [left] 'ido-prev-match)

;;   ;; toggles
;;   (define-key ido-mode-map "\C-t" 'ido-toggle-regexp) ;; same as in isearch
;;   (define-key ido-mode-map "\C-p" 'ido-toggle-prefix)
;;   (define-key ido-mode-map "\C-c" 'ido-toggle-case)
;;   (define-key ido-mode-map "\C-a" 'ido-toggle-ignore)

;;   ;; keys used in file and dir environment
;;   (when (memq ido-cur-item '(file dir))
;;     (define-key ido-mode-map "\C-b" 'ido-enter-switch-buffer)
;;     (define-key ido-mode-map "\C-d" 'ido-enter-dired)
;;     (define-key ido-mode-map "\C-f" 'ido-fallback-command)

;;     ;; cycle among directories
;;     ;; use [left] and [right] for matching files
;;     (define-key ido-mode-map [down] 'ido-next-match-dir)
;;     (define-key ido-mode-map [up]   'ido-prev-match-dir)

;;     ;; backspace functions
;;     (define-key ido-mode-map [backspace] 'ido-delete-backward-updir)
;;     (define-key ido-mode-map "\d"        'ido-delete-backward-updir)
;;     (define-key ido-mode-map [(meta backspace)] 'ido-delete-backward-word-updir)
;;     (define-key ido-mode-map [(control backspace)] 'ido-up-directory)

;;     ;; I can't understand this
;;     (define-key ido-mode-map [(meta ?d)] 'ido-wide-find-dir)
;;     (define-key ido-mode-map [(meta ?f)] 'ido-wide-find-file)
;;     (define-key ido-mode-map [(meta ?k)] 'ido-forget-work-directory)
;;     (define-key ido-mode-map [(meta ?m)] 'ido-make-directory)

;;     (define-key ido-mode-map [(meta down)] 'ido-next-work-directory)
;;     (define-key ido-mode-map [(meta up)] 'ido-prev-work-directory)
;;     (define-key ido-mode-map [(meta left)] 'ido-prev-work-file)
;;     (define-key ido-mode-map [(meta right)] 'ido-next-work-file)

;;     ;; search in the directories
;;     ;; use C-_ to undo this
;;     (define-key ido-mode-map [(meta ?s)] 'ido-merge-work-directories)
;;     (define-key ido-mode-map [(control ?\_)] 'ido-undo-merge-work-directory)
;;     )

;;   (when (eq ido-cur-item 'file)
;;     (define-key ido-mode-map "\C-k" 'ido-delete-file-at-head)
;;     (define-key ido-mode-map "\C-l" 'ido-toggle-literal)
;;     (define-key ido-mode-map "\C-o" 'ido-copy-current-word)
;;     (define-key ido-mode-map "\C-v" 'ido-toggle-vc)
;;     (define-key ido-mode-map "\C-w" 'ido-copy-current-file-name)
;;     )

;;   (when (eq ido-cur-item 'buffer)
;;     (define-key ido-mode-map "\C-b" 'ido-fallback-command)
;;     (define-key ido-mode-map "\C-f" 'ido-enter-find-file)
;;     (define-key ido-mode-map "\C-k" 'ido-kill-buffer-at-head)
;;     ))

; (ido-mode t)

;;}}}

;;{{{ FileNameCache(Emacs 自带的功能,可接合anything使用)
;; C-x C-f 时寻找文件可以不用输入完整路径,不过要事先将目录加到它入它和管理当中
;;不必使用书签可以快速打开常用的文件,可以将一个项目的源码目录加进来,
;;几种加入方式
;;不过如果递归加入的目录很深,启动速度会减慢
;; (file-cache-add-directory )
;;(file-cache-add-directory-using-find )
;;(file-cache-add-directory-using-locate )
;;(file-cache-add-directory-list) <RET> VARIABLE <RET>' like:load-path
;;(file-cache-add-directory-recursively "~/emacsd/")
;;在minibuffer 中输入部分文件名,然后C-Tab 补全
;;但是用C-Tab补全还是有点别扭,又不好覆盖Tab的补全功能
;;不过可以结合anything 使用,anything提供的使用FileNameCache的source
;;anything-c-source-file-cache,在anything中已将其加到anything-sources
;;C-x C-f C-TAB C-g
(require 'filecache)
;;将 .git 目录排除在外
(add-to-list 'file-cache-filter-regexps "\\.git\\>")
;;官方提供的几个file-cache-add-directory-*的方法每次需要扫描目录
;;启动速度会很慢wiki 上提供的两个function
;;file-cache-save-cache-to-file
;;file-cache-read-cache-from-file
;;可以将扫描的结果记入一个cache文件,以后启动时只需加载这个文件,不必每次都扫描
;;以后要添加新目录的时候只需要用官方的方法add 后,然后
;;file-cache-save-cache-to-file 一下就可以了
(defun file-cache-save-cache-to-file (file)
  "Save contents of `file-cache-alist' to FILE.
For later retrieval using `file-cache-read-cache-from-file'"
  (interactive "FFile: ")
  (with-temp-file (expand-file-name file)
    (prin1 file-cache-alist (current-buffer))))

(defun file-cache-read-cache-from-file (file)
  "Clear `file-cache-alist' and read cache from FILE.
  The file cache can be saved to a file using
  `file-cache-save-cache-to-file'."
  (interactive "fFile: ")
  (file-cache-clear-cache)
  (save-excursion
    (with-current-buffer (find-file-noselect file)
      (goto-char (point-min))
      (setq file-cache-alist (read (current-buffer)))
      (kill-buffer)
      )))

(let ((file-name-cache-file-name (concat joseph_root_install_path "cache/file-name-cache")))
  (message "Loading file cache...")
  (if (file-exists-p file-name-cache-file-name)
      ;; 如果cache文件存在直接读取里面的内容,
      (file-cache-read-cache-from-file file-name-cache-file-name)
    ;;如果cache文件不存在则用官方提供的几人函数添加到file-cache-alist中,然后
    ;;save 到cache文件中,需要注意如果有新路径加入,需要手动
    ;;(file-cache-save-cache-to-file file-name-cache-file-name)
    (progn
           ;;   (file-cache-add-directory-using-find "~/project")
           ;;   (file-cache-add-directory-recursively "/")
           (file-cache-add-directory-list load-path)
           (file-cache-add-directory "~/")
           (file-cache-add-directory-using-find "/java/java/Emacs/wiki/")

           ;;  (file-cache-add-file-list (list "~/foo/bar" "~/baz/bar"))
      (file-cache-save-cache-to-file file-name-cache-file-name)
      )))


  
;;当kill-buffer时自动当其加入到cache
(defun file-cache-add-this-file ()
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))
(add-hook 'kill-buffer-hook 'file-cache-add-this-file)

;;}}}

;;{{{ anything

(eval-and-compile
  (add-to-list 'load-path (expand-file-name (concat joseph_site-lisp_install_path "anything-config/")))
  (add-to-list 'load-path (expand-file-name (concat joseph_site-lisp_install_path "anything-config/developer-tools/")))
  (add-to-list 'load-path (expand-file-name (concat joseph_site-lisp_install_path "anything-config/extensions/")))
  )
(require 'anything-startup)
(anything-dired-bindings);;
(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)
(anything-set-anything-command-map-prefix-key
'anything-command-map-prefix-key "\C-w")
(define-key anything-command-map (kbd "<SPC>") 'anything-execute-anything-command)
(define-key anything-command-map (kbd "e") 'anything-etags-maybe-at-point)
(define-key anything-command-map (kbd "l") 'anything-locate)
(define-key anything-command-map (kbd "s") 'anything-surfraw)
(define-key anything-command-map (kbd "r") 'anything-regexp)
(define-key anything-command-map (kbd "w") 'anything-w3m-bookmarks)
(define-key anything-command-map (kbd "b") 'anything-firefox-bookmarks)
(define-key anything-command-map (kbd "#") 'anything-emms)
(define-key anything-command-map (kbd "m") 'anything-man-woman)
(define-key anything-command-map (kbd "t") 'anything-top)
(define-key anything-command-map (kbd "i") 'anything-imenu)
(define-key anything-command-map (kbd "p") 'anything-list-emacs-process)
(define-key anything-command-map (kbd "C-x r b") 'anything-c-pp-bookmarks)
(define-key anything-command-map (kbd "C-c <SPC>") 'anything-all-mark-rings)
(define-key anything-command-map (kbd "f") 'anything-find-files)
(define-key anything-command-map (kbd "C-f") 'anything-for-files)
(define-key anything-command-map (kbd "C-;") 'anything-eval-expression-with-eldoc)
(define-key anything-command-map (kbd "C-,") 'anything-calcul-expression)
(define-key anything-command-map (kbd "x") 'anything-M-x)
(define-key anything-command-map (kbd "C-w") 'anything-write-file)
(define-key anything-command-map (kbd "C-x i") 'anything-insert-file)
(define-key anything-command-map (kbd "M-s o") 'anything-occur)
(define-key anything-command-map (kbd "M-g s") 'anything-do-grep)
(define-key anything-command-map (kbd "c") 'anything-colors)
(define-key anything-command-map (kbd "F") 'anything-select-xfont)
(define-key anything-command-map (kbd "C-c f") 'anything-recentf)
(define-key anything-command-map (kbd "C-c g") 'anything-google-suggest)
(define-key anything-command-map (kbd "h i") 'anything-info-at-point)
(define-key anything-command-map (kbd "h r") 'anything-info-emacs)
(define-key anything-command-map (kbd "C-x C-b") 'anything-buffers+)
(define-key anything-command-map (kbd "C-c C-b") 'anything-browse-code)
(define-key anything-command-map (kbd "C-x r i") 'anything-register)
(define-key anything-command-map (kbd "C-c C-x") 'anything-c-run-external-command)

(define-key anything-command-map (kbd "M-y") 'anything-show-kill-ring)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)


;;anything 结合FileNameCache
(eval-after-load 'anything-config
  '(add-to-list 'anything-sources anything-c-source-file-cache))
;;}}}

;;{{{ 将 speedbar  在同一个frame 内显示
(setq-default sr-speedbar-width-x 36)
(setq sr-speedbar-width-console 36)
(require 'sr-speedbar)
;(setq-default sr-speedbar-width-x 45)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq sr-speedbar-auto-refresh t) ;;default is t
(setq sr-speedbar-right-side nil)
;
;sr-speedbar-refresh-toggle
 ;; `sr-speedbar-width-x'
;; `sr-speedbar-width-console'
;; `sr-speedbar-max-width'
;; `sr-speedbar-delete-windows'
;;      Whether delete other window before showing up.
;; `sr-speedbar-skip-other-window-p'
;;      Whether skip `sr-speedbar' window when use
;;      command `other-window' select window in cyclic ordering of windows.
;;      Control status of refresh speedbar content.
;;      Puts the speedbar on the right side if non-nil (else left).
;;
;; All above setup can customize by:
;;      M-x customize-group RET sr-speedbar RET
;;
;;}}}

(provide 'joseph_init)

;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;emacs  -batch    -l /home/jixiuf/emacsd/script/byte-compile-anything  -f batch-byte-compile *.el
;;C-x C-e run current lisp
