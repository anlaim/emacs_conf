;;; -*- coding:utf-8 -*-
 ;;;;Time-stamp: <Joseph 2011-07-24 11:43:55 星期日>
;;;_*  byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )


;; 一些与键绑定相关的配置
;;(require 'joseph-util)
;;(require 'joseph-command)
(require 'joseph_keybinding);
;;其他零碎的配置都放到joseph_common.el文件
(require 'joseph_common)
;;;_* joseph_sudo 通过sudo 以root 用户身份打开当前文件(一键切换)
(when (eq system-type 'gnu/linux)
     ;;emacs 自带一个功能实现编辑只读文件C-x C-q  toggle-read-only
     ;; now you can use "C-c o" to toggle between root and common user to edit current file
      (require 'joseph_sudo)

      (global-set-key "\C-x\C-r" 'joseph-sudo-find-file)
   ;;   (add-hook 'find-file-hooks 'joseph-sudo-find-file-hook);; find-file-hooks 是加载完file 之后调用的一个hook
      (global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
      ;;(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file) ;;
      )


;;与dired 文件管理相关的配置
(require 'joseph_dired)
(require 'joseph-openwith)
;; 与 剪切板,编码,X window-nt相关的东西
(if (equal system-type 'gnu/linux)
    (require 'joseph_clipboard_and_encoding)
  (require 'joseph-w32))

;; 所有关于矩形操作的配置都在joseph_rect_angle.el文件中
(require 'joseph_rect_angle)

;;jad decompile ,when you open a Java.class File ,it will use jad
;;decomplie the class ,and load the java file to buffer
;; need support of jde
(require 'joseph_jad_decompile)
(require 'joseph-file-name-cache)
;;所有关于自动补全的功能都在joseph_complete.el 文件中进行配置
(require 'joseph_complete)
;;;_* ibuffer

;;加载完ibuffer.el之后，立即加载joseph_ibuffer,
;;如此，在启动emacs时不需要加载joseph_ibuffer.el.
(add-hook 'ibuffer-load-hook '(lambda () (require 'joseph_ibuffer)))
(global-set-key ( kbd "C-x C-c") 'ibuffer)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; 原来 的C-x C-c


;;;_* joseph scroll screen up and down

(autoload 'joseph-scroll-half-screen-down "joseph-scroll-screen" "scroll half screen down" t)
(autoload 'joseph-scroll-half-screen-up "joseph-scroll-screen" "scroll half screen up" t)
(global-set-key "\C-v" 'joseph-scroll-half-screen-down)
(global-set-key "\C-r" 'joseph-scroll-half-screen-up)


;;;_* quick-jump.el 我写的quick-jump

(autoload 'quick-jump-push-marker "quick-jump"
  " push current marker in ring. you can jump back" t)
(autoload 'quick-jump-go-back "quick-jump"
  "Go back in `qj-marker-ring'")
(autoload 'quick-jump-go-forward "quick-jump"
  "Go forward in `qj-marker-ring'")
(autoload 'quick-jump-clear-all-marker "quick-jump"
  "clear all marker in `qj-marker-ring'.")
(autoload 'quick-jump-default-keybinding "quick-jump"
  "default keybindings for quick-jump" nil)
(global-set-key (kbd "C-,") 'quick-jump-go-back)
(global-set-key (kbd "C-.") 'quick-jump-push-marker)
(global-set-key (kbd "C-<") 'quick-jump-go-forward)
(global-set-key (kbd "C->") 'quick-jump-clear-all-marker)



;;;_* goto-last change

;;快速跳转到当前buffer最后一次修改的位置 利用了undo定位最后一次在何处做了修改
(autoload 'goto-last-change "goto-last-change"
  "Set point to the position of the last change." t)
(global-set-key (kbd "C-x C-/") 'goto-last-change)



;;;_* 上下移动当前行, (Eclipse style) `M-up' and `M-down'

;; 模仿eclipse 中的一个小功能，用;alt+up alt+down 上下移动当前行
;;不仅当前行,也可以是一个选中的区域

;;(require 'move-text)
;;default keybinding is `M-up' and `M-down'
(autoload 'move-text-up "move-text" "move current line or selected regioned up" t)
(autoload 'move-text-down "move-text" "move current line or selected regioned down" t)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)


;;C-x C-f 时 输入 / 或者~ 会自动清除原来的东西,只留下/ 或者~
(require 'minibuf-electric-gnuemacs)
(require 'joseph_tags);;需要在anything load之后
(require 'joseph-anything)
(require 'joseph-vc)
;;;_* 将 speedbar  在同一个frame 内显示

(autoload 'sr-speedbar-toggle "sr-speedbar" "show speedbar in same frame" t)
(setq-default sr-speedbar-width-x 36)
(setq-default sr-speedbar-width-console 36)
(setq-default sr-speedbar-auto-refresh t) ;;default is t
(setq-default sr-speedbar-right-side nil)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;;;sr-speedbar-refresh-toggle
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


;;;_* shell emacs 之间快速切换
;;(autoload 'term-toggle-cd "term-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
;;(global-set-key [M-f1] 'term-toggle-cd)
(autoload 'shell-toggle "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
(global-set-key [C-f1] 'shell-toggle)
(autoload 'shell-toggle-cd "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
(global-set-key [M-f1] 'shell-toggle-cd)
  ;; (autoload 'term-toggle "term-toggle"
  ;;  "Toggles between the *terminal* buffer and whatever buffer you are editing."
  ;;  t)
  ;; (autoload 'term-toggle-cd "term-toggle"
  ;;  "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
  ;; (global-set-key [M-f1] 'term-toggle)
  ;; (global-set-key [C-f1] 'term-toggle-cd)



;;;_* js2-mode javascript-IDE

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;;_* smooth-scroll 平滑滚动

(autoload 'scroll-up-1 "smooth-scroll" "" t)
(autoload 'scroll-down-1 "smooth-scroll" "" t)
(autoload 'scroll-right-1 "smooth-scroll" "" t)
(autoload 'scroll-left-1 "smooth-scroll" "" t)
(autoload 'smooth-scroll-mode "smooth-scroll" "" nil )
(setq-default smooth-scroll/vscroll-step-size 1)
(smooth-scroll-mode)

(global-set-key [(control  down)]  'scroll-up-1)
(global-set-key [(control  up)]    'scroll-down-1)
(global-set-key [(control  left)]  'scroll-right-1)
(global-set-key [(control  right)] 'scroll-left-1)

;;;_* compile 自动编辑
  ;;;_* 关于Compilation mode
(setq compilation-ask-about-save nil) ;;编译之前自动保存buffer
(setq compilation-auto-jump-to-first-error t);;编译完成后自动跳到第一个error处
;;(setq compilation-read-command nil);;不必提示用户输入编译命令
(setq compilation-read-command t);;

;;"C-x`"  跳到下一个error处(可以在源码及compilation窗口中使用)
;; "C-uC-x`" 从头开始查找error

  ;;;_* joseph_compile_current_el

(defun joseph_compile_current_el_without_output()
   (when (and (member major-mode '(emacs-lisp-mode lisp-interaction-mode)))
     (start-process-shell-command "byte compile" nil (format
           (concat " emacs  -batch    -l "
                   joseph_joseph_install_path
                   "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
           (buffer-file-name)))))

(add-hook 'after-save-hook 'joseph_compile_current_el_without_output)

(defun joseph_compile_current_el_outside()
  (let ((command))
    (setq command
          (format
           (concat " emacs  -batch    -l " joseph_joseph_install_path "joseph_byte_compile_include.el  -f batch-byte-compile %s ")
           (buffer-file-name)))
    (with-current-buffer (get-buffer-create "*joseph_compile_current_el*")
      (insert (shell-command-to-string command)))
    (switch-to-buffer (get-buffer-create "*joseph_compile_current_el*"))))


  ;;;_* compile-dwim
;;(require 'compile-dwim)
(autoload 'compile-dwim-run "compile-dwim" "doc" t)
(autoload 'compile-dwim-compile "compile-dwim" "doc" t)

(global-set-key "\C-zs" 'compile-dwim-compile)
(global-set-key "\C-zr" 'compile-dwim-run)

(setq-default compile-dwim-alist
  `((perl (or (name . "\\.pl$")
              (mode . cperl-mode))
          "%i -wc \"%f\"" "%i \"%f\"")
    (c    (or (name . "\\.c$")
              (mode . c-mode))
          "gcc -o %n %f" "./%n")
    ;; (c    (or (name . "\\.c$")
    ;;           (mode . c-mode))
    ;;       ("gcc -o %n %f" "gcc -g -o %n %f") ("./%n" "cint %f") "%n")
    (c++  (or (name . "\\.cpp$")
              (mode . c++-mode))
          ("g++ -o %n %f" "g++ -g -o %n %f") "./%n" "%n")
    (java (or (name . "\\.java$")
              (mode . java-mode))
          "javac %f" "java %n" "%n.class")
    (python (or (name . "\\.py$")
                (mode . python-mode))
            "%i %f" "%i %f")
    (javascript (or (name . "\\.js$")
                    (mode . javascript-mode))
                "smjs -f %f" "smjs -f %f")
    (tex   (or (name . "\\.tex$")
               (name . "\\.ltx$")
               (mode . tex-mode)
               (mode . latex-mode))
           "latex %f" "latex %f" "%n.dvi")
    (texinfo (name . "\\.texi$")
             (makeinfo-buffer) (makeinfo-buffer) "%.info")
    (sh    (or (name . "\\.sh$")
               (mode . sh-mode))
           "%i ./%f" "%i ./%f")
    (f99   (name . "\\.f90$")
           "f90 %f -o %n" "./%n" "%n")
    (f77   (name . "\\.[Ff]$")
           "f77 %f -o %n" "./%n" "%n")
    (php   (or (name . "\\.php$")
               (mode . php-mode))
           "php %f" "php %f")
    (elisp (or (name . "\\.el$")
               (mode . emacs-lisp-mode)
               (mode . lisp-interaction-mode))
           (joseph_compile_current_el_outside)
            (emacs-lisp-byte-compile) "%fc"))
  )



;;;_* hide-region.el hide-lines.el
;;(require 'hide-region)
(autoload 'hide-region-hide "hide-region" "hide region" t)
(autoload 'hide-region-unhide "hide-region" "unhide region" t)
(global-set-key (kbd "C-z h ") (quote hide-region-hide));;隐藏选区
(global-set-key (kbd "C-z H ") (quote hide-region-unhide));;重现选区

(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
;;隐藏符合正则表达式的行，或只现示符合的行
;; (defun hide-lines (&optional arg)
;;   "Hide lines matching the specified regexp.
;; With prefix arg: Hide lines that do not match the specified regexp"
;;   (interactive "p")
;;   (if (> arg 1)
;;       (call-interactively 'hide-matching-lines)
;;       (call-interactively 'hide-non-matching-lines)
;;       ))

(global-set-key (kbd  "C-z l") 'hide-lines);;;All lines matching this regexp will be ;; hidden in the buffer
;;(define-key dired-mode-map "z" 'hide-lines)
;;加一个前缀参数C-u C-z l  则 只显示符合表达式的行
(global-set-key (kbd "C-z L" ) 'show-all-invisible);; 显示隐藏的行


;;;_* auto-document 为el文件自动生成doc

(autoload 'auto-document "auto-document" "generate doc for el files" t)
(autoload 'auto-document-maybe "auto-document" "generate doc for el files" )

;;前提是 文档中必须有";;; Commentary:" 然后它会在其后自动插入相应的内容
;;如 ";;; Customizable Options:"
;;使用方法,在el文件中运行`auto-document'命令
;;(require 'auto-document)
;; If you want to update auto document before save, add the following.
;;如果想要在文件保存的时候自动插入及更新相应的文档内容,可以加入这个hook
 (add-to-list 'before-save-hook 'auto-document-maybe)


;;;_* auto install

(autoload 'auto-install-from-url "auto-install" "auto install from url" nil)
(autoload 'auto-install-batch "auto-install" "auto install batch" t)
(autoload 'auto-install-from-library "auto-install" "auto install from library" t)

(setq-default auto-install-save-confirm nil)
(setq-default auto-install-directory "~/.emacs.d/site-lisp/auto-install/")

(autoload 'anything-auto-install-from-emacswiki "anything-auto-install" " Launch anything with auto-install separately." t)
(autoload 'anything-auto-install-from-library "anything-auto-install" "Update library with `anything'." t)
(autoload 'anything-auto-install-batch "anything-auto-install" "    Batch install elisp libraries.." t)
(autoload 'anything-auto-install "anything-auto-install" "  All-in-one command for elisp installation." t)
;;  `anything-auto-install-from-emacswiki'
;;    Launch anything with auto-install separately.
;;  `anything-auto-install-from-library'
;;    Update library with `anything'.
;;  `anything-auto-install-batch'
;;    Batch install elisp libraries.
;;  `anything-auto-install'
;;    All-in-one command for elisp installation.

;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-auto-install.el")
;; (auto-install-batch "icicles")
;;;;icicles中有文件依赖ring+.el,手动下载之
;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/ring+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/doremi-frm.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/hexrgb.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/frame-fns.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/faces+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/thingatpt+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/session.el")
;;;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-c-javadoc.el")
;;http://www.emacswiki.org/emacs/download/anything-dabbrev-expand.el
;;
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-dabbrev-expand.el")


;;;_*关于 关闭讨厌的 buffer window
  ;;;_* bury some boring buffers,把讨厌的buffer移动到其他buffer之后

(defun  bury-boring-buffer()
  (let ((cur-buf-name (buffer-name (current-buffer)))
        (boring-buffers '("*Completions*" "*SPEEDBAR*")))
    (mapc '(lambda(boring-buf)
             (unless (equal cur-buf-name boring-buf)
               (when (buffer-live-p (get-buffer boring-buf))
               (bury-buffer boring-buf))))
          boring-buffers)
    ))
;;尤其是使用icicle时,经常关闭一个buffer后,默认显示的buffer是*Completions*
;;所以在kill-buffer时,把这些buffer放到最后
(add-hook 'kill-buffer-hook 'bury-boring-buffer)


  ;;;_* 自动清除长久不访问的buffer

(require 'midnight)
;;kill buffers if they were last disabled more than this seconds ago
;;如果一个buffer有3min没被访问了那么它会被自动关闭
(setq clean-buffer-list-delay-special (* 60  5));;3*60s
;;有一个定时器会每隔一分钟检查一次,哪些buffer需要被关闭
(defvar clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one.
 You can disable clean-buffer-list by
 (cancel-timer clean-buffer-list-timer).")

;; run clean-buffer-list every 60s
(setq clean-buffer-list-timer (run-at-time t 60 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
;;这里设成匹配任何buffer,任何buffer都在auto kill之列,
;;(setq clean-buffer-list-kill-regexps '("^"))
(setq clean-buffer-list-kill-buffer-names
  '("*Completions*" "*Compile-Log*"
    "*Apropos*" "*compilation*" "*Customize*"
      "*desktop*" ;;"\\*Async Shell Command"
    ))
(setq clean-buffer-list-kill-regexps
       (list (rx (or
           "\*anything"
           "\*vc-diff\*"
           "\*vc-change-log\*"
           "\*VC-log\*"
           "\*sdcv\*"
           ))
      ))
;;下面的buffer是例外,它们不会被auto kill
;;这样的buffer不会被清除
;; * currently displayed buffers
;; * buffers attached to processes, and
;; * internal buffers that were never displayed
;; * buffers with files that are modified

(setq clean-buffer-list-kill-never-buffer-names
      '("*scratch*" "*Messages*" "*server*"))


(setq clean-buffer-list-kill-never-regexps
      '("^ \\*Minibuf-.*\\*$")
      )
;;自动清除某些buffer时,会输出一此很长的信息,我认为没用,暂时重新定义了`message'
(defadvice clean-buffer-list (around no-message-output activate)
  "Disable `message' when wrapping candidates."
  (flet ((message (&rest args)))
    ad-do-it)
;;  (kill-buffer "*Compile-Log*")
  )


  ;;;_* close-boring-windows with `C-g'
(defvar boring-window-modes
  '(help-mode compilation-mode log-view-mode log-edit-mode ibuffer-mode)
  )

(defvar boring-window-bof-name-regexp
  (rx (or
    "\*Anything"
    "\*vc-diff\*"
    "\*vc-change-log\*"
    "\*VC-log\*"
    "\*sdcv\*"
    )))

(defun close-boring-windows()
  "close boring *Help* windows with `C-g'"
  (let ((opened-windows (window-list)))
    (dolist (win opened-windows)
      (set-buffer (window-buffer win))
      (when (or
          (memq  major-mode boring-window-modes)
          (string-match boring-window-bof-name-regexp (buffer-name))
          )
        (if (>  (length (window-list)) 1)
            (kill-buffer-and-window)
          (kill-buffer)
          )))))

(defadvice keyboard-quit (before close-boring-windows activate)
  (close-boring-windows)
  (when (active-minibuffer-window)
  (anything-keyboard-quit)
  (abort-recursive-edit)
  ))



;;;_* highlight-parentheses 高亮显示括号

(require 'highlight-parentheses)
;; (add-hook 'highlight-parentheses-mode-hook
;;           '(lambda ()
;;              (setq autopair-handle-action-fns
;;                    (append
;; 					(if autopair-handle-action-fns
;; 						autopair-handle-action-fns
;; 					  '(autopair-default-handle-action))
;; 					'((lambda (action pair pos-before)
;; 						(hl-paren-color-update)))))))


(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(setq hl-paren-background-colors (quote ("LightCoral" "LightBlue" "LemonChiffon" "purple")))
(setq hl-paren-colors (quote ("Goldenrod" "cyan" "green" "orange")))

(global-highlight-parentheses-mode t)


;;;_* 自动补全括号等
(require 'joseph-autopair)
(setq-default joseph-autopair-alist
  '( (emacs-lisp-mode . (
                         ("\"" "\"")
                         ("`" "'")
                         ("(" ")")
                         ("[" "]")
                         ))
     (lisp-interaction-mode . (
                               ("\"" "\"")
                               ("`" "'")
                               ("(" ")")
                               ("[" "]")
                               ))
     ( c-mode . (
                 ("\"" "\"" )
                 ("'" "'")
                 ("(" ")" )
                 ("[" "]" )
                 ("{" (joseph-autopair-newline-indent-insert "}"))
                 ))
     (java-mode . (
                   ("\"" "\"")
                   ("'" "'")
                   ("(" ")")
                   ("[" "]")
                   ("{" (joseph-autopair-newline-indent-insert "}"))
                   ))
     (sh-mode . ( ;;just a example
                 ("if" (joseph-autopair-newline-indent-insert "fi"))
                 ("begin" (progn
                            (insert " end")
                            (end-of-line)
                            ))
                 )))
  )
(joseph-autopair-toggle-autopair)

;;;_* linkd-mode 文档用的超链接

;;读取icicle的文档时可以跳转
(autoload 'linkd-mode "linkd" "doc" t)
;; enable it by (linkd-mode) in a linkd-mode
; icicles-doc1.el 文档用它进行超链接


(require 'joseph-icicle)

(run-with-idle-timer 10 nil '(lambda () (require 'joseph-cedet) (message "cedet is loaded")))

;;(require 'joseph-cedet)
;;对c java c++ 等语言猜测indent时应该offset的大小
;;主要用于编辑原有的代码时能够正确的缩进,主要通过
;;修改c-basic-offset
(add-hook 'java-mode-hook '(lambda()(require 'guess-offset)))
;;java不能正确的缩进Annotation,
;;http://www.emacswiki.org/emacs/download/java-mode-indent-annotations.el
(autoload 'java-mode-indent-annotations-setup "java-mode-indent-annotations" "indent java annotations" nil)
(add-hook 'java-mode-hook 'java-mode-indent-annotations-setup)
;;(require 'joseph_folder)
(require 'joseph-allout)
;;;_* fast navigate
(autoload 'zap-up-to-char-forward "fastnav"    "doc string." t)
(autoload 'zap-up-to-char-backward "fastnav"  "doc string." t)
(autoload 'jump-to-char-forward "fastnav"  "doc string." t)
(autoload 'jump-to-char-backward "fastnav"  "doc string." t)
(autoload 'replace-char-forward "fastnav"  "doc string." t)
(autoload 'replace-char-backward "fastnav"  "doc string." t)
(autoload 'insert-at-char-forward "fastnav"  "doc string." t)
(autoload 'insert-at-char-backward "fastnav"  "doc string." t)
(autoload 'execute-at-char-forward "fastnav"  "doc string." t)
(autoload 'execute-at-char-backward "fastnav"  "doc string." t)
(autoload 'delete-char-forward "fastnav"  "doc string." t)
(autoload 'delete-char-backward "fastnav"  "doc string." t)
(autoload 'mark-to-char-forward "fastnav"  "doc string." t)
(autoload 'mark-to-char-backward "fastnav"  "doc string." t)
(autoload 'sprint-forward "fastnav"  "doc string." t)
(autoload 'sprint-backward "fastnav"  "doc string." t)

(global-set-key "\M-k" 'zap-up-to-char-forward)
(global-set-key "\M-K" 'zap-up-to-char-backward)
(global-set-key "\M-s" 'jump-to-char-forward)
(global-set-key "\M-S" 'jump-to-char-backward)
(global-set-key "\M-m" 'mark-to-char-forward)
(global-set-key "\M-M" 'mark-to-char-backward)
(global-set-key (kbd "M-'") 'sprint-forward)
(global-set-key (kbd "M-\"") 'sprint-backward)

(global-set-key "\M-i" 'insert-at-char-forward)
(global-set-key "\M-I" 'insert-at-char-backward)
(global-set-key "\M-j" 'execute-at-char-forward)
(global-set-key "\M-J" 'execute-at-char-backward)
(global-set-key "\M-r" 'replace-char-forward)
(global-set-key "\M-R" 'replace-char-backward)
;; (global-set-key "\M-k" 'delete-char-forward)
;; (global-set-key "\M-K" 'delete-char-backward)


(eval-after-load 'shell '(require 'joseph-shell))


;;关于用org-publish 生成个人网站的功能
(eval-after-load 'org-publish '(require 'joseph-org-publish))
(autoload 'publish-my-note "joseph-org-publish" "publish my note笔记" t)
(autoload 'publish-my-note-force "joseph-org-publish" "publish my note笔记" t)

(eval-after-load 'org '(require 'joseph-org))
(define-key global-map [(control meta ?r)] 'remember)
(eval-after-load 'remember '(require 'joseph-org))
(global-set-key (kbd "C-c a")  'org-agenda)


(setq-default ahk-syntax-directory "~/.emacs.d/site-lisp/ahk-mode/syntax/")
(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))
(add-to-list 'ac-modes 'ahk-mode)
(autoload 'ahk-mode "ahk-mode")

(eval-after-load 'sql '(require 'joseph-sql))

;;;_* autoload Support
(autoload 'joseph-update-directory-autoloads-recursively
  "joseph-autoload" "update joseph-loaddefs.el" t)
;;(add-hook 'kill-emacs-hook 'joseph-update-directory-autoloads-recursively)
(require 'joseph-loaddefs nil t)

;;主要用于录制视频时，显示在emacs中按下了哪些键，调用了哪些命令
;;http://www.foldr.org/~michaelw/emacs/mwe-log-commands.el
;;(require 'mwe-log-commands)
;;(mwe:log-keyboard-commands)有于对当前buffer启用键盘记录功能
;;只是启用还不行，还需要打开一个buffer显示按下的内容，
;;(mwe:open-command-log-buffer)
;;想不通作者为什么要把它做成两个命令
;;;_*  注释掉的
   ;;;_* googletalk
;; ;;googletalk client
;; (require 'jabber-autoloads)
;; (setq jabber-account-list '(
;;                              ("jixiuf@gmail.com"
;;                                 (:password. "zhao2170")
;;                                 (:network-server . "talk.google.com")
;;                                 (:port . 443)
;;                                 (:connection-type . ssl))
;;                              ))

   ;;;_* 使用外部命令打开文件 "!"

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


   ;;;_* 对于Windows 用户,隐藏掉不需要的信息,如文件权限

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
;;;; 注意和 (add-hook 'dired-after-readin-hook 'sof/dired-sort) 的冲突要保证
;;;; dired-after-readin-hook 中 wcy-dired-mode-hide-column 在 sof/dired-sort 之后
;; (when (eq system-type 'windows-nt)
;;   (add-hook 'dired-after-readin-hook 'wcy-dired-mode-hide-column t nil))

;;;end of 对于Windows 用户,隐藏掉不需要的信息,如文件权限


   ;;;_* files+ ls-lisp+ 没什么用

;;;; files+.el对files.el增强
;;;; ls-list+.el 对ls-list.el增强 ,主要在MS系统上使用
;;;; ls-list+.el里面自动require files+
;; (eval-after-load "files"
;;   '(cond ((eq system-type 'gnu/linux)
;;          (require 'files+) )
;;         ((eq system-type 'windows-nt)
;;          (require 'ls-lisp+)))
;; )


   ;;;_* dired+

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



   ;;;_*popwin.el 把 *Help* *Completions* 等window 可以用`C-g' 关闭掉
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

   ;;;_* 将选区或者当前buffer 生成html格式（带语法着色）
;;emacs 自动了htmlfontify-buffer具有相同的功能
;; ;; M-x htmtize-file
;; ;;(require 'htmlize)
;; (autoload 'htmlize-file "htmlize" "将选区或者当前buffer 生成html格式（带语法着色）" t)

   ;;;_* 调色板palette

;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/hexrgb.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/palette.el")
;;(require 'palette)


   ;;;_*  Java中的一个小扩展，在行尾补全大括号

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


   ;;;_* 关于autopair skeleton

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


   ;;;_* 快速输入括号
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

   ;;;_* javascript.el
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;; (autoload 'javascript-mode "javascript" nil t)

   ;;;_* smart-compile

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


   ;;;_* ca2+的配置
;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "ca2/"))) )
; (load "ca2+init" )


   ;;;_* company   complete anything 相关配置

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


   ;;;_* cedet

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


   ;;;_* debug ,显示某个message 是在何处被执行的

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


   ;;;_* 相当于vi 中的o命令，在下面插入一新行，并移动光标到新行(作废)

;;熟悉了emacs 后,不再使用 C-e C-j就可以实现
;; (global-set-key (kbd "C-j") 'open-and-move-to-next-line);
;; (defun open-and-move-to-next-line(&optional arg)
;;   (interactive "p")
;;     (end-of-line)
;;     (open-line arg)
;;     (next-line)
;;     (indent-according-to-mode)
;;     )


   ;;;_* ;相当于vi 中的O命令，在前面插入一新行，并移动光标到新行(作废)

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


   ;;;_* copy当前行 (作废)
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


   ;;;_* joseph-goto-line
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

   ;;;_* Ctrl+, Ctrl+. 在设定我两个光标间跳转(被joseph-quick-jump取代)
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


   ;;;_* 显行号 引入linum+.el文件
;;(require 'linum+)
;;(global-linum-mode nil)

   ;;;_* anything etag 的接合 anything-etag.el

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


   ;;;_* etags-select
;; (require 'etags-select)
;; (global-set-key "\M-?" 'etags-select-find-tag)
;; (global-set-key "\M-." 'etags-select-find-tag)

   ;;;_* etags-stack  后退(显示etag的历史)

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



   ;;;_* color

;(add-to-list 'load-path (concat joseph_site-lisp_install_path "color-theme-6.6.0/"))
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-hober)


   ;;;_* elpa  a package install

;; (eval-and-compile
;;   (add-to-list 'load-path
;;                (expand-file-name (concat joseph_site-lisp_install_path "elpa/"))) )
;; ;(when (load "package")  (package-initialize)) ;; a tools to downlaod el files
;; (require 'package)(package-initialize)


   ;;;_* browse-kill-ring+ 的设置 ,关于列出剪切环中的内容以供选择
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



   ;;;_* tabbar 的设置，注释掉了

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


   ;;;_*mmm-mode 多个主major-mode共存

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


   ;;;_* multi-mode
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

   ;;;_* config about ecb ,一个浏览文件的工具
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

   ;;;_* sunrise File Manager 基于dired

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


   ;;;_* ido模式，C-x C-f 查找文件时的一种模式

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


   ;;;_* smart-tab

;(eval-and-compile
;  (add-to-list 'load-path  (expand-file-name (concat joseph_site-lisp_install_path "smart-tab/")))
;  )
;(require 'smart-tab)
;(global-smart-tab-mode 1)
;(setq smart-tab-using-hippie-expand t)


   ;;;_* 交换数字键与 特殊符号键(如8 与 *)
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

