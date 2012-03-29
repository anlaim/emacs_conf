;;; -*- coding:utf-8 -*-
(setq-default org-directory "~/org")
(eval-when-compile (require 'joseph_keybinding))

(setq-default helm-c-adaptive-history-file "~/.emacs.d/cache/helm-c-adaptive-history")

;; (autoload 'helm-descbinds "helm-descbinds")
(fset 'describe-bindings 'helm-descbinds)

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

(eval-after-load 'helm
  '(progn
     (setq helm-samewindow nil)
     (setq helm-candidate-number-limit 100)
     (setq helm-debug nil)
     (setq debug-on-error nil )
     (setq helm-idle-delay 0.3)
     (setq helm-input-idle-delay 0)
     ;;在*helm-**buffer里面的键绑定
     ;; (define-key helm-map (kbd "C-2") nil)
     ;; (define-key helm-map (kbd "C-2") 'helm-toggle-visible-mark);;mark
     (define-key helm-map  [?\H-m] 'helm-toggle-visible-mark);;mark C-m
     (define-key helm-map (kbd "C-r") 'helm-execute-persistent-action);;默认是C-z
     (define-key helm-map (kbd "C-j") 'helm-select-3rd-action)        ;C-j 执行第3个命令，默认C-e 执行第2个
     ;; (define-key helm-map (kbd "C-f") 'helm-execute-persistent-action)

     (define-key helm-map (kbd "C-.") 'helm-previous-source)
     (define-key helm-map (kbd "C-o") 'helm-next-source)
     (define-key helm-map (kbd "C-,") 'minibuffer-up-parent-dir)

     (define-key helm-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-map (kbd "C-w") nil)
     ;; (define-key helm-map (kbd "C-,") 'helm-find-files-down-one-level)
     ;;删除当前选项
     ;; (define-key helm-map (kbd "C-d") 'helm-delete-current-selection); default C-cC-d
     ))



(eval-after-load 'helm-buffers
  '(progn
     (setq  helm-c-boring-buffer-regexp
            (rx (or
                 (group bos  " ")
                 ;; helm-buffer
                 "*ac-mode-"
                 "*helm"
                 ;; echo area
                 " *Echo Area" " *Minibuf"
                 " *"
                 "*Completions*"
                 "*Ibuffer*"
                 )))
     ;; key for buffer
     (define-key  helm-c-buffer-map (kbd "C-5") 'helm-buffer-run-query-replace)
     (define-key helm-c-buffer-map (kbd "C-s") 'helm-buffer-run-zgrep)
     (define-key helm-c-buffer-map (kbd "C-=") 'helm-buffer-run-ediff)
     ;; (define-key helm-c-buffer-map (kbd "H-m") 'helm-buffer-run-ediff-merge)
     (define-key helm-c-buffer-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-c-buffer-map (kbd "C-w") nil)
     (setq helm-allow-skipping-current-buffer t)
     ))

(eval-after-load 'helm-files
  '(progn
     (setq helm-for-files-prefered-list
           '(helm-c-source-ffap-line
             helm-c-source-ffap-guesser
             helm-c-source-buffers-list
             helm-c-source-recentf
             ;; helm-c-source-file-cache
             helm-c-source-files-in-current-dir
             helm-c-source-files-in-all-dired
             helm-c-source-dired-history
             helm-c-source-joseph-filelist
             helm-c-source-locate
             ;; helm-c-source-bookmarks
             ))
     (setq helm-ff-newfile-prompt-p nil)
     (define-key helm-find-files-map (kbd "C-,") 'minibuffer-up-parent-dir)
     (define-key helm-c-read-file-map (kbd "C-,") 'minibuffer-up-parent-dir)
     (define-key helm-map (kbd "C-,") 'minibuffer-up-parent-dir)

     (define-key helm-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-map (kbd "C-w") nil)
     (define-key helm-find-files-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-find-files-map (kbd "C-w") nil)
     (define-key helm-c-read-file-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-c-read-file-map (kbd "C-w") nil)
     ))
(eval-after-load 'helm-config
  '(progn
     (setq  helm-su-or-sudo "sudo")
     ;; (helm-dired-bindings 1);;
     (setq helm-c-locate-command
           (case system-type
             ('gnu/linux "locate -i -r %s")
             ('berkeley-unix "locate -i %s")
             ('windows-nt "es -r %s")      ;remove -i case senetitave 忽略 大小写
             (t "locate %s"))
           )

     (set-keymap-parent ctl-w-map helm-command-map)

     (define-key ctl-x-map (kbd "c") 'helm-buffers-list)
     (define-key ctl-w-map (kbd "c") 'helm-buffers-list)
     ;; (define-key global-map (kbd "M-y") 'helm-show-kill-ring)
     (define-key helm-command-map (kbd "M-y") 'helm-all-mark-rings)
     ;;在firefox里 about:config修改下面的值为true后就可以在emacs里打开firefox书签里的内容
     ;; user_pref("browser.bookmarks.autoExportHTML", true);
     (define-key ctl-w-map (kbd "b") 'helm-firefox-bookmarks)
     (define-key ctl-w-map (kbd "x") 'helm-M-x)
     (global-set-key "\M-x" 'helm-M-x)
     ;;do grep in selected file or dir
     (define-key ctl-w-map (kbd "g") 'helm-do-grep)
     ;;list matched regexp in current buffer
     (define-key ctl-w-map (kbd "C-s") 'helm-occur)
     ;;do query-replace
     (define-key ctl-w-map (kbd "r") 'helm-regexp)
     (define-key ctl-w-map (kbd "H-i") 'helm-imenu)

     (define-key ctl-w-map (kbd "f") 'helm-find-files)
     (define-key ctl-w-map (kbd "C-f") 'helm-for-files)
     (define-key ctl-w-map (kbd "C-c") 'helm-buffers-list)
     (define-key ctl-w-map (kbd "C") 'helm-colors)

     (define-key ctl-w-map (kbd "C-w") 'helm-write-file)
     (define-key ctl-w-map (kbd "<SPC>") 'helm-execute-helm-command)
     (define-key ctl-w-map (kbd "l") 'helm-locate)
     (define-key ctl-w-map (kbd "C-p") 'helm-list-emacs-process)

     (define-key ctl-w-map "p" 'helm-list-emacs-process)


     ;; Lisp complete or indent.
     (define-key lisp-interaction-mode-map [remap indent-for-tab-command] 'helm-lisp-completion-at-point-or-indent)
     (define-key emacs-lisp-mode-map [remap indent-for-tab-command] 'helm-lisp-completion-at-point-or-indent)
     ;; lisp complete.
     (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
     (define-key emacs-lisp-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)


     (helm-mode)
     ;; (add-to-list 'helm-completing-read-handlers-alist '(lusty-file-explorer . nil));;对于lusty 不使用helm engine
     ;; (require 'lusty-explorer)
     ;; (global-set-key [remap find-file] 'lusty-file-explorer) ;C-xC-f
     ;; (add-hook 'lusty-setup-hook 'my-lusty-hook)

     (defun helm-man-woman (&optional arg)
       "Preconfigured `helm' for Man and Woman pages."
       (interactive "P")
       (helm 'helm-c-source-man-pages (if arg ""  (thing-at-point 'symbol)) "Man Page:" nil ))

     ))



(require 'helm-dired-history)
(require 'helm-config)
(require 'joseph-helm-filelist)

(provide 'joseph-helm)
