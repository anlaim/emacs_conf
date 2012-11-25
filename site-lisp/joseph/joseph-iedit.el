;; (autoload 'iedit-mode "iedit" "Edit current search matches")
(setq-default iedit-toggle-key-default (kbd "C-M-;"))
(autoload 'iedit-mode-from-isearch "iedit" "enable iedit-mode when in isearch mode")

(define-key global-map iedit-toggle-key-default 'iedit-mode)
(define-key isearch-mode-map iedit-toggle-key-default 'iedit-mode-from-isearch)


(provide 'joseph-iedit)
