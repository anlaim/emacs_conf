;;; -*- coding:utf-8 -*-
  ;; (setq helm-idle-delay 0.3)
  ;; (setq helm-input-idle-delay 0)

(eval-when-compile
  (require 'cl)                         ;func case is defined in cl.el 
  (require 'joseph-util)                         ;func case is defined in cl.el 
  (require 'joseph-keybinding)                         ;func case is defined in cl.el 
  (require 'helm)                         ;func case is defined in cl.el 
  (require 'helm-mode)                         ;func case is defined in cl.el 
  (require 'helm-help)                         ;func case is defined in cl.el 
  (require 'helm-buffers)                         ;func case is defined in cl.el 
  (require 'helm-files)                         ;func case is defined in cl.el 
  (require 'helm-locate)                         ;func case is defined in cl.el 
  (require 'helm-ls-git)                         ;func case is defined in cl.el 
  )

(setq-default helm-locate-command (case system-type
                                    ('gnu/linux (expand-file-name "~/.emacs.d/bin/everything.sh %s %s"))
                                    ;; "locate  %s -e -A %s"
                                    ('berkeley-unix "locate %s %s")
                                    ('windows-nt "es %s %s")
                                    ('darwin "mdfind -name %s %s")
                                    (t "locate %s %s"))
              helm-buffer-max-length 80
              helm-buffers-fuzzy-matching t
              helm-recentf-fuzzy-match t
              ;; helm-locate-fuzzy-match t  ;mdfind doesnot support fuzzy match
              helm-M-x-fuzzy-match t
              helm-semantic-fuzzy-match t
              helm-imenu-fuzzy-match t
              helm-ls-git-fuzzy-match t
              helm-lisp-fuzzy-completion t
              helm-adaptive-history-file "~/.emacs.d/cache/helm-adaptive-history"
              helm-for-files-preferred-list '(
                                              helm-source-buffers-list
                                              ;; helm-source-ido-virtual-buffers
                                              helm-source-recentf
                                              ;; helm-source-bookmarks
                                              ;; helm-source-file-cache
                                              ;; helm-source-files-in-current-dir
                                              helm-source-files-in-all-dired
                                              helm-source-joseph-filelist
                                              ;; helm-source-locate
                                              helm-source-ls-git
                                              ;; helm-source-mac-spotlight
                                              )
              helm-ff-skip-boring-files t
              helm-ff-newfile-prompt-p nil
              helm-ff-auto-update-initial-value t
              helm-ff-file-name-history-use-recentf t
              helm-always-two-windows t)

(fset 'describe-bindings 'helm-descbinds)
(autoload 'helm-semantic-or-imenu "helm-semantic" "" t nil)
(autoload 'helm-M-x "helm-command" "" t nil)
(autoload 'helm-all-mark-rings "helm-ring" "" t nil)
(autoload 'helm-show-kill-ring "helm-ring" "" t nil)
(autoload 'helm-do-grep "helm-grep" "" t nil)
(autoload 'helm-find-files "helm-files" "" t nil)
(autoload 'helm-for-files "helm-files" "" t nil)
(autoload 'helm-locate "helm-locate" "" t nil)
(autoload 'helm-list-emacs-process "helm-sys" "" t nil)
(autoload 'helm-source-ls-git "helm-ls-git" "" nil nil)
(autoload 'helm-lisp-completion-at-point "helm-elisp" "" t nil)

(define-key ctl-w-map (kbd "i")         'helm-semantic-or-imenu)
(define-key ctl-w-map (kbd "M-x")       'helm-M-x)
(global-set-key "\M-x" 'helm-M-x)
(define-key ctl-w-map (kbd "b")         'helm-resume);define in helm.el

(define-key ctl-w-map (kbd "C-y") 'helm-all-mark-rings)
(define-key ctl-w-map (kbd "g") 'helm-do-grep)
(define-key ctl-w-map (kbd "f") 'helm-find-files)
(define-key ctl-w-map (kbd "C-f") 'helm-for-files)
(define-key ctl-w-map (kbd "C-l") 'helm-locate)
(define-key ctl-w-map "p" 'helm-list-emacs-process)
;; 
(define-key ctl-w-map (kbd "C-o") 'helm-ls-git-ls)
;; lisp complete.
(define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
(define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)



;; From browse-kill-ring.el
(defadvice yank-pop (around kill-ring-browse-maybe (arg) activate)
  "If last action was not a yank, run `browse-kill-ring' instead."
  ;; yank-pop has an (interactive "*p") form which does not allow
  ;; it to run in a read-only buffer. We want browse-kill-ring to
  ;; be allowed to run in a read only buffer, so we change the
  ;; interactive form here. In that case, we need to
  ;; barf-if-buffer-read-only if we're going to call yank-pop with
  ;; ad-do-it
  (interactive "p")
  (if (not (eq last-command 'yank))
      (helm-show-kill-ring)
    (barf-if-buffer-read-only)
    ad-do-it))



(with-eval-after-load 'helm
  (require 'helm-adaptive)
  (helm-adaptive-mode 1)
  (helm-autoresize-mode 1)

  (define-key helm-map  (kbd "C-2") 'helm-toggle-visible-mark);;mark M-m
  ;; (define-key helm-map  [?\H-m] 'helm-maybe-exit-minibuffer);;return

  ;; (define-key helm-map (kbd "C-r") 'helm-execute-persistent-action);;默认是C-z
  (define-key helm-map (kbd "C-s") 'helm-next-line) ;;
  (define-key helm-map (kbd "C-r") 'helm-previous-line) ;;
  (define-key helm-map (kbd "C-e") 'helm-execute-persistent-action)

  (define-key helm-map (kbd "C-k") 'helm-previous-source)
  (define-key helm-map (kbd "C-o") 'helm-next-source)
  (define-key helm-map (kbd "`")        'helm-select-action))

(with-eval-after-load 'helm-buffers
    (define-key helm-buffer-map (kbd "C-s")       'helm-next-line)
    (define-key helm-buffer-map (kbd "C-r") 'helm-previous-line))

(with-eval-after-load 'helm-files
  (require 'helm-ls-git)
  (unless helm-source-ls-git
    (setq helm-source-ls-git (helm-make-source "Git files" 'helm-ls-git-source)))  
  (require 'joseph-helm-filelist)

  
  (define-key helm-find-files-map (kbd "C-s")       'helm-next-line)
  (define-key helm-find-files-map (kbd "C-r") 'helm-previous-line) ;;
  (define-key helm-generic-files-map (kbd "C-s")       'helm-next-line)
  (define-key helm-generic-files-map (kbd "C-r") 'helm-previous-line) ;;
  )




(with-eval-after-load 'helm-mode
  (helm-mode 1)
  (add-to-list 'helm-completing-read-handlers-alist '(ibuffer-find-file . ido))
  (add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido))
  (add-to-list 'helm-completing-read-handlers-alist '(find-file . ido))
  )

(run-with-idle-timer 3 nil '(lambda()
                               (require 'helm-config)
                               (require 'helm)
                               (require 'helm-mode)
                               (require 'helm-grep)
                               (require 'helm-ls-git)
                               (require 'helm-locate)))              


(provide 'joseph-helm)
