;;; Code:
;; (global-set-key "\M-,"      'quick-jump-go-back)
;; (global-set-key "\M-/"      'quick-jump-go-forward)
;; (global-set-key (kbd "C-,") 'quick-jump-go-back)
;; (global-set-key (kbd "C-.") 'quick-jump-push-marker)
;; (global-set-key (kbd "C-<") 'quick-jump-go-forward)
;; (global-set-key (kbd "C->") 'quick-jump-clear-all-marker)
;; (eval-after-load 'helm-bookmark
;;   '(add-hook 'quick-jump-push-marker-hook 'push-curline-to-bookmark))


;; (global-set-key (kbd "C-.") 'bookmark-cycle-push)
;; (global-set-key (kbd "C-,") 'bookmark-cycle-next)
;; (global-set-key (kbd "C-<") 'bookmark-cycle-previous)

;; (global-set-key "\M-,"      'bookmark-cycle-next)
;; (global-set-key "\M-/"      'bookmark-cycle-previous)

(setq bm-recenter t)
(setq bm-highlight-style 'bm-highlight-only-fringe)
(setq bm-cycle-all-buffers t)
(setq bm-in-lifo-order t)
;; (setq-default bm-buffer-persistence t)
;; (setq-default bm-restore-repository-on-load t)
;; (require 'bm)
;; (add-hook' after-init-hook 'bm-repository-load)
;; (add-hook 'find-file-hooks 'bm-buffer-restore)
;; (add-hook 'kill-buffer-hook 'bm-buffer-save)
;; (add-hook 'kill-emacs-hook '(lambda nil
;;                               (bm-buffer-save-all)
;;                               (bm-repository-save)))

;; (add-hook 'after-revert-hook 'bm-buffer-restore)

(global-set-key (kbd "C-.") 'bm-toggle)
(global-set-key (kbd "C-,")   'bm-next)

;; (global-set-key (kbd "M-.") 'bm-toggle)
(global-set-key (kbd "M-/")   'bm-next)
(global-set-key (kbd "M-,") 'bm-previous)

(define-key global-map (kbd "M-*") 'helm-bm)


(provide 'joseph-quick-jump)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-quick-jump.el ends here
