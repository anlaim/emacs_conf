;;; -*- coding:utf-8 -*-
;;一些快捷键的设置
;;; byte-compile

  (eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
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

;;; bindings
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
(add-hook 'after-make-frame-functions 'make-frame-func-t t)
(defun make-frame-func-t( &optional frame)
  (with-selected-frame (or frame (selected-frame))
    (keyboard-translate ?\C-i ?\H-i)
    (keyboard-translate ?\C-m ?\H-m)
    (global-set-key [?\H-m] 'backward-char);C-m
    (global-set-key [?\H-i] 'delete-backward-char) ;C-i
    ))
(make-frame-func-t)

(global-set-key "\r" 'newline-and-indent);;return

;; C-h M-h backward delete
(global-set-key (kbd "C-?") 'help-command) ;;用C-? 取代C-h
(global-set-key (kbd "M-?") 'mark-paragraph)

(global-set-key (kbd "C-h") 'backward-kill-word)
;; (global-set-key (kbd "M-h") 'backward-kill-word)

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
(global-set-key "\C-zm" 'toggle-menu-bar-tool-bar)


(global-set-key "\C-j" 'open-line-or-new-line-dep-pos)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)
(global-set-key (quote [home]) 'smart-beginning-of-line)

(global-set-key (kbd "C-e") 'smart-end-of-line)
;;(global-set-key (kbd "C-a" ) (quote  quoted-insert))
(global-set-key (kbd "C-c C-j") 'joseph-join-lines)
(global-set-key (kbd "C-c j") 'joseph-join-lines)

;;; others
(global-set-key ( kbd "C-x C-c") 'ibuffer)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; 原来 的C-x C-c

(global-set-key "\C-x\C-r" 'wl-sudo-find-file)
(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)

(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") 'set-mark-command);shift+space
(global-set-key  (kbd "C-2") 'set-mark-command)
(global-set-key  (kbd "C-3") 'set-mark-command)

(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,一次前进后退5行
(define-key-lazy Info-mode-map "\M-n" 'joseph-forward-4-line "info")
(global-set-key "\M-n"  'joseph-forward-4-line)
(global-set-key "\M-p"  'joseph-backward-4-line)
(define-key-lazy woman-mode-map "\M-n" 'joseph-forward-4-line)
(define-key-lazy woman-mode-map "\M-p" 'joseph-backward-4-line)


(define-key-lazy global-map "\M-\C-n" 'scroll-other-window-up-or-previous-buffer)
(define-key-lazy global-map "\M-\C-p" 'scroll-other-window-down-or-next-buffer)
(define-key-lazy dired-mode-map "\M-\C-n" 'scroll-other-window-up-or-previous-buffer)
(define-key-lazy dired-mode-map "\M-\C-p" 'scroll-other-window-down-or-next-buffer)


(define-key global-map (kbd "C-x M-n") 'next-buffer)
(define-key global-map (kbd "C-x M-p") 'previous-buffer)

(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;只留光标处一个空格或者删除所有空格(按一次与按两次效果不同)
(global-set-key "\M-\\" 'just-one-space-or-delete-horizontal-space)
;;词典,需要sdcd的支持
(global-set-key "\C-z\C-d" 'query-stardict)
(global-set-key "\C-cd" 'sdcv-to-buffer)
(global-set-key "\C-k" 'joseph-kill-region-or-line)
(global-set-key (kbd "C-x k") 'kill-buffer-or-server-edit)
(global-set-key (kbd "C-x C-k") 'kill-buffer-or-server-edit)

;; (add-hook 'before-save-hook 'joseph-trailing-whitespace-hook);自动清除每一行末多余的空格.
;; (add-hook 'before-save-hook 'joseph-untabify-hook);在保存之前用空格替换掉所有的TAB
(global-set-key [(meta g) (meta g)] 'goto-line)

(global-set-key "\M-gf" 'joseph-goto-line-by-percent)
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
;; (key-chord-define-global "jj"     'joseph-join-lines)
(key-chord-define-global ",."     "<>\C-b")
(key-chord-define-global ",,"     "<")
;; (key-chord-define-global ".."     ">")
(key-chord-define-global "90"     "()\C-b")

;;; M-Backspace M-d
(global-set-key [(meta backspace)] 'kill-syntax-backward)
(global-set-key [(meta d)] 'kill-syntax-forward)

(define-key-lazy ctl-w-map "\C-r" 'helm-replace-string)
(define-key-lazy emacs-lisp-mode-map (kbd "C-x C-e") 'eval-print-last-sexp 'lisp-mode)
(define-key-lazy lisp-interaction-mode-map (kbd "C-x C-e") 'eval-print-last-sexp 'lisp-mode)

;;; goto-last change
;;快速跳转到当前buffer最后一次修改的位置 利用了undo定位最后一次在何处做了修改
;; (autoload 'goto-last-change "goto-last-change" "Set point to the position of the last change." t)
(global-set-key (kbd "C-x C-/") 'goto-last-change)
;;; compile dwim
(global-set-key "\C-zs" 'compile-dwim-compile)
(global-set-key "\C-z\C-s" 'compile-dwim-compile)
(global-set-key "\C-zr" 'compile-dwim-run)
(global-set-key "\C-z\C-r" 'compile-dwim-run)
;;; dired jump
(autoload 'dired-jump "dired-x" "dired jump" t)
(global-set-key (kbd "C-x C-j") 'dired-jump)
(global-set-key (kbd "C-w C-j") 'dired-jump)

(when (equal system-type 'windows-nt)
  (global-set-key [f2] 'toggle-bash)
  (global-set-key [C-f2] 'toggle-bash-cd))
(when (equal system-type 'gnu/linux)
  (global-set-key [f2] 'toggle-zsh)
  (global-set-key [C-f2] 'toggle-zsh-cd))

(eval-after-load 'helm-config '(global-set-key [f5] '(lambda() (interactive) (revert-buffer t t))))

(define-key-lazy view-mode-map (kbd "h") 'backward-char "view")
(define-key-lazy view-mode-map (kbd "j") 'next-line "view")
(define-key-lazy view-mode-map (kbd "k") 'previous-line "view")
(define-key-lazy view-mode-map (kbd "l") 'forward-char "view")

(define-key-lazy help-mode-map (kbd "h") 'backward-char "help-mode")
(define-key-lazy help-mode-map (kbd "j") 'next-line "help-mode")
(define-key-lazy help-mode-map (kbd "k") 'previous-line "help-mode")
(define-key-lazy help-mode-map (kbd "n") 'next-line "help-mode")
(define-key-lazy help-mode-map (kbd "p") 'previous-line "help-mode")
(define-key-lazy help-mode-map (kbd "l") 'forward-char "help-mode")

(global-set-key "\C-v" 'joseph-scroll-half-screen-down)
(global-set-key "\M-v" 'joseph-scroll-half-screen-up)

(global-set-key ":" (quote shell-command)) ;`Esc:' 扫行shell命令

(global-set-key [pause] 'minibuffer-refocus)
(global-set-key (kbd "C-M-g") 'minibuffer-quit)

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
