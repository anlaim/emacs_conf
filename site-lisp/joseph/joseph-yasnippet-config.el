;; -*- coding:utf-8 -*-
;;; jospeh-yasnippet-config.el --- config for yasnippet
;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph-util))

(setq-default yas--load-file-name nil)  ;不加载yas 自带的snippet
(require 'yasnippet) ;;
(setq-default yas-prompt-functions '(yas-completing-prompt))

(yas-global-mode 1)
;; (global-set-key  [?\H-i] 'yas-expand)

(setq-default helm-c-yas-space-match-any-greedy t) ;[default: nil]
(autoload 'helm-c-yas-complete "helm-c-yasnippet" "List of yasnippet snippets using `helm' interface.")
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)

(defun joseph-find-yasnippets-file ()
  (when (string-match "/snippets/" buffer-file-name)
    (snippet-mode )))
(add-hook 'find-file-hook 'joseph-find-yasnippets-file)


;; Jump to end of snippet definition
(define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)

;; Inter-field navigation
(defun yas/goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
        (position (yas--field-end (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))

(defun yas/goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
        (position (yas--field-start (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))

(define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field)
(define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field)
(provide 'joseph-yasnippet-config)
;;; jospeh-yasnippet-config.el ends here
