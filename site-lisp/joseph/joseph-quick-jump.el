;;; Code:
(global-set-key "\M-,"      'quick-jump-go-back)
(global-set-key "\M-/"      'quick-jump-go-forward)
(global-set-key (kbd "C-,") 'quick-jump-go-back)
(global-set-key (kbd "C-.") 'quick-jump-push-marker)
(global-set-key (kbd "C-<") 'quick-jump-go-forward)
(global-set-key (kbd "C->") 'quick-jump-clear-all-marker)
(eval-after-load 'helm-bookmark
  '(add-hook 'quick-jump-push-marker-hook 'push-curline-to-bookmark))



(provide 'joseph-quick-jump)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-quick-jump.el ends here
