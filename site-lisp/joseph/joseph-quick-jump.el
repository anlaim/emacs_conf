;;; Code:
;; (global-set-key "\M-,"      'quick-jump-go-back)
;; (global-set-key "\M-/"      'quick-jump-go-forward)
;; (global-set-key (kbd "C-,") 'quick-jump-go-back)
;; (global-set-key (kbd "C-.") 'quick-jump-push-marker)
;; (global-set-key (kbd "C-<") 'quick-jump-go-forward)
;; (global-set-key (kbd "C->") 'quick-jump-clear-all-marker)
;; (eval-after-load 'helm-bookmark
;;   '(add-hook 'quick-jump-push-marker-hook 'push-curline-to-bookmark))


(global-set-key (kbd "C-.") 'bookmark-cycle-push)
(global-set-key (kbd "C-<") 'bookmark-cycle-next)
(global-set-key (kbd "C-,") 'bookmark-cycle-previous)

(global-set-key "\M-/"      'bookmark-cycle-next)
(global-set-key "\M-,"      'bookmark-cycle-previous)

(provide 'joseph-quick-jump)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-quick-jump.el ends here
