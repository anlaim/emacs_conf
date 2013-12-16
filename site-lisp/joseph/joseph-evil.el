(eval-when-compile (require 'helm))
(eval-when-compile (require 'dired))
(eval-when-compile (require 'evil))
(eval-when-compile (require 'evil-leader))

;; https://github.com/mbriggs/.emacs.d/blob/master/my-keymaps.el
;; http://dnquark.com/blog/2012/02/emacs-evil-ecumenicalism/
;; https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-evil.el
;; https://github.com/syl20bnr/dotemacs/blob/master/init-package/init-evil.el
;; 当v 选择到行尾时是否包含换行符
(setq-default evil-want-visual-char-semi-exclusive t)
(setq-default evil-want-C-i-jump nil)
(setq-default evil-cross-lines t)
(setq-default evil-default-state 'normal)
(setq-default evil-toggle-key "C-w z") ;用不到了 绑定到一个不常用的键
(setq-default evil-want-fine-undo t)            ;undo tree support
(setq-default evil-symbol-word-search t)        ;* # search for symbol not word
(setq-default evil-flash-delay 0.2)               ;default 2
;; C-e ,到行尾时,光标的位置是在最后一个字符后,还是在字符上
(setq evil-move-cursor-back t) ;;and maybe also:

(setq-default evil-normal-state-tag (propertize "N" 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag (propertize "E" 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag (propertize "I" 'face '((:background "red")))
      evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
      evil-visual-state-tag (propertize "V" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))
;; (setq evil-highlight-closing-paren-at-point-states nil)
(setq-default evil-default-cursor      '(t "white"))
(setq-default evil-emacs-state-cursor  '("red" box))
(setq-default evil-normal-state-cursor '("gray" box))
(setq-default evil-visual-state-cursor '("white" bar))
(setq-default evil-insert-state-cursor '("dark orange" bar))
(setq-default evil-motion-state-cursor '("gray" box))

(global-evil-leader-mode)

(require 'evil)

(evil-leader/set-leader "<SPC>")

;; (define-key evil-visual-state-map (kbd "SPC") evil-leader--default-map) ;
;; (define-key evil-motion-state-map (kbd "SPC") evil-leader--default-map)
;; (define-key evil-emacs-state-map  (kbd "SPC") evil-leader--default-map)



(evil-mode 1)




(evil-declare-motion 'joseph-scroll-half-screen-down)
(evil-declare-motion 'joseph-scroll-half-screen-up)

;; 同一buffer 内的jump backward
(defadvice ace-jump-word-mode (before evil-jump activate)
  (push (point) evil-jump-list))
(defadvice ace-jump-char-mode (before evil-jump activate)
  (push (point) evil-jump-list))
(defadvice ace-jump-line-mode (before evil-jump activate)
  (push (point) evil-jump-list))

(defun evil-repeat-find-char-or-ace-jump()
  "default evil `f' find char ,and `;' repeat it ,now I bound `to' this cmd
so that if you call `f' first, then `;' will repeat it ,
if not,it will call `ace-jump-char-mode' "
  (interactive)
  (if (member last-command '(evil-find-char evil-repeat-find-char))
      (progn
        (call-interactively 'evil-repeat-find-char)
        (setq this-command 'evil-repeat-find-char))
    (call-interactively 'evil-ace-jump-char-mode)
    (setq this-command 'ace-jump-move)))

(define-key evil-normal-state-map ";" 'evil-repeat-find-char-or-ace-jump)

(defadvice keyboard-quit (before evil-insert-to-nornal-state activate)
  "C-g back to normal state"
  (when  (evil-insert-state-p)
    (cond
     ((equal (evil-initial-state major-mode) 'normal)
      (evil-normal-state))
     ((equal (evil-initial-state major-mode) 'insert)
      (evil-normal-state))
     (t
      (if (equal last-command 'keyboard-quit)
          (evil-normal-state)           ;如果初始化state不是normal ，按两次才允许转到normal state
        (evil-change-to-initial-state)) ;如果初始化state不是normal ，按一次 转到初始状态
      ))))
(defadvice joseph-comment-dwim-line(around evil activate)
  "In normal-state, eol check"
  (when (and (evil-normal-state-p)
             evil-move-cursor-back)
    (unless (or (eobp) (eolp)) (forward-char))) ;
  ad-do-it)

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

;; 把所有emacs state  的mode 都转成insert mode
(dolist (mode evil-emacs-state-modes)
  (evil-set-initial-state mode 'insert))
(setq evil-emacs-state-modes nil)

(dolist (mode evil-motion-state-modes)
  (evil-set-initial-state mode 'normal))
(setq evil-motion-state-modes nil)

;; (add-to-list 'evil-insert-state-modes 'magit-log-edit-mode)
;; (add-to-list 'evil-insert-state-modes 'git-commit-mode)
;; (add-to-list 'evil-normal-state-modes 'magit-commit-mode)

;; (add-to-list 'evil-insert-state-modes 'magit-branch-manager-mode)
;; (add-to-list 'evil-insert-state-modes 'log-edit-mode)
(add-to-list 'evil-insert-state-modes 'diff-mode)
;; (add-to-list 'evil-insert-state-modes 'helm-grep-mode)
(add-to-list 'evil-insert-state-modes 'mew-summary-mode)
(add-to-list 'evil-insert-state-modes 'mew-virtual-mode)
(add-to-list 'evil-insert-state-modes 'mew-message-mode)
(add-to-list 'evil-insert-state-modes 'mew-draft-mode)
;; (add-to-list 'evil-normal-state-modes 'erlang-shell-mode)
(add-to-list 'evil-insert-state-modes 'bm-show-mode)
(add-to-list 'evil-normal-state-modes 'ibuffer-mode)
(add-to-list 'evil-buffer-regexps '("\*Async Shell Command\*"  . normal))

;; 默认dird 的r 修改了, 不是 wdired-change-to-wdired-mode,现在改回
(eval-after-load 'dired
  '(progn
     (defvar dired-mode-map)
    (evil-define-key 'normal dired-mode-map
    "r" 'wdired-change-to-wdired-mode
    (kbd "SPC") evil-leader--default-map)))


(eval-after-load 'diff-mode
  '(progn
     ;; (evil-set-initial-state 'diff-mode 'insert)
     (evil-add-hjkl-bindings diff-mode-map 'insert
       (kbd "SPC") evil-leader--default-map)))

(eval-after-load 'magit '(require 'joseph-evil-magit))

(eval-after-load 'log-view
  '(progn
     (evil-set-initial-state 'log-view-mode 'normal)
     (defvar log-view-mode-map)
     (evil-make-overriding-map log-view-mode-map 'normal t)
     (evil-define-key 'normal log-view-mode-map
       (kbd "SPC") evil-leader--default-map)))

(eval-after-load 'vc-dir
  '(progn
     (evil-set-initial-state 'vc-dir-mode 'normal)
     (defvar vc-dir-mode-map)
     (evil-make-overriding-map vc-dir-mode-map 'normal t)
     (evil-define-key 'normal vc-dir-mode-map
       (kbd "SPC") evil-leader--default-map)))

(evil-set-initial-state 'vc-git-log-view-mode 'normal)
(evil-set-initial-state 'vc-svn-log-view-mode 'normal)

(evil-define-key 'normal ibuffer-mode-map
  (kbd "SPC") evil-leader--default-map
  "r" 'ibuffer-toggle-maybe-show)

(eval-after-load 'helm-grep
  '(progn
     ;; use the standard Dired bindings as a base
     (defvar helm-grep-mode-map)
     (evil-make-overriding-map helm-grep-mode-map 'normal t)
     (evil-define-key 'normal helm-grep-mode-map
       (kbd "SPC") evil-leader--default-map  ;leader in ibuffer mode
       "r" 'wgrep-change-to-wgrep-mode)))

(eval-after-load 'comint
  '(progn
     ;; use the standard Dired bindings as a base
     (evil-set-initial-state 'comint-mode 'normal)
     (defvar comint-mode-map)
     (evil-make-overriding-map comint-mode-map 'normal t)
     (evil-define-key 'normal comint-mode-map
       (kbd "SPC") evil-leader--default-map)))

(eval-after-load 'erlang
  '(progn
     ;; use the standard Dired bindings as a base
     (evil-set-initial-state 'erlang-shell-mode 'normal)
     (add-hook 'erlang-shell-mode-hook
               #'(lambda()
                   (defvar erlang-shell-mode-map)
                   (evil-make-overriding-map erlang-shell-mode-map 'normal t)))))


(eval-after-load 'wgrep
  '(progn
     (defadvice wgrep-change-to-wgrep-mode (after evil activate)
       (evil-insert-state t))
     (defadvice wgrep-finish-edit(after evil activate)
       (evil-change-to-initial-state nil t))
     (defadvice wgrep-abort-changes(after evil activate)
       (evil-change-to-initial-state nil t))))

;; 交换y p 的功能
;; (define-key evil-normal-state-map "y" 'evil-paste-after)
;; (define-key evil-normal-state-map "Y" 'evil-paste-before)
;; (define-key evil-normal-state-map "p" 'evil-yank)
;; (define-key evil-normal-state-map "P" 'evil-yank-line)
;; (define-key evil-normal-state-map "w" 'evil-window-map)
;; (define-key evil-normal-state-map (kbd "C-y") 'yank)

;; esc
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key evil-window-map "1" 'delete-other-windows)
(define-key evil-window-map "0" 'delete-window)
(define-key evil-window-map "2" 'split-window-func-with-other-buffer-vertically)
(define-key evil-window-map "3" 'split-window-func-with-other-buffer-horizontally)

;; (define-key evil-normal-state-map (kbd "f") 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "C-z") nil)
(define-key evil-normal-state-map (kbd "C-w") 'ctl-w-map)
(define-key evil-normal-state-map "\C-n" nil)
(define-key evil-normal-state-map "\C-p" nil)
(define-key evil-normal-state-map "\C-v" nil)
(define-key evil-motion-state-map "\C-v" nil)
(define-key evil-normal-state-map "\C-e" nil)
(define-key evil-motion-state-map (kbd "C-b") nil)
(define-key evil-motion-state-map (kbd "C-d") nil)
(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-motion-state-map (kbd "C-f") nil)
(define-key evil-motion-state-map (kbd "C-y") nil)
(define-key evil-normal-state-map [remap yank-pop] nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
;; (define-key evil-normal-state-map "q" nil)
(define-key evil-normal-state-map (kbd "DEL") nil) ;backupspace
;; (define-key evil-motion-state-map  (kbd "RET") nil) ;
;; (define-key evil-motion-state-map "n" nil)
;; (define-key evil-motion-state-map "N" nil)
(define-key evil-normal-state-map "\C-r" nil)
(define-key evil-normal-state-map  (kbd "C-.") nil)
(define-key evil-normal-state-map  (kbd "M-.") nil)
(define-key evil-normal-state-map "o" nil)
(define-key evil-normal-state-map "O" nil)
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
(define-key evil-normal-state-map "g," 'bm-previous)
;; (define-key evil-normal-state-map "," 'bm-previous)

(define-key evil-normal-state-map "gf" 'evil-jump-forward)
(define-key evil-normal-state-map "gb" 'evil-jump-backward)
(define-key evil-normal-state-map "ga" (kbd "M-a"))
(define-key evil-normal-state-map "ge" (kbd "M-e"))
;; (define-key evil-normal-state-map "gA" (kbd "C-M-a"))
;; (define-key evil-normal-state-map "gE" (kbd "C-M-e"))
(define-key evil-motion-state-map "e" nil)
(define-key evil-motion-state-map "E" nil)
(define-key evil-normal-state-map "ea" (kbd "C-M-a"))

(define-key evil-normal-state-map "ee" (kbd "C-M-e"))
;; (define-key evil-normal-state-map "eh" (kbd "C-M-h"))
(define-key evil-normal-state-map "ef" (kbd "C-M-f"))
(define-key evil-normal-state-map "eb" (kbd "C-M-b"))

(define-key evil-normal-state-map "ey" (kbd "C-M-k C-/")) ;kill-sexp,undo
(define-key evil-normal-state-map "ed" (kbd "M-d C-/")) ;kill-word,undo
(define-key evil-normal-state-map "ek" (kbd "C-k"))
(define-key evil-normal-state-map "eK" (kbd "C-M-k C-/"))
(define-key evil-normal-state-map "eu" (kbd "H-i 0 C-k")) ;H-i =C-u 删除从光标位置到行首的内容

(define-key evil-normal-state-map "mf" (kbd "C-M-h")) ;mark-defun
(define-key evil-normal-state-map "mh" (kbd "M-h"))
(define-key evil-normal-state-map "mxh" (kbd "C-x h"))
(define-key evil-normal-state-map (kbd "C-j") 'evil-open-line-or-new-line-dep-pos)
;; (define-key evil-normal-state-map (kbd ".") 'repeat)

;; (global-set-key (kbd "M-SPC") 'rm-set-mark);;alt+space 开始矩形操作，然后移动位置，就可得到选区
;; (define-key evil-motion-state-map (kbd "M-SPC")  'evil-visual-block)

(evil-leader/set-key "?" 'helm-descbinds)
(evil-leader/set-key "f" 'helm-for-files)
(evil-leader/set-key "F" 'helm-find-files)
(evil-leader/set-key "wf" 'helm-find-files)
(evil-leader/set-key "o" 'other-window)
(evil-leader/set-key "g" 'helm-do-grep)
(evil-leader/set-key "vj" 'my-vc-jump)
(evil-leader/set-key "vv" 'vc-next-action)
(evil-leader/set-key "vu" 'vc-revert)
(evil-leader/set-key "vl" 'vc-print-log)
(evil-leader/set-key "vL" 'vc-print-root-log)
(evil-leader/set-key "vd" 'vc-dir)
(evil-leader/set-key "v=" 'vc-diff)
(evil-leader/set-key "=" 'vc-diff)
(evil-leader/set-key "+" 'vc-ediff)
(evil-leader/set-key "2" 'split-window-func-with-other-buffer-vertically)
(evil-leader/set-key "3" 'split-window-func-with-other-buffer-horizontally)
(evil-leader/set-key "1" 'delete-other-windows)
(evil-leader/set-key "0" 'delete-window)
(evil-leader/set-key "dj" 'dired-jump)
(evil-leader/set-key "j" 'dired-jump)
(evil-leader/set-key "b" 'ido-switch-buffer)
(evil-leader/set-key "c" 'ido-switch-buffer)
(evil-leader/set-key "SPC" 'ido-switch-buffer)
(evil-leader/set-key "a" 'smart-beginning-of-line)
(evil-leader/set-key "e" 'smart-end-of-line)
(evil-leader/set-key "k" 'kill-buffer-or-server-edit)
(evil-leader/set-key "wk" 'bury-buffer)
(evil-leader/set-key "q" 'evil-prev-buffer)
(evil-leader/set-key ";" 'helm-M-x)
(evil-leader/set-key "l" 'ibuffer)
(evil-leader/set-key (kbd "C-g") 'keyboard-quit)
(evil-leader/set-key "zs" 'compile-dwim-compile)
(evil-leader/set-key "n" 'evil-next-buffer)
(evil-leader/set-key "p" 'evil-prev-buffer)
(evil-leader/set-key "s" 'save-buffer)
(evil-leader/set-key "S" 'save-some-buffers)
;; (evil-leader/set-key "j" 'open-line-or-new-line-dep-pos)
(evil-leader/set-key "rt" 'string-rectangle)
(evil-leader/set-key "rk" 'kill-rectangle)
(evil-leader/set-key "ry" 'yank-rectangle)
(evil-leader/set-key "h" 'mark-whole-buffer)
(evil-leader/set-key "xw" 'widen)
(evil-leader/set-key "xn" 'narrow-to-region)
(evil-leader/set-key "xu" 'undo-tree-visualize)


(define-key evil-outer-text-objects-map "o" nil)
(define-key evil-inner-text-objects-map "o" nil)
(require 'joseph-evil-symbol)


(provide 'joseph-evil)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp.el ends here
