;; https://github.com/mbriggs/.emacs.d/blob/master/my-keymaps.el
;; http://dnquark.com/blog/2012/02/emacs-evil-ecumenicalism/
;; https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-evil.el
;; https://github.com/syl20bnr/dotemacs/blob/master/init-package/init-evil.el
;; 当v 选择到行尾时是否包含换行符
(setq-default evil-want-visual-char-semi-exclusive t)
(setq-default evil-want-C-i-jump nil)
(setq-default evil-default-state 'normal)
(setq-default evil-toggle-key "C-w z") ;用不到了 绑定到一个不常用的键
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "?" 'helm-descbinds)
(evil-leader/set-key "f" 'helm-for-files)
(evil-leader/set-key "o" 'other-window)
(evil-leader/set-key "wg" 'helm-do-grep)
(evil-leader/set-key "vj" 'my-vc-jump)
(evil-leader/set-key "vv" 'vc-next-action)
(evil-leader/set-key "2" 'split-window-func-with-other-buffer-vertically)
(evil-leader/set-key "3" 'split-window-func-with-other-buffer-horizontally)
(evil-leader/set-key "1" 'delete-other-windows)
(evil-leader/set-key "0" 'delete-window)
(evil-leader/set-key "j" 'dired-jump)
(evil-leader/set-key "b" 'ido-switch-buffer)
(evil-leader/set-key "c" 'ido-switch-buffer)
(evil-leader/set-key "a" 'smart-beginning-of-line)
(evil-leader/set-key "e" 'smart-end-of-line)
(evil-leader/set-key "k" 'kill-buffer-or-server-edit)
(evil-leader/set-key ":" 'helm-M-x)

(require 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t)            ;undo tree support
;; C-e ,到行尾时,光标的位置是在最后一个字符后,还是在字符上
(setq evil-move-cursor-back nil) ;;and maybe also:
(setq evil-highlight-closing-paren-at-point-states nil)
(setq evil-normal-state-tag (propertize "N" 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag (propertize "E" 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag (propertize "I" 'face '((:background "red")))
      evil-motion-state-tag (propertize "M" 'face '((:background "blue")))
      evil-visual-state-tag (propertize "V" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))


(setq evil-default-cursor      '(t "white"))
(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("white" bar))
(setq evil-insert-state-cursor '("dark orange" bar))
(setq evil-motion-state-cursor '("gray" box))
(add-to-list 'evil-insert-state-modes 'magit-log-edit-mode)
;; (add-to-list 'evil-insert-state-modes 'magit-branch-manager-mode)
(add-to-list 'evil-insert-state-modes 'log-edit-mode)
(add-to-list 'evil-insert-state-modes 'diff-mode)
(add-to-list 'evil-insert-state-modes 'helm-grep-mode)
(add-to-list 'evil-insert-state-modes 'mew-summary-mode)
(add-to-list 'evil-insert-state-modes 'mew-virtual-mode)
(add-to-list 'evil-insert-state-modes 'mew-message-mode)
(add-to-list 'evil-insert-state-modes 'mew-draft-mode)
(add-to-list 'evil-insert-state-modes 'erlang-shell-mode)
(add-to-list 'evil-insert-state-modes 'bm-show-mode)
(add-to-list 'evil-normal-state-modes 'ibuffer-mode)

(evil-declare-motion 'joseph-scroll-half-screen-down)
(evil-declare-motion 'joseph-scroll-half-screen-up)

;; (defadvice evil-goto-definition (around evil-clever-goto-def activate)
;;   "Make use of emacs' find-func and etags possibilities for finding definitions."
;;   (quick-jump-push-marker)
;;   (case major-mode
;;     (emacs-lisp-mode
;;      (condition-case nil
;;          (find-function (symbol-at-point))
;;        (error (condition-case nil
;;                   (find-variable (symbol-at-point))
;;                 (error (condition-case nil
;;                            (helm-etags+-select)
;;                          (error ad-do-it)))))))
;;     (erlang-mode (erl-find-source-under-point))
;;     (otherwise
;;      (condition-case nil
;;          (helm-etags+-select)
;;        (error ad-do-it))
;;      )))

;; 同一buffer 内的jump backward
(define-key evil-motion-state-map (kbd "H-i") 'evil-jump-forward)
;; C-o evil-jump-backward
(defadvice ace-jump-word-mode (before evil-jump activate)
  (push (point) evil-jump-list))
(defadvice ace-jump-char-mode (before evil-jump activate)
  (push (point) evil-jump-list))
(defadvice ace-jump-line-mode (before evil-jump activate)
  (push (point) evil-jump-list))

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
(define-key evil-normal-state-map "q" nil)
(define-key evil-normal-state-map (kbd "DEL") nil) ;backupspace
;; (define-key evil-motion-state-map "n" nil)
;; (define-key evil-motion-state-map "N" nil)
(define-key evil-normal-state-map "\C-r" nil)
(define-key evil-normal-state-map  (kbd "C-.") nil)
(define-key evil-normal-state-map  (kbd "M-.") nil)

(define-key evil-normal-state-map "m" nil) ;evil-set-marker
(define-key evil-motion-state-map "`" nil) ;'evil-goto-mark
(define-key evil-motion-state-map "gd" 'goto-definition)
(define-key evil-normal-state-map "q" 'bury-buffer-and-window)
(define-key evil-motion-state-map "H" 'joseph-forward-4-line)
(define-key evil-motion-state-map "L" 'joseph-backward-4-line)
(define-key evil-normal-state-map "s" 'joseph-forward-symbol-or-isearch-regexp-forward)
(define-key evil-normal-state-map "S" 'joseph-backward-symbol-or-isearch-regexp-backward)

;; 下面的部分 insert mode 就是正常的emacs
;; Insert state clobbers some useful Emacs keybindings
;; The solution to this is to clear the insert state keymap, leaving you with
;; unadulterated Emacs behavior. You might still want to poke around the keymap
;; (defined in evil-maps.el) and see if you want to salvage some useful insert
;; state command by rebinding them to keys of your liking. Also, you need to
;; bind ESC to putting you back in normal mode. So, try using this code.
;; With it, I have no practical need to ever switch to Emacs state.
;; 清空所有insert-state的绑定,这样 ,insert mode 就是没装evil 前的正常emacs了
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;; evil-emacs-state is annoying, the following function and hook automatically
;; switch to evil-insert-state whenever the evil-emacs-state is entered.
;; It allows a more consistent navigation experience among all mode maps.
(defun evil-emacs-state-2-evil-insert-state ()
  (evil-insert-state)
  (remove-hook 'post-command-hook 'evil-emacs-state-2-evil-insert-state))
(add-hook 'evil-emacs-state-entry-hook
  (lambda ()
    (add-hook 'post-command-hook 'evil-emacs-state-2-evil-insert-state)))

;; same thing for motion state but switch in normal mode instead
;; 这一部分暂时注掉,以观后效
(defun evil-motion-state-2-evil-normal-state ()
  (if (equal (evil-initial-state major-mode) 'insert)
      (evil-insert-state)
    (evil-normal-state))
  (remove-hook 'post-command-hook 'evil-motion-state-2-evil-normal-state))
(add-hook 'evil-motion-state-entry-hook
  (lambda ()
    (add-hook 'post-command-hook 'evil-motion-state-2-evil-normal-state)))




;; 交换y p 的功能
;; (define-key evil-normal-state-map "y" 'evil-paste-after)
;; (define-key evil-normal-state-map "Y" 'evil-paste-before)
;; (define-key evil-normal-state-map "p" 'evil-yank)
;; (define-key evil-normal-state-map "P" 'evil-yank-line)
;; (define-key evil-normal-state-map "w" 'evil-window-map)
;; (define-key evil-normal-state-map (kbd "C-y") 'yank)

;; esc
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
;; 默认dird 的r 修改了, 不是 wdired-change-to-wdired-mode,现在改回
(evil-define-key 'normal dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; (evil-define-key 'normal magit-log-edit-mode-map "q" 'magit-log-edit-commit)
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'insert
  "l" 'magit-key-mode-popup-logging
    "K" 'magit-discard-item
  "h" 'magit-toggle-diff-refine-hunk)

(evil-add-hjkl-bindings helm-grep-mode-map 'insert  )

(evil-define-key 'normal ibuffer-mode-map
  "r" 'ibuffer-toggle-maybe-show)

(require 'joseph-evil-symbol)


(provide 'joseph-evil)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp.el ends here
