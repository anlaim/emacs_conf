(setq-default evil-toggle-key "C-w z")
(require 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t)
(setq evil-default-cursor (quote (t "white")))
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("gray" bar))
(setq evil-motion-state-cursor '("gray" box))
(add-to-list 'evil-emacs-state-modes 'magit-log-edit-mode)
(add-to-list 'evil-emacs-state-modes 'log-edit-mode)
(add-to-list 'evil-emacs-state-modes 'mew-summary-mode )


(evil-declare-motion 'joseph-scroll-half-screen-down)
(evil-declare-motion 'joseph-scroll-half-screen-up)


;; 默认dird 的r 修改了, 不是 wdired-change-to-wdired-mode,现在改回
(eval-after-load 'dired
  '(progn
     ;; use the standard Dired bindings as a base
     ;; (evil-make-overriding-map dired-mode-map 'normal t)
     (evil-add-hjkl-bindings dired-mode-map 'normal
       "r" 'wdired-change-to-wdired-mode                ;
       )))

(define-key evil-normal-state-map (kbd "C-w") 'ctl-w-map)
(define-key evil-insert-state-map (kbd "C-w") 'ctl-w-map)
(define-key evil-normal-state-map "\C-n" nil)
(define-key evil-normal-state-map "\C-p" nil)
(define-key evil-normal-state-map "\C-v" nil)
(define-key evil-motion-state-map "\C-v" nil)
(define-key evil-normal-state-map "\C-e" nil)
(define-key evil-insert-state-map "\C-e" nil)
(define-key evil-insert-state-map "\C-n" nil)
(define-key evil-motion-state-map (kbd "C-b") nil)
(define-key evil-motion-state-map (kbd "C-d") nil)
(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-motion-state-map (kbd "C-f") nil)
(define-key evil-insert-state-map "\C-k" nil)
(define-key evil-insert-state-map "\C-y" nil)
(define-key evil-motion-state-map (kbd "C-y") nil)
(define-key evil-normal-state-map [remap yank-pop] nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map "q" nil)
(define-key evil-motion-state-map "n" nil)
(define-key evil-motion-state-map "N" nil)
(define-key evil-normal-state-map "\C-r" nil)
(define-key evil-normal-state-map "y" 'evil-paste-after)
(define-key evil-normal-state-map "Y" 'evil-paste-before)
;; (define-key evil-normal-state-map (kbd "C-y") 'yank)

(provide 'joseph-evil)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-tmp.el ends here
