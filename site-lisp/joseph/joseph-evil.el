;; https://github.com/mbriggs/.emacs.d/blob/master/my-keymaps.el
;; http://dnquark.com/blog/2012/02/emacs-evil-ecumenicalism/
;; https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-evil.el
;; https://github.com/syl20bnr/dotemacs/blob/master/init-package/init-evil.el
;;
(setq-default
 evil-toggle-key "<f17>"                ;用不到了 绑定到一个不常用的键
 evil-want-visual-char-semi-exclusive t ; 当v 选择到行尾时是否包含换行符
 evil-want-C-i-jump nil
 evil-cross-lines t
 evil-default-state 'normal
 evil-want-fine-undo t                  ;undo更细化,否则从N->I->N 中所有的修改作为一个undo
 evil-symbol-word-search t              ;# search for symbol not word
 evil-flash-delay 0.5                   ;default 2
 evil-ex-search-case 'sensitive
 ;; C-e ,到行尾时,光标的位置是在最后一个字符后,还是在字符上
 evil-move-cursor-back nil
 
 )

(setq-default
 evil-normal-state-tag (propertize "N" 'face '((:background "green" :foreground "black")))
 evil-emacs-state-tag (propertize "E" 'face '((:background "orange" :foreground "black")))
 evil-insert-state-tag (propertize "I" 'face '((:background "red")))
 evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
 evil-visual-state-tag (propertize "V" 'face '((:background "grey80" :foreground "cyan")))
 evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))

;; (setq evil-highlight-closing-paren-at-point-states nil)
(setq-default
 evil-default-cursor '(t "white")
 evil-emacs-state-cursor  '("gray" box)
 evil-normal-state-cursor '("green" box)
 evil-visual-state-cursor '("cyan" box)
 evil-insert-state-cursor '("orange" box)
 evil-motion-state-cursor '("gray" box))


(setq-default evil-overriding-maps
              '((Buffer-menu-mode-map . nil)
                (color-theme-mode-map . nil)
                (comint-mode-map . nil)
                (compilation-mode-map . nil)
                (grep-mode-map . nil)
                (dictionary-mode-map . nil)
                (ert-results-mode-map . motion)
                (Info-mode-map . motion)
                (speedbar-key-map . nil)
                (speedbar-file-key-map . nil)
                (speedbar-buffers-key-map . nil)
                ;; 以下我添加
                (vc-git-log-view-mode-map . nil)
                (vc-svn-log-view-mode-map . nil)
                (magit-mode-map . nil)
                (magit-status-mode-map . nil)
                (magit-svn-status-mode-map . nil)
                (magit-svn-mode-map . nil)
                (magit-reflog-mode-map . nil)
                (org-agenda-mode-map . nil)
                (evil-leader--default-map . nil)
                ))
;; evil-intercept-maps
(setq-default evil-intercept-maps
              '((edebug-mode-map . nil)
                (magit-mode-map . nil)
                )) 
(setq-default evil-normal-state-modes
              '(                        ;全是我添加
                magit-mode
                magit-diff-mode
                magit-status-mode
                magit-log-mode
                magit-reflog-mode
                ibuffer-mode
                vc-dir-mode
                vc-git-log-view-mode
                vc-svn-log-view-mode
                erlang-shell-mode
                org-agenda-mode
                magit-process-mode
                minibuffer-inactive-mode))
(setq-default evil-motion-state-modes
              '(Custom-mode
                ;; 以上是我加，以下是默认
                apropos-mode
                Buffer-menu-mode
                calendar-mode
                color-theme-mode
                command-history-mode
                compilation-mode
                dictionary-mode
                ert-results-mode
                help-mode
                Info-mode
                Man-mode
                speedbar-mode
                undo-tree-visualizer-mode
                view-mode
                woman-mode)
              )
(setq-default evil-insert-state-modes
              '(bm-show-mode
                magit-log-select-mode
                diff-mode
                git-rebase-mode
                magit-popup-mode
                magit-popup-sequence-mode
                ;; 以上是我加的，以下是默认evil-vars 里定义的
                comint-mode
                erc-mode
                eshell-mode
                geiser-repl-mode
                gud-mode
                inferior-apl-mode
                inferior-caml-mode
                inferior-emacs-lisp-mode
                inferior-j-mode
                inferior-python-mode
                inferior-scheme-mode
                inferior-sml-mode
                internal-ange-ftp-mode
                prolog-inferior-mode
                reb-mode
                shell-mode
                slime-repl-mode
                term-mode
                wdired-mode))
