(autoload 'iedit-mode "iedit" "Edit current search matches")
(global-set-key (kbd "C-M-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-M-;") 'iedit-mode)
(eval-after-load "iedit"
  '(define-key iedit-mode-map (kbd "C-g") 'iedit-mode))

(provide 'joseph-iedit)
