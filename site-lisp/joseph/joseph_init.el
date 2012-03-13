;; -*- coding:utf-8 -*-
;; Last Updated: Joseph 2012-03-13 20:31:56 星期二
;;; byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;; require
;; 一些与键绑定相关的配置
(require 'joseph-util)
(require 'joseph-loaddefs nil t)
;;(require 'joseph-command) ; autoload command
(require 'joseph_keybinding);
(require 'joseph_common)
(eval-after-load 'dired '(require 'joseph_dired))

(when (equal system-type 'windows-nt)
  (require 'joseph-w32)
  (require 'joseph-openwith-w32))

(when (equal system-type 'gnu/linux)
    (require 'joseph_clipboard_and_encoding)
    (require 'joseph-openwith-linux)
    ;; (require 'joseph-kill-emacs)
    )

(require 'joseph_rect_angle); 所有关于矩形操作的配置都在joseph_rect_angle.el文件中
(require 'joseph_jad_decompile); 用jad 反编译class文件
;; (require 'joseph-file-name-cache); filename cache
(require 'joseph-yasnippet-config)
(require 'joseph-hippie-expand)
;; (require 'joseph-indent)  ;yank 自动缩进
(require 'joseph-auto-complete)
(eval-after-load 'ibuffer '(require 'joseph_ibuffer))
(require 'joseph-nxhtml)
(eval-after-load 'nxml-mode '(require 'joseph-nxml))
(require 'joseph-quick-jump)
(require 'joseph-move-text)
;; (require 'minibuf-electric-gnuemacs); C-x C-f 时 输入 / 或者~ 会自动清除原来的东西,只留下/ 或者~
(require 'joseph_tags);;需要在anything load之后 .tags
(require 'joseph-vc);;; VC
(require 'joseph-srsppedbar)
;; (require 'joseph-shell-toggle)
(require 'joseph-scroll-smooth)
;; (require 'joseph-hide)
(require 'joseph-compile)
(require 'joseph-auto-document)
(require 'joseph-auto-install)
(require 'joseph-boring-buffer)
(require 'joseph-autopair-config)
;; (require 'joseph-highlight-parentheses)
;; (require 'joseph-icicle) ;  icicle
(require 'joseph-minibuffer)
(require 'joseph-anything);anything
;; (require 'joseph-ido);ido
(require 'joseph-iedit )
(require 'joseph-windows)
(require 'joseph-yasnippet-auto-insert)
(require 'joseph-search-replace)
(require 'joseph-flymake)
(require 'joseph-program)
(run-with-idle-timer 10 nil '(lambda () (require 'joseph-cedet) (message "cedet is loaded")));;;  cedet
(eval-after-load 'shell '(require 'joseph-shell));;; shell
(eval-after-load 'sql '(require 'joseph-sql));;; Sql
(eval-after-load 'cperl-mode '(require 'joseph-perl));;; perl
(eval-after-load 'erc '(require 'joseph-erc));;; erc ,irc client
(eval-after-load 'css-mode '(require 'joseph-css));;; erc ,irc client
(eval-after-load 'csharp-mode '(require 'joseph-csharp));;; erc ,irc client
(require 'joseph-outline)
(require 'joseph-fast-nvg)
(require 'joseph-ace)
(require 'joseph-org-config)
(require 'joseph-c)
(require 'joseph-java)
(require 'joseph-vb)
(require 'joseph-android)
(require 'joseph-thing)
(require 'joseph-erlang)
(require 'joseph-gtalk)
(require 'joseph-mew)
(require 'joseph-w3m)

;; https://github.com/glasserc/ethan-wspace
;; ethan-wspace是用来处理 空格及TAB 相应的问题的
;; 它的 特点是 "无害" "do not harm"
;;有些脚本 提供了自动trim 掉行尾的空格有功能 ，但是在进行diff操作时，会多出不必要的diff
;; ethan-wspace
;;当你打开一个已存在的文件时
;;1. 如果文件中的whitespace 已经都clean 掉了，则它会 在每次保存前进行一个clean ,确保无whitespace
;;2. 如果没有，ethan-wspace 高度显示 errors，它不会自动改动这些errors ,但是它会阻止添加新的errors

;; ethan-wspace 把以下几种情况定义为errors:
;; 1: 行尾空格, trailing whitespace at end of line (eol).
;; 2: 文末没有一个空行 no trailing newline (no-nl-eof).
;; 3:文末有多个空行 more than one trailing newline (many-nls-eof).
;; 4: TAB
;;如果你不想让TAB成为一种error 可以 (set-default 'ethan-wspace-errors (remove 'tabs ethan-wspace-errors))
;;
;; You should also remove any customizations you have made to turn on either
;; show-trailing-whitespace or require-final-newline; we handle those for you.
;; 如果需要 手动删除之 M-x:delete-trailing-whitespace

(setq-default ethan-wspace-face-customized t) ;使用自定义的face ，不必自动计算 ，在daemon模式下怀疑有bug
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)
;; (require 'joseph-linenum-config)

(require 'keep-buffers)                     ;; Load the package.
(setq keep-buffers-protected-alist
  '(("\\`\\*scratch\\*\\'" . nil)
    ("\\`\\*Messages\\*\\'" . erase))
  )
(keep-buffers-mode 1) ;;避免如scratch等buffer 被误杀


;;; linkd-mode 文档用的超链接
;;读取icicle的文档时可以跳转
(autoload 'linkd-mode "linkd" "doc" t)
;; enable it by (linkd-mode) in a linkd-mode
; icicles-doc1.el 文档用它进行超链接

;;; 注释掉的
;;;; keyboard record
;;主要用于录制视频时，显示在emacs中按下了哪些键，调用了哪些命令
;;http://www.foldr.org/~michaelw/emacs/mwe-log-commands.el
;;(require 'mwe-log-commands)
;;(mwe:log-keyboard-commands)有于对当前buffer启用键盘记录功能
;;只是启用还不行，还需要打开一个buffer显示按下的内容，
;;(mwe:open-command-log-buffer)
;;想不通作者为什么要把它做成两个命令

;;;; googletalk
;; ;;googletalk client
;; (require 'jabber-autoloads)
;; (setq jabber-account-list '(
;;                              ("jixiuf@gmail.com"
;;                                 (:password. "zhao2170")
;;                                 (:network-server . "talk.google.com")
;;                                 (:port . 443)
;;                                 (:connection-type . ssl))
;;                              ))
;;;; 使用外部命令打开文件 "!"

;;可用，但很少用，故注释掉了
;; ;;在*.RM文件上使用"!" 命令,则会用mplayer 打开此文件
;; ;;在字符串里面如果有 * 出现则会被替换成文件名，另外，也可以直接在 Elisp 表达式里面使用 file 这个变量
;; ;;这里的设置对直接"回车"或"f"命令打开的文件不起作用.
;; (setq dired-guess-shell-alist-user
;;       '(("\\.pdf$" "acroread * &") ("\\.mp3$" "play_one_mp3.sh * &")
;;         ("\\.RM$" "mplayer * &") ("\\.rm$" "mplayer * &")
;;         ("\\.RMVB$" "mplayer * &") ("\\.avi$" "mplayer * &")
;;         ("\\.AVI$" "mplayer * &") ("\\.flv$" "mplayer * &")
;;         ("\\.mp4$" "mplayer * &") ("\\.mkv$" "mplayer * &")
;;         ("\\.rmvb$" "mplayer * &") ("\\.jpg$" "gpicview * &")
;;         ("\\.jpeg$" "gpicview * &")("\\.png$" "gpicview * &")
;;         ("\\.bmp$" "gpicview * &") ("\\.gif$" "gpicview * &")
;;         ("\\.html$" "firefox * &") ("\\.htm$" "firefox * &")
;;         ("\\.HTML$" "firefox * &") ("\\.HTM$" "firefox * &")
;;         ("\\.chm$" "chmsee * &"  "hh.exe") ("\\.CHM$" "chmsee * &" "hh.exe" )
;;         ("\\.rar$"  (concat "mkdir -p "
;;                  (file-name-sans-extension file) ";"
;;                  "unrar x -y "   "* "
;;                  (file-name-sans-extension file) " &"))
;;         ("\\.t\\(ar\\.\\)?gz$"
;;          (concat "mkdir  -p "
;;                  (file-name-sans-extension file)
;;                  "; " dired-guess-shell-gnutar " -C "
;;                  (file-name-sans-extension file)
;;                  " -zxvf * &")
;;          (concat "mkdir -p  "
;;                  (file-name-sans-extension file)
;;                  "; gunzip -qc * | tar -C "
;;                  (file-name-sans-extension file)
;;                  " -xvf - * & "))
;;         ))
;; ;;另外，对于 X 下的应用程序，我们通常不希望它把 Emacs 阻塞掉，
;; ;;而是同步执行，只需要在末尾加上 & 即可同步执行，同时 Emacs 会收集程序输出.
;; ;;可是有些程序的输出含有很多终端控制字符，mplayer 就是一个例子，我在这样运行
;; ;;mplayer 的时候显得十分卡，我想可能是输出被 Emacs 捕获到 buffer 里面的原因。
;; ;;这些输出本身就没有什么用，如果还会让程序运行缓慢的话，就更可恶了。
;; ;;把所有以 & 结尾的后台程序的输出都直接丢弃掉。
;; (defadvice dired-run-shell-command (around kid-dired-run-shell-command (command))
;;   "run a shell command COMMAND .
;; If the COMMAND ends with `&' then run it in background and *discard* the
;; output, otherwise simply let the original `dired-run-shell-command' run it."
;;   (if (string-match "&[[:blank:]]*$" command)
;;         (let ((proc (start-process "kid-shell" nil shell-file-name
;;                                    shell-command-switch
;;                                    (substring command 0 (match-beginning 0)))))
;;           (set-process-sentinel proc 'shell-command-sentinel))
;;       ad-do-it))
;; (ad-activate 'dired-run-shell-command)
;;;; 对于Windows 用户,隐藏掉不需要的信息,如文件权限

;;   (defvar wcy-dired-mode-hide-column-regex
;;   "^\\s-\\{2\\}[drwx-]\\{10\\}\\s-+[0-9]+\\s-+\\sw+\\s-+\\sw+"
;;   "doc")
;; (defun wcy-dired-mode-hide-column ()
;;   (interactive)
;;   (when (eq major-mode 'dired-mode)
;;     (save-excursion
;;       (save-match-data
;;         (goto-char (point-min))
;;         (while (re-search-forward wcy-dired-mode-hide-column-regex nil t nil)
;;           (let ((o (make-overlay (match-beginning 0) (match-end 0))))
;;             (overlay-put o 'invisible t)
;;             (overlay-put o 'id 'wcy-dired-mode-hide-column)))))))

;; (defun wcy-dired-mode-show-column ()
;;   (interactive)
;;   (when (eq major-mode 'dired-mode)
;;     (mapc (lambda (o)
;;             (if (eq (overlay-get o 'id) 'wcy-dired-mode-hide-column)
;;                 (delete-overlay o)))
;;           (overlays-in (point-min) (point-max)))))
;; 注意和 (add-hook 'dired-after-readin-hook 'sof/dired-sort) 的冲突要保证
;; dired-after-readin-hook 中 wcy-dired-mode-hide-column 在 sof/dired-sort 之后
;; (when (eq system-type 'windows-nt)
;;   (add-hook 'dired-after-readin-hook 'wcy-dired-mode-hide-column t nil))

;;;; files+ ls-lisp+ 没什么用
;; ;; files+.el对files.el增强
;; ;; ls-list+.el 对ls-list.el增强 ,主要在MS系统上使用
;; ;; ls-list+.el里面自动require files+
;; (eval-after-load "files"
;;   '(cond ((eq system-type 'gnu/linux)
;;          (require 'files+) )
;;         ((eq system-type 'windows-nt)
;;          (require 'ls-lisp+)))
;; )

;;;; dired+

;; (require 'dired+)
;; ;;(setq diredp-dir-priv '((t (:foreground "DarkRed"))))
;; (setq diredp-display-msg '((t (:foreground "Goldenrod"))))
;; (setq diredp-exec-priv '((t (:foreground "cyan"))))
;; (setq diredp-file-name '((t (:foreground "LightCyan"))))
;; (setq diredp-file-suffix '((t (:foreground "LawnGreen"))))
;; (setq diredp-no-priv '((t nil)))
;; (setq diredp-number '((t (:foreground "DarkOliveGreen"))))
;; (setq diredp-rare-priv '((t (:foreground "Magenta"))))
;; (setq diredp-read-priv '((t (:foreground "SteelBlue"))))
;; (setq diredp-write-priv '((t (:foreground "OliveDrab"))))
;; (setq diredp-dir-priv '((t (:foreground "green"))))
;; (setq diredp-executable-tag '((t (:foreground "SpringGreen"))))

;; (define-key ctl-x-map   "d" 'diredp-dired-files)
;; (define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)
;; ;;    Most of the commands (such as `C' and `M-g') that operate on
;; ;;    marked files have the added feature here that multiple `C-u' use
;; ;;    not the files that are marked or the next or previous N files,
;; ;;    but *all* of the files in the Dired buffer.  Just what "all"
;; ;;    files means changes with the number of `C-u', as follows:

;; ;;    `C-u C-u'         - Use all files present, but no directories.
;; ;;    `C-u C-u C-u'     - Use all files and dirs except `.' and `..'.
;; ;;    `C-u C-u C-u C-u' - use all files and dirs, `.' and `..'.
;; ;;
;; ;;    (More than four `C-u' act the same as two.)

;;;; popwin.el 把 *Help* *Completions* 等window 可以用`C-g' 关闭掉
;;popup window  相当于临时弹出窗口
;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config
;;   '(("*Help*")
;;     ("*Completions*" :noselect t)
;;     ("*compilation*" :noselect t)
;;     ("*Occur*" :noselect t)
;;     ("^\\*Anything" :regexp t :noselect t)
;;     ("^\\*Customise" :regexp t :noselect t)
;;     ))
;;;; 将选区或者当前buffer 生成html格式（带语法着色）
;;emacs 自动了htmlfontify-buffer具有相同的功能
;; ;; M-x htmtize-file
;; ;;(require 'htmlize)
;; (autoload 'htmlize-file "htmlize" "将选区或者当前buffer 生成html格式（带语法着色）" t)
;;;; 调色板palette

;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/hexrgb.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/palette.el")
;;(require 'palette)
;;;; Java中的一个小扩展，在行尾补全大括号

;;输入左大括号，会在行尾添加{，而不是当前位置,并且另起一行补上}
;; (defun java_append_bracket(&optional arg)
;;   (interactive "*p")
;;   (let ( (begin nil) (end nil) (line_str) )
;;       (beginning-of-line) (setq begin (point)) ;;记录行首位置
;;       (end-of-line) (setq end (point)  )  ;;记录行尾位置
;;       (setq line_str (buffer-substring begin end)) ;; 截取整行内容
;;       (if (or (string-match "//" line_str) (string-match "/\\*" line_str )  ) ;;;如果所在行是注释，则行为正常，（判断并不严格）
;;           (insert "{")
;;            (progn
;;             (end-of-line)
;;             (insert "{")
;;             (newline-and-indent)
;;             (newline)
;;             (insert "}")
;;             (setq end (point))
;;             (forward-line -1)
;;             (indent-according-to-mode)
;;             (indent-region begin end )
;;             )
;;     )
;;     )
;;   )
;;;; 关于autopair skeleton

;; (require 'skeleton)
;; (setq skeleton-pair t)
;; (setq skeleton-pair-alist
;;       '((?\( _ ?\))
;;         (?[  _ ?])
;;         (?{ \n > _ \n ?} >)
;;         (?\' _ ?\')
;;         (?\" _ ?\")))

;; (defun autopair-insert (arg)
;;   (interactive "P")
;;   (let (pair)
;;     (cond
;;      ((assq last-command-char skeleton-pair-alist)
;;       (autopair-open arg))
;;      (t
;;       (autopair-close arg)))))

;; (defun autopair-open (arg)
;;   (interactive "P")
;;   (let ((pair (assq last-command-char
;;                     skeleton-pair-alist)))
;;     (cond
;;      ((and (not mark-active)
;;            (eq (car pair) (car (last pair)))
;;            (eq (car pair) (char-after)))
;;       (autopair-close arg))
;;      (t
;;       (skeleton-pair-insert-maybe arg)))))

;; (defun autopair-close (arg)
;;   (interactive "P")
;;   (cond
;;    (mark-active
;;     (let (pair open)
;;       (dolist (pair skeleton-pair-alist)
;;         (when (eq last-command-char (car (last pair)))
;;           (setq open (car pair))))
;;       (setq last-command-char open)
;;       (skeleton-pair-insert-maybe arg)))
;;    ((looking-at
;;      (concat "[ \t\n]*"
;;              (regexp-quote (string last-command-char))))
;;     (replace-match (string last-command-char))
;;     (indent-according-to-mode))
;;    (t
;;     (self-insert-command (prefix-numeric-value arg))
;;     (indent-according-to-mode))))

;; (defadvice delete-backward-char (before autopair activate)
;;   (when (and (char-after)
;;              (char-before)
;;              (or  (eq this-command 'delete-backward-char)
;;                   (eq this-command 'backward-delete-char-untabify))
;;              (eq (char-after)
;;                  (car (last (assq (char-before) skeleton-pair-alist)))))
;;     (delete-char 1))
;;   (when (and (char-before (- (point) 1))
;;              (or  (eq this-command 'delete-backward-char)
;;                   (eq this-command 'backward-delete-char-untabify))
;;              (eq (char-before)
;;                  (car (last (assq (char-before (- (point) 1)) skeleton-pair-alist)))))
;;     (backward-char 1) (delete-char 1))
;;   )
;; (defadvice delete-char (before autopair activate)
;;   (when (and (char-before)
;;              (char-after)
;;              (eq this-command 'delete-char)
;;              (eq (char-after)
;;                  (car (last (assq (char-before) skeleton-pair-alist)))))
;;     (backward-delete-char-untabify 1))
;;   (when (and (char-after (+ 1 (point)))
;;              (eq this-command 'delete-char)
;;              (eq (char-after (+ 1 (point)))
;;                  (car (last (assq (char-after) skeleton-pair-alist)))))
;;     (forward-char ) (delete-backward-char 1)))

;; (defun joseph-set-autopair-4-cc ()
;;   (local-set-key "("  'autopair-insert)
;;   (local-set-key ")"  'autopair-insert)
;;   (local-set-key "["  'autopair-insert)
;;   (local-set-key "]"  'autopair-insert)
;;   (local-set-key "{"  'autopair-insert)
;;   (local-set-key "}"  'autopair-insert)
;;   (local-set-key "\"" 'autopair-insert)
;;   (local-set-key "\'" 'autopair-insert)
;;   )
;; (add-hook 'c-mode-hook 'joseph-set-autopair-4-cc)
;; (add-hook 'java-mode-hook 'joseph-set-autopair-4-cc)


;; (defun joseph-set-autopair-4-lisp ()
;;   (local-set-key "("  'autopair-insert)
;; ;  (local-set-key ")"  'autopair-insert)
;;   (local-set-key "["  'autopair-insert)
;;   (local-set-key "]"  'autopair-insert)
;;   (local-set-key "\"" 'autopair-insert)
;;   )

;; (add-hook 'emacs-lisp-mode-hook 'joseph-set-autopair-4-lisp)
;; (add-hook 'lisp-mode-hook 'joseph-set-autopair-4-lisp)
;; (add-hook 'lisp-interaction-mode-hook 'joseph-set-autopair-4-lisp)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;java c c++里自动补全() {} []
;;  (defun my-java-mode-auto-pair ()
;;   (interactive)
;;   (make-local-variable 'skeleton-pair-alist)
;;   (setq skeleton-pair-alist  '(
;;                    (?\(  _ ")")
;;                    (?\[  _ "]")
;; ;                   (?{ \n > _ \n ?} >)
;; ))
;;  (setq skeleton-pair t)
;; (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;; ;(add-hook 'java-mode-hook 'my-java-mode-auto-pair)
;; ;(add-hook 'jde-mode-hook 'my-java-mode-auto-pair)
;; (add-hook 'emacs-lisp-mode-hook 'my-java-mode-auto-pair)
;;;; 快速输入括号
;;(require 'autopair)
;;(autopair-global-mode)
;;(define-key ac-mode-map "\r" 'ac-complete)
 ;; (defun electric-pair ()
 ;;      "If at end of line, insert character pair without surrounding spaces.
 ;;    Otherwise, just insert the typed character."
 ;;      (interactive)
 ;;      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))
 ;;    (add-hook 'java-mode-hook
 ;;              (lambda ()
 ;;                (define-key java-mode-map "\"" 'electric-pair)
 ;;                (define-key java-mode-map "\'" 'electric-pair)
 ;;                (define-key java-mode-map "(" 'electric-pair)
 ;;                (define-key java-mode-map "[" 'electric-pair)
 ;;                (define-key java-mode-map "{" 'electric-pair)))

;;(require 'electric-dot-and-dash)
;; (global-set-key "," 'electric-dot-and-dash-dot)
;; (global-set-key "." 'electric-dot-and-dash-dash)
;;;; javascript.el
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;; (autoload 'javascript-mode "javascript" nil t)
;;;; smart-compile
;; ;; 这两个命令特别好用，可以根据文件的后缀或者 mode 判断调用的 compile
;; ;; 命令。当目录下有 makefile 自动使用 make 命令。
;; (require 'smart-compile+)
;; (global-set-key (kbd "C-z r") 'smart-run)
;; (global-set-key (kbd "C-z s") 'smart-compile)
;; ;; smart compile 是一个非常好用的 elisp。它的设置也相当简单。只要对相应的后缀
;; ;; 定义 compile 和 run 的命令就行了。格式也列在下面。
;; ;; smart-executable-alist 是用来在调用 smart-run 时是否需要 compile。所以
;; ;; 脚本一般都要加入到这个列表中。除非你只用 smart-compile 运行。

;; ;(require 'smart-compile nil t)
;; ;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;; ;;   %f  file name without directory  ( netscape.bin )
;; ;;   %n  file name without extention  ( netscape )
;; ;;   %e  extention of file name       ( bin )
;; (setq smart-compile-alist
;;       '(("\\.c$"          . "g++ -o %n %f")
;;         ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
;;         ("\\.java$"       . "javac %f")
;;         ("\\.f90$"        . "f90 %f -o %n")
;;         ("\\.[Ff]$"       . "f77 %f -o %n")
;;         ("\\.mp$"         . "runmpost.pl %f -o ps")
;;         ("\\.php$"        . "php %f")
;;         ("\\.tex$"        . "latex %f")
;;         ("\\.l$"          . "lex -o %n.yy.c %f")
;;         ("\\.y$"          . "yacc -o %n.tab.c %f")
;;         ("\\.py$"         . "python %f")
;;         ("\\.sql$"        . "mysql < %f")
;;         ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
;;         ("\\.sh$"         . "./%f")
;;         (emacs-lisp-mode  . (joseph_compile_current_el))))
;; (setq smart-run-alist
;;       '(("\\.c$"          . "./%n")
;;         ("\\.[Cc]+[Pp]*$" . "./%n")
;;         ("\\.java$"       . "java %n")
;;         ("\\.php$"        . "php %f")
;;         ("\\.m$"          . "%f")
;;         ("\\.scm"         . "%f")
;;         ("\\.tex$"        . "dvisvga %n.dvi")
;;         ("\\.py$"         . "python %f")
;;         ("\\.pl$"         . "perl \"%f\"")
;;         ("\\.pm$"         . "perl \"%f\"")
;;         ("\\.bat$"        . "%f")
;;         ("\\.mp$"         . "mpost %f")
;;         ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
;;         ("\\.sh$"         . "./%f")))
;; (setq smart-executable-alist
;;       '("%n.class"
;;         "%n.exe"
;;         "%n"
;;         "%n.mp"
;;         "%n.m"
;;         "%n.php"
;;         "%n.scm"
;;         "%n.dvi"
;;         "%n.py"
;;         "%n.pl"
;;         "%n.ahk"
;;         "%n.pm"
;;         "%n.bat"
;;         "%n.sh"))
;;;; ca2+的配置
;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "ca2/"))) )
; (load "ca2+init" )
;;;; company   complete anything 相关配置

;;company is a complete tools
;Enable company-moxde with M-x company-mode.  Completion will start automatically after you type a few letters.
;;Use M-n, M-p, <tab> and <tab> to complete.  Search through the completions with C-s, C-r and C-o.
;; (add-to-list 'load-path
;;              (expand-file-name (concat joseph_site-lisp_install_path "elpa/company-0.5/")))
;; (autoload 'company-mode "company" nil t)
;; (add-hook 'java-mode-hook '(lambda () (company-mode)))
;; (add-hook 'emacs-lisp-mode-hook  '(lambda ()   (company-mode)))
;; (setq company-idle-delay 0)


;; (defvar company-active-map
;;   (let ((keymap (make-sparse-keymap)))
;;     (define-key keymap "\e\e\e" 'company-abort)
;;     (define-key keymap "\C-g" 'company-abort)
;;     (define-key keymap (kbd "M-n") 'company-select-next)
;;     (define-key keymap (kbd "M-p") 'company-select-previous)
;;     (define-key keymap (kbd "<down>") 'company-select-next)
;;     (define-key keymap (kbd "<up>") 'company-select-previous)
;;     (define-key keymap [down-mouse-1] 'ignore)
;;     (define-key keymap [down-mouse-3] 'ignore)
;;     (define-key keymap [mouse-1] 'company-complete-mouse)
;;     (define-key keymap [mouse-3] 'company-select-mouse)
;;     (define-key keymap [up-mouse-1] 'ignore)
;;     (define-key keymap [up-mouse-3] 'ignore)
;;     (define-key keymap "\C-m" 'company-complete-selection)
;;     (define-key keymap "\t" 'company-complete-common)
;;     (define-key keymap (kbd "<f1>") 'company-show-doc-buffer)
;;     (define-key keymap "\C-w" 'company-show-location)
;;     (define-key keymap "\C-s" 'company-search-candidates)
;;     (define-key keymap "\C-\M-s" 'company-filter-candidates)
;;     (dotimes (i 10)
;;       (define-key keymap (vector (+ (aref (kbd "M-0") 0) i))
;;         `(lambda () (interactive) (company-complete-number ,i))))

;;     keymap)
;;   "Keymap that is enabled during an active completion.")


;; (defun company-my-backend (command &optional arg &rest ignored)
;;   (case command
;;     ('prefix (when (looking-back "foo\\>")
;;                (match-string 0)))
;;     ('candidates (list "foobar" "foobaz" "foobarbaz"))
;;     ('meta (format "This value is named %s" arg))))
;;;; cedet

;;cvs -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet login
;;cvs -z3 -d:pserver:anonymous@cedet.cvs.sourceforge.net:/cvsroot/cedet co -P cedet
;;http://cedet.sourceforge.net/
;(when (featurep 'cedet) (unload-feature 'cedet t))
;(add-to-list 'load-path (concat joseph_site-lisp_install_path "cedet-cvs/"))
;(load (concat joseph_site-lisp_install_path "cedet-cvs/common/cedet.elc"))
;;(require 'cedet)
;;(require 'semantic-ia)
;;;; Enable EDE (Project Management) features
;(global-ede-mode 1)
;(semantic-load-enable-excessive-code-helpers)
;;;;;(semantic-load-enable-semantic-debugging-helpers)
;;;; Enable SRecode (Template management) minor-mode.
;;(global-srecode-minor-mode 1)
;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)
;; (add-hook 'java-mode-hook 'my-cedet-hook)
;;;; debug ,显示某个message 是在何处被执行的
;; (defadvice message (before who-said-that activate)
;;     "Find out who said that thing. and say so."
;;     (let ((trace nil) (n 1) (frame nil))
;;       (while (setq frame (backtrace-frame n))
;;         (setq n     (1+ n)
;;               trace (cons (cadr frame) trace)) )
;;       (ad-set-arg 0 (concat "<<%S>>:\n" (ad-get-arg 0)))
;;       (ad-set-args 1 (cons trace (ad-get-args 1))) ))

;;   (ad-disable-advice 'message 'before 'who-said-that)
;;    (ad-update 'message)
;;;; 相当于vi 中的o命令，在下面插入一新行，并移动光标到新行(作废)

;;熟悉了emacs 后,不再使用 C-e C-j就可以实现
;; (global-set-key (kbd "C-j") 'open-and-move-to-next-line);
;; (defun open-and-move-to-next-line(&optional arg)
;;   (interactive "p")
;;     (end-of-line)
;;     (open-line arg)
;;     (next-line)
;;     (indent-according-to-mode)
;;     )
;;;; 相当于vi 中的O命令，在前面插入一新行，并移动光标到新行(作废)

;; (defun open-and-move-to-pre-line(&optional arg)
;;   (interactive "p")
;;   (beginning-of-line)
;;   (insert "\n")
;;   (forward-line -1)
;;   (indent-relative-maybe)
;;   )
;;(global-set-key (kbd "C-o") 'open-and-move-to-pre-line)
;;(global-unset-key "\C-o")
;;"C-a C-j" "C-e C-j" 可以看出这个函数的作用
;;;; copy当前行 (作废)
;;joseph_clipboard_and_encoding.el中有关于copy当前行的更好的配置
;; (global-set-key (kbd "C-c C-k") 'copy-lines);
;; (defun copy-lines(&optional arg)
;;     (interactive "p")
;;   (save-excursion
;;         (beginning-of-line)
;;     (set-mark (point))
;;     (next-line  arg)
;;     (beginning-of-line)
;;     (kill-ring-save (mark) (point))
;;     )
;;   )
;;;; joseph-goto-line
;; (defun joseph-goto-line()
;;   "when read a num then (goto-line num ) when read a string+num then goto line by percent "
;;   (interactive)
;;   (let ((readed-string (read-from-minibuffer "Goto line(char+num by percent): "))(percent) )
;;     (if (string-match "^[%a-zA-Z ]+\\([0-9]+\\)$" readed-string )
;;         (let* ((total (count-lines (point-min) (point-max))) (num ))
;;           (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
;;           (setq num (round (* (/ total 100.0) percent)))
;;           (line-number-at-pos)
;;           (goto-char (point-min))
;;           (forward-line (1- num))
;;            )
;;       (when (string-match "^[0-9]+$" readed-string )
;;           (goto-char (point-min))
;;           (forward-line  (1- (string-to-number readed-string) ))
;;             )
;;     ))
;;   )
;; (defun joseph-goto-line-by-percent ()
;;   (interactive)
;; (let ((readed-string (read-from-minibuffer "Goto line( by percent): "))(percent) )
;;      (if (string-match "^[ \t]*\\([0-9]+\\)[ \t]*$" readed-string )
;;         (let* ((total (count-lines (point-min) (point-max))) (num ))
;;           (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
;;           (setq num (round (* (/ total 100.0) percent)))
;;           (goto-char (point-min) )
;;           (forward-line (1- num)) )
;;     ))
;;   )
;; (global-set-key "\M-gf"      'joseph-goto-line-by-percent)
;; (global-set-key [(meta g) (meta f)] 'joseph-goto-line-by-percent)
;; ;(global-set-key [(meta g) (meta f)] 'joseph-goto-line)
;;;; Ctrl+, Ctrl+. 在设定我两个光标间跳转(被joseph-quick-jump取代)
;; (global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  记住当前光标位置，可用"C+," 跳转回去
;; (global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;结合ska-point-to-register使用 "C+," 来加跳转
;; (defun ska-point-to-register()
;;   "Store cursorposition _fast_ in a register.
;;    Use ska-jump-to-register to jump back to the stored position."
;;   (interactive) (let (( zmacs-region-stays t)) (point-to-register 8)) )
;; (defun ska-jump-to-register()
;;   "Switches between current cursorposition and position
;;    that was stored with ska-point-to-register."
;;   (interactive) (let ((tmp (point-marker))( zmacs-region-stays t) ) (jump-to-register 8) (set-register 8 tmp)))
;;;; 显行号 引入linum+.el文件
;;(require 'linum+)
;;(global-linum-mode nil)
;;;; anything etag 的接合 anything-etag.el

;; ;;此文件并不在anything-config.git 库中
;; (require 'anything-etags)
;; ;;/java/tags/linux-src.tag 默认是当前目录的TAGS文件
;; (setq anything-etags-enable-tag-file-dir-cache t)
;; (setq anything-etags-cache-tag-file-dir "/java/tags/")
;; (setq anything-etags-tag-file-name "linux.tag")
;; (define-key anything-command-map (kbd "e") 'anything-etags-select-from-here);;C-w e
;; (define-key anything-command-map (kbd "C-e") 'anything-etags-select);;C-w C-e
;; changes
;;1. when in-persistent-action , it would open  too much buffers
;;   after users active the persistent action several times ,now this bug is fixed.
;;2
;;;; etags-select
;; (require 'etags-select)
;; (global-set-key "\M-?" 'etags-select-find-tag)
;; (global-set-key "\M-." 'etags-select-find-tag)
;;;; etags-stack  后退(显示etag的历史)

;; (require 'etags-stack)
;; ;; ;;显示最近etags浏览的历史,可以后退,如果没有浏览历史,则只有一个
;; ;; ;;<<current buffer>>的标签
;; ;;(global-set-key "\M-*" 'etags-stack-show)
;; ;; ;;
;; (define-key etags-stack-mode-map "\C-g" 'etags-stack-quit)

;; ;; (define-key map [(return)] 'etags-stack-go)
;; ;; (define-key map "q" 'etags-stack-quit)

;; ;; ;;An alternative (similar functionality, but with support for multiple tags types such as gtags,
;; ;; ;;and additional operations such as deleting spurious tags) is
;; ;; ;;http://github.org/markhepburn/tags-view

;;;; color

;(add-to-list 'load-path (concat joseph_site-lisp_install_path "color-theme-6.6.0/"))
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-hober)
;;;; elpa  a package install

;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "elpa/"))) )
;; ;(when (load "package")  (package-initialize)) ;; a tools to downlaod el files
;; (require 'package)(package-initialize)
;;;; browse-kill-ring+ 的设置 ,关于列出剪切环中的内容以供选择

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
;;;; tabbar 的设置，注释掉了

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
;;;; mmm-mode 多个主major-mode共存

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
;;;; multi-mode
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
;;;; config about ecb ,一个浏览文件的工具
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
;;;; sunrise File Manager 基于dired

;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "sunrise/"))) )
;; (require 'sunrise-commander)
;; ;(require 'sunrise-x-buttons) ;;add button for new users, can't use together with x-popviewer
;; (require 'sunrise-x-mirror) ;full read/write access to compressed archives
;; ;;In order to perform your copy or rename operation in the background,
;; ;;the only thing you have to do is add an empty prefix to the usual keystroke
;; ;;C will perform a regular copy in the foreground and C-u C will do it in the background
;; (require 'sunrise-x-loop) ;copying and renaming files in the background
;; ;;;;(require 'sunrise-x-popviewer);making the viewer window float, it show in new frame , i don't like it

;; (require 'sunrise-x-modeline); show current path on modeline
;; (require 'sunrise-x-tabs) ;;tab brower ,C-j(new) C-k(kill) C-n (next) C-p (prev),
;; (require 'sunrise-x-tree) ;;tree
;; ;;当C-x C-f 打开一个目录时,优先使用sr-dired打开目录
;; (setq find-directory-functions (quote (sr-dired cvs-dired-noselect dired-noselect)))

;; (setq sr-modeline-use-utf8-marks t)
;; (global-set-key "\C-cx" (quote sunrise))
;; (global-set-key "\C-c\C-x" (quote sunrise-cd))
;; ;;sunrise mode  press h for help
;; (setq sr-modeline-use-utf8-marks t)
;; ;;;; * C-t + Space (alternatively C-t + Return) - switch between tree and normal
;; (setq tree-widget-image-enable t)
;; (setq sr-virtual-listing-switches " --time-style=locale --group-directories-first -alDphgG")
;; (setq sr-listing-switches " --time-style=locale --group-directories-first -alDphgG")
;; (setq sr-show-hidden-files nil);;C-o toggle
;; (setq sr-window-split-style (quote top)); C-c C-s toggle style
;; ;;C-c t  open terminal cuurent dir
;; (define-key sr-mode-map "z"       'sr-fuzzy-narrow)
;;;; ido模式，C-x C-f 查找文件时的一种模式

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
;;;; smart-tab

;(eval-and-compile
;  (add-to-list 'load-path  (expand-file-name (concat joseph_site-lisp_install_path "smart-tab/")))
;  )
;(require 'smart-tab)
;(global-smart-tab-mode 1)
;(setq smart-tab-using-hippie-expand t)
;;;; 交换数字键与 特殊符号键(如8 与 *)
;;,写程序的时候有时候这些特殊符号会比数字键更常用
;; (defvar num-and-special-symbol-is-normal nil)
;; (defvar my-key-pairs
;;       '((?! ?1) (?@ ?2) (?# ?3) (?$ ?4) (?% ?5)
;;         (?^ ?6) (?& ?7) (?* ?8) (?( ?9) (?) ?0)
;;         (?- ?_) (?\" ?') (?{ ?[) (?} ?])         ; (?| ?\\)
;;         ))

;; (defun toggle-num-and-special-symbol-key-pairs()
;;   (interactive)
;;   (if num-and-special-symbol-is-normal
;;       (my-key-swap my-key-pairs)
;;     (my-key-restore my-key-pairs)
;;     )
;;   (setq num-and-special-symbol-is-normal
;;         (not num-and-special-symbol-is-normal ))
;;   )

;; (defun my-key-swap (key-pairs)
;;   (if (eq key-pairs nil)
;;       (message "Keyboard zapped!! F() to restore!")
;;       (progn
;;         (keyboard-translate (caar key-pairs)  (cadar key-pairs))
;;         (keyboard-translate (cadar key-pairs) (caar key-pairs))
;;         (my-key-swap (cdr key-pairs))
;;         )
;;     ))
;; (defun my-key-restore (key-pairs)
;;   (if (eq key-pairs nil)
;;       (message "Keyboard restored!! F9 to Zap!")
;;       (progn
;;         (keyboard-translate (caar key-pairs)  (caar key-pairs))
;;         (keyboard-translate (cadar key-pairs) (cadar key-pairs))
;;         (my-key-restore (cdr key-pairs))
;;         )
;;     ))
;; (my-key-swap my-key-pairs)
;; (global-set-key [(f9)]  'toggle-num-and-special-symbol-key-pairs )


;;; tail
(provide 'joseph_init)
;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;; emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile *.el

;;C-x C-e run current lisp
; ;; -*-no-byte-compile: t; -*-
;;
;;首先~/.emacs.d/site-lisp/lisp/josehp-loaddefs.el文件是
;;(joseph-update-directory-autoloads-recursively)函数自动生成的
;;这个文件中所有语句都是通过扫描~/.emacs.d/所有子目录下的el文件生成的autoload语句.
;;(joseph-update-directory-autoloads-recursively)
;;函数在joseph-autoload.el文件中定义，
;;而它也会被扫描进joseph-loaddefs.el,