(setq-default evil-buffer-regexps
              '(("**testing snippet:" . insert)
                ("*Org Src" . insert)
                ("*Org Export Dispatcher*" . insert)
                ("*Async Shell Command*" . normal)
                ("^ \\*load\\*")))

(require 'evil)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-mode 1)

;; 把所有emacs state  的mode 都转成insert mode
(dolist (mode evil-emacs-state-modes)
  (cond
   ((memq mode evil-normal-state-modes)
    (evil-set-initial-state mode 'normal))
   ((memq mode evil-motion-state-modes)
     (evil-set-initial-state mode 'motion))
   (t
    (evil-set-initial-state mode 'insert))))

(setq evil-emacs-state-modes nil)

;; (dolist (mode evil-motion-state-modes)
;;   (evil-set-initial-state mode 'normal))
;; (setq evil-motion-state-modes nil)

;; (add-hook 'after-save-hook 'evil-change-to-initial-state)

(evil-declare-motion 'gold-ratio-scroll-screen-down)
(evil-declare-motion 'gold-ratio-scroll-screen-up)

;; ;; 同一buffer 内的jump backward
;; (defadvice ace-jump-word-mode (before evil-jump activate)
;;   (push (point) evil-jump-list))
;; (defadvice ace-jump-char-mode (before evil-jump activate)
;;   (push (point) evil-jump-list))
;; (defadvice ace-jump-line-mode (before evil-jump activate)
;;   (push (point) evil-jump-list))

;; (defadvice eval-print-last-sexp (around evil activate)
;;   (if (evil-normal-state-p)
;;       (progn
;;         (unless (or (eobp) (eolp)) (forward-char))
;;         ad-do-it)
;;     ad-do-it))

;; (defadvice eval-last-sexp (around evil activate)
;;   (if (evil-normal-state-p)
;;       (progn
;;         (unless (or (eobp) (eolp)) (forward-char))
;;         ad-do-it)
;;     ad-do-it))


;; (define-key evil-normal-state-map ";" 'evil-repeat-find-char-or-ace-jump)

;; emacs 自带的repeat 绑定在C-xz上， 这个advice ,奖 repeat 的功能 与evil 里的","功能合
;; 2为1,一起绑定在","紧临evil-repeat"." 如此一来， 跟编辑相关的repeat用"." ,跟光标移动相关的
;; 可以用","
;; (defadvice repeat(around evil-repeat-find-char-reverse activate)
;;   "if last-command is `evil-find-char' or
;; `evil-repeat-find-char-reverse' or `evil-repeat-find-char'
;; call `evil-repeat-find-char-reverse' if not
;; execute emacs native `repeat' default binding to`C-xz'"
;;   (if (member last-command '(evil-find-char
;;                              evil-repeat-find-char-reverse
;;                              repeat
;;                              evil-find-char-backward
;;                              evil-repeat-find-char))
;;       (progn
;;         ;; ;I do not know why need this(in this advice)
;;         (when (evil-visual-state-p)(unless (bobp) (forward-char -1)))
;;         (call-interactively 'evil-repeat-find-char-reverse)
;;         (setq this-command 'evil-repeat-find-char-reverse))
;;     ad-do-it))

(defadvice keyboard-quit (before evil-insert-to-nornal-state activate)
  "C-g back to normal state"
  (when  (evil-insert-state-p)
    (cond
     ((equal (evil-initial-state major-mode) 'normal)
      (evil-normal-state))
     ((equal (evil-initial-state major-mode) 'insert)
      (evil-normal-state))
     ((equal (evil-initial-state major-mode) 'motion)
      (evil-motion-state))
     (t
      (if (equal last-command 'keyboard-quit)
          (evil-normal-state)           ;如果初始化state不是normal ，按两次才允许转到normal state
        (evil-change-to-initial-state)) ;如果初始化state不是normal ，按一次 转到初始状态
      ))))

;; (defadvice joseph-comment-dwim-line(around evil activate)
;;   "In normal-state, eol check"
;;   (when (and (evil-normal-state-p)
;;              evil-move-cursor-back)
;;     (unless (or (eobp) (eolp)) (forward-char))) ;
;;   ad-do-it)

;; ;; 下面的部分 insert mode 就是正常的emacs
;; ;; Insert state clobbers some useful Emacs keybindings
;; ;; The solution to this is to clear the insert state keymap, leaving you with
;; ;; unadulterated Emacs behavior. You might still want to poke around the keymap
;; ;; (defined in evil-maps.el) and see if you want to salvage some useful insert
;; ;; state command by rebinding them to keys of your liking. Also, you need to
;; ;; bind ESC to putting you back in normal mode. So, try using this code.
;; ;; With it, I have no practical need to ever switch to Emacs state.
;; ;; 清空所有insert-state的绑定,这样 ,insert mode 就是没装evil 前的正常emacs了
;; ;; evil-emacs-state is annoying, the following function and hook automatically
;; ;; switch to evil-insert-state whenever the evil-emacs-state is entered.
;; ;; It allows a more consistent navigation experience among all mode maps.
;; (defun evil-emacs-state-2-evil-insert-state ()
;;   (if (equal (evil-initial-state major-mode) 'normal)
;;       (evil-normal-state)
;;     (evil-insert-state))
;;   (remove-hook 'post-command-hook 'evil-emacs-state-2-evil-insert-state))
;; (add-hook 'evil-emacs-state-entry-hook
;;           (lambda ()
;;             (add-hook 'post-command-hook 'evil-emacs-state-2-evil-insert-state)))

;; ;; same thing for motion state but switch in normal mode instead
;; ;; 这一部分暂时注掉,以观后效
;; (defun evil-motion-state-2-evil-normal-state ()
;;   (if (equal (evil-initial-state major-mode) 'insert)
;;       (evil-insert-state)
;;     (evil-normal-state))
;;   (remove-hook 'post-command-hook 'evil-motion-state-2-evil-normal-state))
;; (add-hook 'evil-motion-state-entry-hook
;;   (lambda ()
;;     (add-hook 'post-command-hook 'evil-motion-state-2-evil-normal-state)))


;; (with-eval-after-load 'log-view
;;   (evil-make-overriding-map log-view-mode-map 'normal t)
;;      (evil-define-key 'normal log-view-mode-map
;;        (kbd "SPC") evil-leader--default-map))

;; 默认dird 的r 修改了, 不是 wdired-change-to-wdired-mode,现在改回
(with-eval-after-load 'dired
  (evil-define-key 'normal dired-mode-map
    "r" 'revert-buffer                ; "l"
    "gg" 'dired-beginning-of-buffer
    "G" 'dired-end-of-buffer))

(with-eval-after-load 'diff-mode
  (evil-add-hjkl-bindings diff-mode-map 'insert
    (kbd "SPC") evil-leader--default-map))


;; (eval-after-load 'comint
;;   '(progn
;;      ;; use the standard Dired bindings as a base
;;      (evil-set-initial-state 'comint-mode 'normal)
;;      (defvar comint-mode-map)
;;      (evil-make-overriding-map comint-mode-map 'normal t)
;;      (evil-define-key 'normal comint-mode-map
;;        (kbd "SPC") evil-leader--default-map)))


(with-eval-after-load 'org-agenda
  (evil-define-key 'normal org-agenda-mode-map
    "j" 'evil-next-line
    "k" 'evil-previous-line
    ":" 'evil-ex
    "r" 'org-agenda-redo))



;; 交换y p 的功能
;; (define-key evil-normal-state-map "y" 'evil-paste-after)
;; (define-key evil-normal-state-map "Y" 'evil-paste-before)
;; (define-key evil-normal-state-map "p" 'evil-yank)
;; (define-key evil-normal-state-map "P" 'evil-yank-line)
;; (define-key evil-normal-state-map "w" 'evil-window-map)
;; (define-key evil-normal-state-map (kbd "C-y") 'yank)

;; esc
(setcdr evil-insert-state-map nil)
(setq evil-window-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key-lazy isearch-mode-map [escape] 'isearch-abort 'isearch)

;; (define-key evil-window-map "1" 'delete-other-windows)
;; (define-key evil-window-map "0" 'delete-window)
;; (define-key evil-window-map "2" 'split-window-func-with-other-buffer-vertically)
;; (define-key evil-window-map "3" 'split-window-func-with-other-buffer-horizontally)

;; (define-key evil-normal-state-map (kbd "f") 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "C-z") nil)
(define-key evil-normal-state-map (kbd "C-w") 'ctl-w-map)
(define-key evil-normal-state-map "\C-n" nil)
(define-key evil-normal-state-map "\C-p" nil)
(define-key evil-normal-state-map "\C-v" nil)
(define-key evil-motion-state-map "\C-v" nil)
(define-key evil-normal-state-map "\C-e" nil)
(define-key evil-motion-state-map (kbd "C-w") nil)
(define-key evil-motion-state-map (kbd "C-i") nil)
(define-key evil-motion-state-map (kbd "C-b") nil)
(define-key evil-motion-state-map (kbd "C-d") nil)
(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-motion-state-map (kbd "C-f") nil)
(define-key evil-motion-state-map (kbd "C-y") nil)
(define-key evil-normal-state-map [remap yank-pop] nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
;; (define-key evil-normal-state-map "q" nil)
(define-key evil-normal-state-map (kbd "DEL") nil) ;backupspace
(define-key evil-motion-state-map  (kbd "RET") nil) ;
(define-key evil-normal-state-map  (kbd "RET") nil) ;
;; (define-key evil-motion-state-map "n" nil)
;; (define-key evil-motion-state-map "N" nil)
(define-key evil-normal-state-map "\C-r" nil)
(define-key evil-normal-state-map  (kbd "C-.") nil)
(define-key evil-normal-state-map  (kbd "M-.") nil)
;; (define-key evil-normal-state-map "o" nil)
;; (define-key evil-normal-state-map "\M-o" 'evil-open-below)
;; (define-key evil-normal-state-map "O" nil)
(define-key evil-motion-state-map (kbd "C-o") nil)

;; (define-key evil-normal-state-map "m" nil) ;evil-set-marker
(define-key evil-motion-state-map "`" nil) ;'evil-goto-mark
(define-key evil-motion-state-map "gd" 'goto-definition)
(define-key evil-normal-state-map "q" 'bury-buffer-and-window)
(define-key evil-normal-state-map "Q" 'kill-buffer-and-window)
(define-key evil-motion-state-map "L" 'joseph-forward-4-line)
(define-key evil-motion-state-map "H" 'joseph-backward-4-line)
;; (define-key evil-normal-state-map "s" 'joseph-forward-symbol-or-isearch-regexp-forward)
;; (define-key evil-normal-state-map "S" 'joseph-backward-symbol-or-isearch-regexp-backward)
(define-key evil-normal-state-map "m" nil)
(define-key evil-normal-state-map "mm" 'bm-toggle) ;evil-set-marker
(define-key evil-normal-state-map "mv" 'evil-visual-block) ;=vim.C-v
;; g; goto-last-change
;; g,  goto-last-change-reverse
;; (define-key evil-normal-state-map "g/" 'goto-last-change-reverse); goto-last-change

(define-key evil-normal-state-map "gf" 'evil-jump-forward)
(define-key evil-normal-state-map "gb" 'evil-jump-backward)
(define-key evil-normal-state-map "ga" (kbd "M-a"))
(define-key evil-normal-state-map "ge" (kbd "M-e"))
;; (define-key evil-normal-state-map "gA" (kbd "C-M-a"))
;; (define-key evil-normal-state-map "gE" (kbd "C-M-e"))
(define-key evil-motion-state-map "e" nil)
(define-key evil-motion-state-map "E" nil)
(define-key evil-normal-state-map "r" nil)
(define-key evil-normal-state-map "R" nil)
(define-key evil-normal-state-map "s" nil)
(define-key evil-normal-state-map "sa" 'evil-begin-of-defun)

(define-key evil-normal-state-map "ss" 'evil-end-of-defun)
;; (define-key evil-normal-state-map "eh" (kbd "C-M-h"))
(define-key evil-normal-state-map "sf" 'evil-C-M-f)
(define-key evil-normal-state-map "sb" 'evil-C-M-b)

(define-key evil-normal-state-map "sy" 'evil-copy-sexp-at-point) ;kill-sexp,undo
(define-key evil-normal-state-map "sK" 'evil-copy-sexp-at-point)
(define-key evil-normal-state-map "sk" (kbd "C-k"))
(define-key evil-normal-state-map "su" (kbd "C-8 0 C-k")) ;H-i =C-u 删除从光标位置到行首的内容

(define-key evil-normal-state-map "mf" 'evil-mark-defun) ;mark-defun
(define-key evil-normal-state-map "mh" 'evil-M-h)
(define-key evil-normal-state-map "mxh" 'evil-mark-whole-buffer)
(define-key evil-normal-state-map "mb" 'evil-mark-whole-buffer)
(define-key evil-normal-state-map "mo" 'er/expand-region);
(define-key evil-visual-state-map "mo" 'er/expand-region);
(define-key evil-normal-state-map "mO" 'er/contract-region);

(define-key evil-normal-state-map (kbd "C-j") 'open-line-or-new-line-dep-pos)
;; (define-key evil-normal-state-map (kbd ".") 'repeat)
;; (define-key evil-normal-state-map (d "zx") 'repeat) ;
;; (define-key evil-normal-state-map "," 'repeat)
;; (define-key evil-visual-state-map "," 'repeat)
;; (define-key evil-motion-state-map "," 'repeat) ;
(define-key evil-visual-state-map "x" 'exchange-point-and-mark)

;; (global-set-key (kbd "M-SPC") 'rm-set-mark);;alt+space 开始矩形操作，然后移动位置，就可得到选区
(define-key evil-motion-state-map (kbd "M-SPC")  'evil-visual-block)
(define-key evil-motion-state-map (kbd "C-3")  'evil-visual-block)
(define-key evil-motion-state-map "K" 'kill-buffer-or-server-edit)
(define-key evil-ex-completion-map (kbd "H-m") 'exit-minibuffer)
(define-key global-map (kbd   "M-:") 'evil-ex)

(evil-ex-define-cmd "s[ave]" 'evil-write)

(evil-leader/set-key "?" 'helm-descbinds)
(evil-leader/set-key "f" 'helm-for-files)
(evil-leader/set-key "F" 'helm-find-files)
(evil-leader/set-key "wf" 'helm-find-files)
(evil-leader/set-key "wb" 'helm-resume)

(evil-leader/set-key "o" 'other-window)
(evil-leader/set-key "g" 'helm-do-grep)
(evil-leader/set-key "vj" 'magit-status)
(evil-leader/set-key "vv" 'vc-next-action)
(evil-leader/set-key "vu" 'vc-revert)
(evil-leader/set-key "vl" 'vc-print-log)
(evil-leader/set-key "vL" 'vc-print-root-log)
(evil-leader/set-key "vg" 'vc-annotate)
(evil-leader/set-key "vd" 'vc-dir)
(evil-leader/set-key "v=" 'vc-diff)
(evil-leader/set-key "=" 'vc-diff)
(evil-leader/set-key "+" 'vc-ediff)
(evil-leader/set-key "2" 'split-window-func-with-other-buffer-vertically)
(evil-leader/set-key "3" 'split-window-func-with-other-buffer-horizontally)
(evil-leader/set-key "1" 'delete-other-windows)
(evil-leader/set-key "0" 'delete-window)
;; (evil-leader/set-key "dj" 'dired-jump)
(evil-leader/set-key "j" 'dired-jump)
;; (evil-leader/set-key "b" 'ido-switch-buffer)
;; (evil-leader/set-key "c" 'ido-switch-buffer)
(evil-leader/set-key "SPC" 'ido-switch-buffer)
(evil-leader/set-key "a" 'smart-beginning-of-line)
(evil-leader/set-key "e" 'smart-end-of-line)
(evil-leader/set-key "d" 'evil-next-buffer) ;K prev-buffer
(evil-leader/set-key "k" 'evil-prev-buffer) ;
(evil-leader/set-key "xk" 'kill-buffer-or-server-edit)

(evil-leader/set-key "wk" 'bury-buffer)
(evil-leader/set-key "q" 'delete-frame)
(evil-leader/set-key ";" 'helm-M-x)
(evil-leader/set-key "l" 'ibuffer)
(evil-leader/set-key (kbd "C-g") 'keyboard-quit)
(evil-leader/set-key "zs" 'compile-dwim-compile)
(evil-leader/set-key "zr" 'compile-dwim-run)
(evil-leader/set-key "z$" 'toggle-truncate-lines)
(evil-leader/set-key "zd" 'sdcv-to-buffer)
(evil-leader/set-key "s" 'save-buffer)
(evil-leader/set-key "S" 'save-some-buffers)
;; (evil-leader/set-key "j" 'open-line-or-new-line-dep-pos)
(evil-leader/set-key "rt" 'string-rectangle)
(evil-leader/set-key "rk" 'kill-rectangle)
(evil-leader/set-key "ry" 'yank-rectangle)
(evil-leader/set-key "h" 'evil-mark-whole-buffer)
(evil-leader/set-key "nw" 'widen)
(evil-leader/set-key "nn" 'narrow-to-region)
(evil-leader/set-key "xu" 'undo-tree-visualize)
(evil-leader/set-key "<RET>r" 'revert-buffer-with-coding-system) ;C-x<RET>r
(evil-leader/set-key "(" 'kmacro-start-macro) ;C-x(
(evil-leader/set-key ")" 'kmacro-end-macro) ;C-x
(evil-leader/set-key "ck" 'compile-dwim-compile)
(evil-leader/set-key "ca" 'org-agenda)
(evil-leader/set-key "," 'bm-previous)
(evil-leader/set-key "." 'bm-next)
(evil-leader/set-key "u" 'universal-argument)


;; bug of osx interprogram-paste-function  interprogram-cut-function 与系统co
(define-key evil-normal-state-map (kbd "p") 'my-evil-paste-after)

;; (define-key evil-outer-text-objects-map "o" nil)
;; (define-key evil-inner-text-objects-map "o" nil)
(require 'joseph-evil-symbol)




(provide 'joseph-evil)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp.el ends here
