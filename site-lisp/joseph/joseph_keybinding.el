
;;; -*- coding:utf-8 -*-
;;一些快捷键的设置
;;; byte-compile

  (eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
    (require 'joseph-util)
  )

;;; 关于键绑定的一些知识

;;关于键绑定的一些设置
;; change a binding in the global keymap, the change is effective in all
;; buffers (though it has no direct effect in buffers that shadow the
;; global binding with a local one).  If you change the current buffer's
;; local map, that usually affects all buffers using the same major mode.
;; The `global-set-key' and `local-set-key' functions are convenient
;; interfaces for these operations .
;;也就是说global-set-key 对所有的buffer 有效,
;;而local-set-key 只影响某一种major-mode,
;;当同时设置了local-set-key global-set-key ,造成键冲突时,前者的优先级高.后者会被屏避掉.

;;(global-set-key key binding) 等价于 (define-key (current-global-map) key binding)
;;取消键绑定 (global-unset-key key) 等价于 (define-key (current-global-map) key nil)
;;(local-set-key key binding) == (define-key (current-local-map) key binding)
;;(local-unset-key key) == (define-key (current-local-map) key nil)
;;     (global-set-key (kbd "C-x C-\\") 'next-line)
;;     (global-set-key [?\C-x ?\C-\\] 'next-line)
;;     (global-set-key [(control ?x) (control ?\\)] 'next-line)
;;
;;关于前缀的一点介绍
;;比如默认情况下C-z 被绑定到最小化窗口,这个时候我们是没法绑定像"C-z C-f"
;;这样的以C-z 为前缀的快捷键的,如果想要这么做,必须定义一个 前缀,
;;然后把C-z 绑定到这个前缀上.
;;比如
;;(define-prefix-command 'ctl-z-map)
;;(global-set-key (kbd "C-z") 'ctl-z-map)
;;ctrl-z-map 的名字你可以随便取,比如
;;(define-prefix-command 'aaaaaaaaaa)
;;(global-set-key (kbd "C-z") 'aaaaaaaaaa)
;;效果也是相同的
;;这样定义的C-z 的前缀后就可以将键绑定到C-z 开头的的快捷键上了.
;;绑定的方式有两种
;;1, (global-set-key (kbd "C-z C-f") 'find-file)
;;2,或者明确指定使用ctl-z-map 前缀
;; (define-key ctl-z-map (kbd "C-f") 'find-file)


(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-G") 'Meta-G-Map)

(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'hyper)
(global-set-key (kbd "H-<Esc>") 'save-buffers-kill-emacs)
(global-set-key (quote [M-f4]) (quote save-buffers-kill-emacs))

;; 默认Emacs 把TAB==`C-i'
;;            RET==`C-m'
;;            ESC==`C-['
;;这样可以进行绑定的键好像少了一些,
;;下面的方法可以实现将`C-i' `C-m'绑定与`TAB' `RET'不同的func
;;不过只在Gui下有用
;;(when (or window-system (daemonp))
  ;; (keyboard-translate ?\C-i ?\H-i)
  ;; (keyboard-translate ?\C-m ?\H-m)
  ;; (global-set-key [?\H-m] 'backward-char);C-m
;;  (global-set-key [?\H-i] 'delete-backward-char) ;C-i
;;  )
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "M-[") 'move-backward-paren)
(global-set-key (kbd "M-]") 'move-forward-paren)
;;(global-set-key (kbd "C-f") 'joseph-go-to-char)
(global-set-key "%" 'goto-match-paren)


;;when meet long line ,whether to wrap it
(setq-default truncate-lines t)
(global-set-key "\C-z$" 'toggle-truncate-lines)

(global-set-key (kbd "C-z C-z") 'execute-extended-command)
(global-set-key (kbd "C-x C-z") 'execute-extended-command)
;;一键显隐菜单栏
(global-set-key "\C-zm" (lambda () (interactive) (menu-bar-mode) (tool-bar-mode)))


(global-set-key "\C-j" 'open-line-or-new-line-dep-pos)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)
(global-set-key (kbd "C-e") 'smart-end-of-line)
;;(global-set-key (kbd "C-a" ) (quote  quoted-insert))
(global-set-key (kbd "C-c C-j") 'joseph-join-lines)
(global-set-key (kbd "C-c j") 'joseph-join-lines)

;;; 渐近搜索
;;进入搜索模式之后，几个好用的按键
;;`C-w' 把光标下的word作为搜索关键字，可多次按下`C-w'
;;`M-y' 将`king-ring'中的内容取出作为搜索关键字
;;`M-e'光标跳到minibuffer，编辑关键字
;;`M-%' 改为用query-replace替换
;;`C-M-%' 改为用query-regex-replace替换
;;`M-r' 在正则与非正则之切换
;;`M-c' 是否忽略大小写


;;Emacs下c-s对应渐进搜索。不过我们更多的时候需要搜索某种模式，所以用得最多的
;;还是渐进式的正则表达式搜索。正则表达式搜索有个烦人的问题：搜索结束时光标不
;;一定停留在匹配字串的开端。幸好这个问题容易解决：头两行重新绑定标准搜索键
;;c-s和c-r，把isearch换成regex-isearch。后面三行加入定制函数。关键的语句是
;;(goto-char isearch-other-end)，保证光标停留在匹配字串的开头，而不是缺省的末
;;尾。
;;(global-unset-key [(control r)] )
(global-set-key [(control s)] 'isearch-forward-regexp)
;(global-set-key [(control r)] 'isearch-forward-regexp)
;; Always end searches at the beginning of the matching expression.
;; (global-set-key "\C-r" 'backward-delete-cdsfhar-untabify) ;;向前删除一个字符
;; (global-set-key "\M-r" 'backward-kill-word) ;;向前删除一个单词
;;; others
(global-set-key ( kbd "C-x C-c") 'ibuffer)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; 原来 的C-x C-c

(global-set-key "\C-x\C-r" 'wl-sudo-find-file)
(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)

(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") 'set-mark-command)
(global-set-key  (kbd "C-2") 'set-mark-command)
(global-set-key (quote [C-tab]) 'set-mark-command)

(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,一次前进后退5行
(add-hook 'Info-mode-hook '(lambda () "define M-n for Info" (define-key Info-mode-map "\M-n" 'joseph-forward-4-line)))
(global-set-key "\M-n"  'joseph-forward-4-line)
(global-set-key "\M-p"  'joseph-backward-4-line)

(define-key-lazy dired-mode-map "\M-\C-n" 'scroll-other-window-up-or-previous-buffer)
(define-key-lazy global-map "\M-\C-n" 'scroll-other-window-up-or-previous-buffer)
(define-key-lazy global-map "\M-\C-p" 'scroll-other-window-down-or-next-buffer)
(define-key-lazy  dired-mode-map "\M-\C-p" 'scroll-other-window-down-or-next-buffer)


(define-key global-map (kbd "C-x M-n") 'next-buffer)
(define-key global-map (kbd "C-x M-p") 'previous-buffer)

(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
;; (define-key emacs-lisp-mode-map (kbd "C-;") 'eval-print-last-sexp)
;; (define-key lisp-interaction-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;只留光标处一个空格或者删除所有空格
(global-set-key "\M-\\" 'just-one-space-or-delete-horizontal-space)
;;词典,需要sdcd的支持
(global-set-key "\C-c\C-d" 'query-stardict)
(global-set-key "\C-cd" 'sdcv-to-buffer)
(global-set-key "\C-k" 'joseph-kill-region-or-line)
(global-set-key (kbd "C-x k") 'kill-buffer-or-server-edit)
(global-set-key (kbd "C-x C-k") 'kill-buffer-or-server-edit)

(global-set-key "\C-x\C-f" 'icicle-file)

(autoload 'joseph-trailing-whitespace-hook "joseph-command" " 自动清除每一行末多余的空格." )
(autoload 'joseph-untabify-hook "joseph-command" " 在保存之前用空格替换掉所有的TAB")
(add-hook 'before-save-hook 'joseph-trailing-whitespace-hook)
(add-hook 'before-save-hook 'joseph-untabify-hook)
(global-set-key [(meta g) (meta g)] 'goto-line)

(global-set-key "\M-gf"      'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta f)] 'joseph-goto-line-by-percent)

(global-set-key "\M-;" 'joseph-comment-dwim-line)
;;; (require 'find-func)
(define-key help-map "\C-f" 'find-function-other-window)
(define-key help-map "\C-v" 'find-variable-other-window)
(define-key help-map "v" 'describe-variable)

(define-key 'ctl-w-map (kbd "C-d") 'date)
(global-set-key "\C-o" 'joseph-jump-to-space-forward)

;;; key chord 两个连接按键
(require 'key-chord)
(setq key-chord-two-keys-delay 0.1)
(key-chord-mode 1)
(key-chord-define-global "jj"     'joseph-join-lines)
(key-chord-define-global ",."     "<>\C-b")
(key-chord-define-global ",,"     "<")
(key-chord-define-global ".."     ">")
(key-chord-define-global "90"     "()\C-b")

;这几个键绑定纯属悲剧，可乐惹的祸
(key-chord-define-global "00"     "-")
(key-chord-define-global "99"     "_")

(global-set-key  (kbd  "C-9")     "=")
(global-set-key  (kbd "C-0")     "+")

(key-chord-define-global ";;"     "\"")
(key-chord-define-global "ll"     "'")

(key-chord-define-global "11"     "`")
(key-chord-define-global "22"     "~")

;;; M-Backspace M-d
(global-set-key [(meta backspace)] 'kill-syntax-backward)
(global-set-key [(meta d)] 'kill-syntax-forward)

(autoload 'anything-replace-string "anything-replace-string" "replace-string query-replace" t)
(define-key-lazy ctl-w-map "\C-r" 'anything-replace-string)
(define-key-lazy emacs-lisp-mode-map (kbd "C-M-m") 'eval-print-last-sexp 'lisp-mode)

;;; goto-last change
;;快速跳转到当前buffer最后一次修改的位置 利用了undo定位最后一次在何处做了修改
;; (autoload 'goto-last-change "goto-last-change" "Set point to the position of the last change." t)
(global-set-key (kbd "C-x C-/") 'goto-last-change)
;;; compile dwim
(global-set-key "\C-zs" 'compile-dwim-compile)
(global-set-key "\C-zr" 'compile-dwim-run)

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
