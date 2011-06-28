;; -*- coding:utf-8 -*-
;;{{{ byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;}}}
(setq-default save-completions-file-name "~/.emacs.d/cache/completions")
;;{{{ yasnippet 的设置

(defvar yasnippet-snippet-path (concat joseph_root_install_path "yasnippet-snippet") "Path of `yasnippet-snippet'")
(require 'yasnippet) ;;
(setq-default yas/root-directory yasnippet-snippet-path)
(yas/load-directory yas/root-directory)
(setq-default yas/prompt-functions '( yas/dropdown-prompt yas/x-prompt  yas/ido-prompt yas/completing-prompt)) ;;设置提示方式，文本/X
(yas/global-mode 1)
;; (setq-default yas/next-field-key (quote ("TAB" "<tab>" "<return>")))
;; (yas/init-yas-in-snippet-keymap)
;;; With `view-mdoe'
;; Mysteriously after exiting view-mode, yas/minor-mode is nil.
(defadvice view-mode-exit (after yasnippet activate)
  (yas/minor-mode-on))
;; (progn (ad-disable-advice 'view-mode-exit 'after 'yasnippet) (ad-update 'view-mode-exit))
(defadvice view-mode-disable (after yasnippet activate)
  (yas/minor-mode-on))
;; (progn (ad-disable-advice 'view-mode-disable 'after 'yasnippet) (ad-update 'view-mode-disable))
(defadvice view-mode-enable (after yasnippet activate)
  (yas/minor-mode-off))
;; (progn (ad-disable-advice 'view-mode-enable 'after 'yasnippet) (ad-update 'view-mode-enable))


;;; Disable flymake during expansion
;;如果你根本就没开flymake,直接将此值设为nil即可
(defvar flymake-is-active-flag nil)
(defadvice yas/expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))

(add-hook 'yas/after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))
;;}}}
;;{{{ nxml-mode
(autoload 'nxml-complete "nxml-mode" "nxml-complete." t)
;;C-c C-x 插入<?xml version="1.0" encoding="utf-8"?>
;;Set the schema for this buffer automatically and turn on `rng-validate-mode'.
;;C-c C-s C-a (rng-auto-set-schema-and-validate)
;;根据当前文件的内容决定用哪一个schema 进行补全验证等,
;;C-return  nxml-complete
(add-hook 'nxml-mode-hook (lambda ()
                            (local-set-key "\t" 'nxml-complete)
                            (local-set-key "\M-2" 'nxml-complete)
                            (setq yas/fallback-behavior 'nxml-complete)
                            ))
;;C-c C-b 在下一行补齐 end tag  ,如 <head 时输入
;;C-c TAB  在同一行关闭end tag
;;C-c C-f 关闭最近的未关闭的tag ,好像与C-c TAB 有点类似
;;树形导航
;;C-M-u 上一层元素
;;C-M-d 下一层元素
(setq-default nxml-auto-insert-xml-declaration-flag nil)
(setq-default nxml-attribute-indent 2)
(setq-default nxml-bind-meta-tab-to-complete-flag t)
(setq-default nxml-slash-auto-complete-flag t);;"</" 自动补全
;;<h1 > hello,-|- world </h1>  (-|-代表光标) C-c RET会分之为
;;<h1>hello,</h1> <h1>world</h1>
;;C-c RET (nxml-split-element)


(defun alexott/nxml-mode-hook ()
  (local-set-key "\C-c/" 'nxml-finish-element)
  (auto-fill-mode)
  (rng-validate-mode)
  (unify-8859-on-decoding-mode)
  (hs-minor-mode 1)
  )
(add-hook 'nxml-mode-hook 'alexott/nxml-mode-hook)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "\\|<[^/>]&>\\|<[^/][^>]*[^/]>"
               ""
               nil))
;;}}}
;;{{{  auto-complete 的配置
(defvar auto-complete-dict-path (concat joseph_root_install_path "auto-complete-dict"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories auto-complete-dict-path)
(ac-config-default)
;; After completion is started, operations in the following table will be enabled temporarily
;;这几个键是临时的，补全完毕会即不可用
;; TAB,  C-i 	ac-expand 	Completion by TAB
;; RET,  C-m 	ac-complete 	Completion by RET  同TAB，但是他是级联的，也会完成补全的补全
;; down, M-n 	ac-next 	Select next candidate   选择下一个，我修改为C-n
;; up,   M-p 	ac-previous 	Select previous candidate
;; C-?,  f1 	ac-help 	Show buffer help
;; C-s 在出现候选项后，可以C-s 进行过滤，只过滤想要的选项
(setq ac-use-menu-map t) ;;只在菜单出现的出时进行C-n C-p 选择菜单的操作
(define-key ac-menu-map "\C-n" 'ac-next) ;;选择下一个候选项
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-menu-map "\r" 'ac-complete)
(define-key ac-completing-map "\C-e" 'ac-complete)
(setq ac-show-menu-immediately-on-auto-complete) ;;
(setq ac-expand-on-auto-complete)
(setq ac-menu-height 13);;设置菜单栏的高度20行
;; that is a case that an user wants to complete without inserting any character or
;; a case not to start auto-complete-mode automatically by settings
;;好像是说在还没有调入任何字符的时候,或者默认没启动auto-complete-mode 时，使用这个快捷键进行补全
(setq ac-delay 0.2)
(define-key ac-mode-map (kbd "M-1") 'auto-complete)
(global-set-key (kbd "C-;") 'auto-complete)
(define-key ac-menu-map (kbd "C-;") 'ac-complete)
;;(define-key ac-mode-map (kbd "TAB") 'auto-complete)
(setq ac-use-quick-help nil) ;;不显示帮助信息,默认是启用的
;;; (setq ac-quick-help-delay 10)  ;;或者设置显示帮助的延迟
;;;列在这里，但不用它
(setq ac-auto-start t) ;; nil将不会进行自动补全，结合ac-set-trigger-key 使用
;;(ac-set-trigger-key "TAB")   ;;当ac-auto-start=nil 时哪个键触发补全
;;(setq ac-auto-start 3)  ;;设置当输入几个字符后开始进行补全
;;(setq ac-use-comphist nil);; 默认会根据用户输入频度调整候选词顺序，不想用可禁用之
(setq ac-comphist-file  (concat joseph_root_install_path "cache/ac-comphist.dat"))
(setq global-auto-complete-mode nil)
;;使用字典 ~/.dict
;;或者用这个命令,一个个加入1
;(setq ac-user-dictionary '("aaa" "bbb"))
 ;auto-complete-mode won't be enabled automatically for modes that are not in ac-modes. So you need to set if necessary:
;;将jde-mode 加入到ac-modes ,auto-complete 只对ac-modes 中的mode 开启，如果默认没加入进去，需手工加入
(add-to-list 'ac-modes 'jde-mode)
(add-to-list 'ac-modes 'java-mode)
(add-to-list 'ac-modes 'sh-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'text-mode)

;(setq ac-ignore-case 'smart);; 智能的处理大小写的匹配 ，当有大写字母的时候不忽略大小写，
(setq ac-ignore-case nil)
;;dwim  do what i mean
;; * After selecting candidates, TAB will behave as RET
;; * TAB will behave as RET only on candidate remains
;;当用C-n c-p 选中候选项时tab 表现为return 的行为，即令其上屏
;;(setq ac-dwim  t)
(eval-after-load 'java-mode
  '(progn
     (setq ac-auto-start 3)
     )
  )
;; (defun my_ac-java-mode-setup ()
;;        (setq ac-sources '( ac-source-filename
;;                            ac-source-files-in-current-dir
;;                            ac-source-yasnippet
;;                            ac-source-semantic
;;                            ac-source-semantic-raw
;;                            ac-source-gtags
;;                            ac-source-abbrev
;;                            ac-source-dictionary
;;                             )))
;; (add-hook 'java-mode-hook 'my_ac-java-mode-setup)

 (require 'auto-complete+)
;; add (ac+-apply-source-elisp-faces) to your emacs-lisp-mode-hook.
(setq ac+-filename-ignore-regexp "^#.*#$\\|.*~$\\|^\\./?$\\|^\\.\\./?$\\|^.svn\\|^CVS$\\|^.git$")
(add-hook 'emacs-lisp-mode-hook 'ac+-apply-source-elisp-faces)

;;auto-complete-1.3.1 好像有个bug ,比如当输入逗号时，如果逗号后面有内容，emacs会在那卡住，
;;cpu 使用率迅速增加
(defun insert-douhao()
  (interactive)
  (insert ",")
  )
(define-key emacs-lisp-mode-map "," 'insert-douhao)
(define-key lisp-interaction-mode-map "," 'insert-douhao)
  (defun insert-single-yinhao()
  (interactive)
  (insert "'"))
(define-key lisp-interaction-mode-map "'" 'insert-single-yinhao)
(define-key emacs-lisp-mode-map "'" 'insert-single-yinhao)
(defun insert-space()
  (interactive)
  (insert " "))
(define-key lisp-interaction-mode-map " " 'insert-space)
(define-key emacs-lisp-mode-map " " 'insert-space)

;;}}}
;;{{{ Auto Java Complete

;;my config file
;;(require 'ajc-java-complete-config)
(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;;}}}
;;{{{ 编写javadoc 的模式,
;;前缀是C-c C-d
;;快捷键只有在光标处天注释首行时有用
;; C-c C-d f 折叠注释 (doc-mode-toggle-tag-doc-folding)
;; C-c C-d C-f 折叠所有(doc-mode-fold-all)
;; C-c C-d u unfold
;;下面是关于doc-mode 快捷键的定义部分
;; (defvar doc-mode-prefix-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map "d" 'doc-mode-fix-tag-doc) ;;加入javadoc 注释
;;     (define-key map "t" 'doc-mode-toggle-tag-doc-folding)
;;     (define-key map "n" 'doc-mode-next-template);; 跳到下一个编辑位置
;;     (define-key map "c" 'doc-mode-check-tag-doc)
;;     (define-key map "f" 'doc-mode-fold-tag-doc)   ;;折叠
;;     (define-key map "u" 'doc-mode-unfold-tag-doc)
;;     (define-key map "r" 'doc-mode-remove-tag-doc)
;;     (define-key map "i" 'doc-mode-add-tag-doc)
;;     (define-key map "e" 'doc-mode-next-faulty-doc)
;;     (define-key map "\C-c" 'doc-mode-check-buffer)
;;     (define-key map "\C-f" 'doc-mode-fold-all)
;;     (define-key map "\C-u" 'doc-mode-unfold-all)
;;     map))
;; (defvar doc-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map "\C-c\C-d" doc-mode-prefix-map)
;;     map)
;;   "Keymap used for `doc-mode'.")
(require 'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)
;;}}}

;;{{{ hippie-expand 补全的设置 [(control return)] 代码补全
(global-set-key [(control return)] 'hippie-expand)
;(autoload 'senator-try-expand-semantic "senator")
(autoload 'try-joseph-dabbrev-substring "joseph-command" "让hippie-expand支持子串匹配" nil)
(setq-default hippie-expand-try-functions-list
     '(
;        senator-try-expand-semantic
        try-joseph-dabbrev-substring
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

;;}}}

;;{{{ java-mode相关的hook
(defun my-java-jde-mode-hook()
  (local-set-key ";"  'joseph-append-semicolon-at-eol) ;;行尾添加分号
 )
(add-hook 'java-mode-hook 'my-java-jde-mode-hook)
(add-hook 'java-mode-hook 'hs-minor-mode);; hide show mode 代码折叠
;;}}}
;;{{{ 粘贴的时候自动缩进

;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(emacs-lisp-mode lisp-mode
                            c-mode c++-mode js2-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode
                            scheme-mode clojure-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")

(defadvice yank (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

(defadvice yank-pop (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

;;}}}
(provide 'joseph_complete)

