;;; -*- coding:utf-8 -*-
(setq-default org-directory "~/org")
(eval-when-compile (require 'org)
                   (require 'joseph_keybinding))

(setq-default anything-c-adaptive-history-file "~/.emacs.d/cache/anything-c-adaptive-history")

(autoload 'descbinds-anything "descbinds-anything")
(fset 'describe-bindings 'descbinds-anything)

(eval-after-load 'anything
  '(progn
     (setq anything-samewindow nil)
     (setq anything-debug nil)
     (setq debug-on-error nil )
     (setq anything-idle-delay 0.3)
     (setq anything-input-idle-delay 0)
     ;;在*anything-**buffer里面的键绑定
     (define-key anything-map (kbd "C-2") nil)
     (define-key anything-map (kbd "C-2") 'anything-toggle-visible-mark);;mark
     (define-key anything-map  [?\H-m] 'anything-toggle-visible-mark);;mark
     (define-key anything-map (kbd "C-r") 'anything-execute-persistent-action);;默认是C-z
     (define-key anything-map (kbd "C-j") 'anything-select-3rd-action)        ;C-j 执行第3个命令，默认C-e 执行第2个
     ;; (define-key anything-map (kbd "C-f") 'anything-execute-persistent-action)

     (define-key anything-map (kbd "C-.") 'anything-previous-source)
     (define-key anything-map (kbd "C-o") 'anything-next-source)
     ;; (define-key anything-map (kbd "C-,") 'anything-find-files-down-one-level)
     ;;删除当前选项
     (define-key anything-map (kbd "C-d") 'anything-delete-current-selection)
     ))


(eval-after-load 'anything-config
  '(progn
     (setq anything-candidate-number-limit 100)
     (setq  anything-su-or-sudo "sudo")
     (anything-dired-bindings 1);;
     (setq  anything-c-boring-buffer-regexp
            (rx (or
                 (group bos  " ")
                 ;; anything-buffer
                 "*ac-mode-"
                 "*anything"
                 ;; echo area
                 " *Echo Area" " *Minibuf"
                 " *"
                 "*Completions*"
                 "*Ibuffer*"
                 )))
     (setq anything-c-locate-command
           (case system-type
             ('gnu/linux "locate -i -r %s")
             ('berkeley-unix "locate -i %s")
             ('windows-nt "es -r %s")      ;remove -i case senetitave 忽略 大小写
             (t "locate %s"))
           )

     (set-keymap-parent ctl-w-map anything-command-map)
     (setq anything-for-files-prefered-list
           '(anything-c-source-ffap-line
             anything-c-source-ffap-guesser
             anything-c-source-buffers-list
             anything-c-source-recentf
             anything-c-source-joseph-filelist
             ;; anything-c-source-file-cache
             anything-c-source-files-in-current-dir+
             anything-c-source-locate
             anything-c-source-create
             ;; anything-c-source-bookmarks
             ))
     (define-key ctl-x-map (kbd "c") 'anything-buffers-list)
     (define-key ctl-w-map (kbd "c") 'anything-buffers-list)
     (define-key global-map (kbd "M-y") 'anything-show-kill-ring)
     (define-key anything-command-map (kbd "M-y") 'anything-all-mark-rings)
     ;;在firefox里 about:config修改下面的值为true后就可以在emacs里打开firefox书签里的内容
     ;; user_pref("browser.bookmarks.autoExportHTML", true);
     (define-key ctl-w-map (kbd "b") 'anything-firefox-bookmarks)
     (define-key ctl-w-map (kbd "x") 'anything-M-x)
     (global-set-key "\M-x" 'anything-M-x)
     ;;do grep in selected file or dir
     (define-key ctl-w-map (kbd "g") 'anything-do-grep)
     ;;list matched regexp in current buffer
     (define-key ctl-w-map (kbd "C-s") 'anything-occur)
     ;;do query-replace
     (define-key ctl-w-map (kbd "r") 'anything-regexp)

     (define-key ctl-w-map (kbd "f") 'anything-find-files)
     (define-key ctl-w-map (kbd "C-f") 'anything-for-files)
     (define-key ctl-w-map (kbd "C-c") 'anything-buffers-list)
     (define-key ctl-w-map (kbd "C") 'anything-colors)

     (define-key ctl-w-map (kbd "C-w") 'anything-write-file)
     (define-key ctl-w-map (kbd "<SPC>") 'anything-execute-anything-command)
     (define-key ctl-w-map (kbd "l") 'anything-locate)
     (define-key ctl-w-map (kbd "C-p") 'anything-list-emacs-process)

     (define-key ctl-w-map "p" 'anything-list-emacs-process)
     ;; key for buffer
     (define-key  anything-c-buffer-map (kbd "C-5") 'anything-buffer-run-query-replace)
     (define-key anything-c-buffer-map (kbd "C-s") 'anything-buffer-run-zgrep)
     (define-key anything-c-buffer-map (kbd "C-=") 'anything-buffer-run-ediff)
     ;; (define-key anything-c-buffer-map (kbd "H-m") 'anything-buffer-run-ediff-merge)

     (define-key anything-find-files-map (kbd "C-,") 'minibuffer-up-parent-dir)
     (define-key anything-c-read-file-map (kbd "C-,") 'minibuffer-up-parent-dir)

     (define-key anything-map (kbd "C-y") 'anything-yank-text-at-point)
     (define-key anything-map (kbd "C-w") nil)
     (define-key anything-c-buffer-map (kbd "C-y") 'anything-yank-text-at-point)
     (define-key anything-c-buffer-map (kbd "C-w") nil)
     (define-key anything-find-files-map (kbd "C-y") 'anything-yank-text-at-point)
     (define-key anything-find-files-map (kbd "C-w") nil)
     (define-key anything-c-read-file-map (kbd "C-y") 'anything-yank-text-at-point)
     (define-key anything-c-read-file-map (kbd "C-w") nil)

     (anything-completion-mode)
     ;; (add-to-list 'anything-completing-read-handlers-alist '(lusty-file-explorer . nil));;对于lusty 不使用anything engine
     ;; (require 'lusty-explorer)
     ;; (global-set-key [remap find-file] 'lusty-file-explorer) ;C-xC-f
     ;; (add-hook 'lusty-setup-hook 'my-lusty-hook)

     (defun anything-man-woman (&optional arg)
       "Preconfigured `anything' for Man and Woman pages."
       (interactive "P")
       (anything 'anything-c-source-man-pages (if arg ""  (thing-at-point 'symbol)) "Man Page:" nil ))

     ))

(require 'anything-config)
(require 'joseph-anything-filelist)

(provide 'joseph-anything)
