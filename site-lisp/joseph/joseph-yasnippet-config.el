;; -*- coding:utf-8 -*-
;;; jospeh-yasnippet-config.el --- config for yasnippet
;;; Code:
(setq-default yas--load-file-name nil)  ;不加载yas 自带的snippet

(add-hook 'java-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)
(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'erlang-mode-hook 'yas-minor-mode)
(add-hook 'csharp-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'html-mode-hook 'yas-minor-mode)
(add-hook 'lua-mode-hook 'yas-minor-mode)
(add-hook 'nxml-mode-hook 'yas-minor-mode)
(add-hook 'org-mode-hook 'yas-minor-mode)
(add-hook 'perl-mode-hook 'yas-minor-mode)
(add-hook 'sh-mode-hook 'yas-minor-mode)
(add-hook 'snippet-mode-hook 'yas-minor-mode)
(add-hook 'sql-mode-hook 'yas-minor-mode)
(add-hook 'sqlserver-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'yas-minor-mode)

;; (require 'yasnippet) ;;
(eval-after-load 'yasnippet
  '(progn
     (yas-global-mode 1)
     (require 'joseph-yasnippet-lazy)
     (setq-default yas-prompt-functions '(yas-completing-prompt))
     (setq-default helm-c-yas-space-match-any-greedy t) ;[default: nil]
     ;; (add-hook 'find-file-hook 'joseph-find-yasnippets-file)

     (define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)

     (define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field)
     (define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field)))

;; (global-set-key  [?\H-i] 'yas-expand)

(autoload 'helm-c-yas-complete "helm-c-yasnippet" "List of yasnippet snippets using `helm' interface.")
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)


(provide 'joseph-yasnippet-config)
;;; jospeh-yasnippet-config.el ends here
