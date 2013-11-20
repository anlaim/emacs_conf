;;; -*- coding:utf-8 -*-
(setq-default org-directory "~/org")
(eval-when-compile (require 'joseph_keybinding))
(eval-when-compile (require 'helm))
(eval-when-compile (require 'helm-config))
(eval-when-compile (require 'helm-buffers))
(eval-when-compile (require 'helm-mode))
(eval-when-compile (require 'helm-files))


(setq-default helm-adaptive-history-file "~/.emacs.d/cache/helm-adaptive-history")
(setq-default helm-command-prefix-key  "C-w c")
(define-key (current-global-map) (read-kbd-macro "\C-wc") 'helm-command-prefix)

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

(defadvice helm-execute-persistent-action(around eol-or-persist-action activate)
  "go to end of line or do `helm-execute-persistent-action'"
  (if (eolp)
      ad-do-it
    (end-of-line)))

(eval-after-load 'helm
  '(progn
     (setq helm-full-frame nil)
     (setq helm-candidate-number-limit 100)
     (setq helm-debug nil)
     (setq debug-on-error nil )
     ;; (setq helm-idle-delay 0.3)
     ;; (setq helm-input-idle-delay 0)
     ;;在*helm-**buffer里面的键绑定
     ;; (define-key helm-map (kbd "C-2") nil)
     ;; (define-key helm-map (kbd "C-2") 'helm-toggle-visible-mark);;mark
     (define-key helm-map  (kbd "C-s") 'helm-next-line);;
     (define-key helm-map  (kbd "C-r") 'helm-previous-line);;
     ;; (define-key helm-map  (kbd "C-n") nil);;
     ;; (define-key helm-map  (kbd "C-p") nil);;
     (define-key helm-map  (kbd "C-e") 'helm-execute-persistent-action);;

     (define-key helm-map  (kbd "M-m") 'helm-toggle-visible-mark);;mark M-m
     (define-key helm-map  [?\H-m] 'helm-exit-minibuffer);;return

     ;; (define-key helm-map (kbd "C-r") 'helm-execute-persistent-action);;默认是C-z
     (define-key helm-map (kbd "C-j") 'helm-select-2nd-action-or-end-of-line)        ;C-j 执行第3个命令，默认C-e 执行第2个
     ;; (define-key helm-map (kbd "C-f") 'helm-execute-persistent-action)

     (define-key helm-map (kbd "C-.") 'helm-previous-source)
     (define-key helm-map (kbd "C-o") 'helm-next-source)
     (define-key helm-map (kbd "C-,") 'minibuffer-up-parent-dir)

     (define-key helm-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-map (kbd "C-w") nil)
     ))
(eval-after-load 'helm-buffers
  '(progn
     (setq helm-boring-buffer-regexp-list
            '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf"
              "\\*ac-mode-"
                 "\\*reg group-leader\\*"
                 "\\*derl emacs@jf\\.org\\*"
                 "\\*trace emacs"
                 ;; echo area
                 "\\*Completions\\*"
                 "\\*zsh\\*"
                 "\\*bash\*"
                 "\\*vc\*"
                 "\\*compilation\\*"
                 "\\*Compile-Log\\*"
                 "\\*Ibuffer\\*"
                 "\\*Help\\*"
                 ;; "\\*Messages\\*"
                 ))
     ;; key for buffer
     (define-key  helm-buffer-map (kbd "C-5") 'helm-buffer-run-query-replace)
     (define-key  helm-buffer-map  (kbd "C-s") 'helm-next-line);;mark M-m
     ;; (define-key helm-buffer-map (kbd "C-s") 'helm-buffer-run-zgrep)
     (define-key helm-buffer-map (kbd "C-=") 'helm-buffer-run-ediff)
     ;; (define-key helm-buffer-map (kbd "H-m") 'helm-buffer-run-ediff-merge)
     (define-key helm-buffer-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-buffer-map (kbd "C-w") nil)
     (define-key helm-buffer-map  (kbd "M-m") 'helm-toggle-visible-mark);;mark M-m
     (setq helm-ff-skip-boring-files t)
     ))

(eval-after-load 'helm-files
  '(progn
     (setq  helm-for-files-preferred-list
            '(
              helm-source-buffers-list
               helm-source-recentf
               ;; helm-source-bookmarks
               ;; helm-source-file-cache
               helm-source-files-in-current-dir
               helm-source-files-in-all-dired
               ;; helm-source-locate
               helm-source-joseph-filelist
               helm-source-ls-git
               ;; helm-source-gtags-files
               ;; helm-source-locate
               ))
            (setq helm-ff-newfile-prompt-p nil)
            (setq helm-ff-transformer-show-only-basename t) ;只显示文件名，不显示路径 Ctrl-]可临时切换
            (setq helm-ff-auto-update-initial-value t)
            (define-key helm-find-files-map  (kbd "C-,") 'minibuffer-up-parent-dir)
            (define-key helm-find-files-map  (kbd "C-s") nil)
            (define-key helm-find-files-map  (kbd "C-s") 'helm-next-line)
            (define-key helm-read-file-map (kbd "C-,") 'minibuffer-up-parent-dir)
            (define-key helm-read-file-map (kbd "C-s") 'helm-next-line)

     (define-key helm-find-files-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-find-files-map (kbd "C-w") nil)
     (define-key helm-read-file-map (kbd "M-y") 'helm-yank-text-at-point)
     (define-key helm-read-file-map (kbd "C-w") nil)
     )
)
(eval-after-load 'helm-files
  '(progn
     (require 'helm-ls-git)
     (define-key ctl-w-map (kbd "C-o") 'helm-ls-git-ls)))

(eval-after-load 'helm-utils  '(setq  helm-su-or-sudo "sudo"))
(eval-after-load 'helm-locate
  '(progn
     (define-key helm-generic-files-map  (kbd "C-s") 'helm-next-line)
     (setq helm-locate-command
         (case system-type
           ('gnu/linux "locate -i -r %s")
           ('berkeley-unix "locate -i %s")
           ('windows-nt "es -r %s")      ;remove -i case senetitave 忽略 大小写
           (t "locate %s")))
     ))
(eval-after-load 'helm-bookmark
  '(progn
     (setq helm-bookmark-show-location t)  ;列出bookmark时 显示文件路径
     (setq bookmark-sort-flag nil)           ;不排序，先来后到
     (setq bookmark-bmenu-file-column 100)   ;bookname 名字的长度，for trunc

     (helm-add-action-to-source-if "Delete All Bookmarks."
                                   'helm-delete-all-bookmarks
                                   helm-source-pp-bookmarks
                                   '(lambda(c) t))

     (defun helm-delete-all-bookmarks(_c)
       (dolist(name (bookmark-all-names))
         (bookmark-delete name t)))))


(eval-after-load 'helm-config
  '(progn
     (set-keymap-parent ctl-w-map helm-command-map)
     ;; (define-key ctl-x-map (kbd "c") 'helm-buffers-list)
;;     (setq helm-command-map )
     ;; (define-key ctl-w-map (kbd "c") 'helm-buffers-list)
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
     ;; (define-key ctl-w-map (kbd "H-i") 'helm-imenu)

     (define-key ctl-w-map (kbd "f") 'helm-find-files)
     (define-key ctl-w-map (kbd "C-f") 'helm-for-files)
     (define-key ctl-w-map (kbd "C") 'helm-colors)

     (define-key ctl-w-map (kbd "C-w") 'helm-write-file)
     ;; (define-key ctl-w-map (kbd "<SPC>") 'helm-execute-helm-command)
     (define-key ctl-w-map (kbd "l") 'helm-locate)
     (define-key ctl-w-map (kbd "C-p") 'helm-list-emacs-process)

     (define-key ctl-w-map "p" 'helm-list-emacs-process)
     (define-key global-map (kbd "M-*") 'helm-pp-bookmarks)


     ;; lisp complete.
     (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
     (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)

     (helm-mode)
     (add-to-list 'helm-completing-read-handlers-alist '(ibuffer-find-file . ido))
     (add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido))
     (add-to-list 'helm-completing-read-handlers-alist '(find-file . ido));;对于lusty 不使用helm engine
     ;; (require 'lusty-explorer)
     ;; (define-key global-map [remap find-file] 'helm-find-files)

     ;; (global-set-key [remap find-file] 'lusty-file-explorer) ;C-xC-f
     ;; (add-hook 'lusty-setup-hook 'my-lusty-hook)
     ))





(require 'helm-config)
(eval-after-load 'helm-files '(require 'joseph-helm-filelist))

(provide 'joseph-helm)
