;;; -*- coding:utf-8 -*-
(setq-default org-directory "~/org")
(eval-when-compile (require 'org)
                   (require 'joseph_keybinding))

(setq-default anything-c-adaptive-history-file "~/.emacs.d/cache/anything-c-adaptive-history")

(autoload 'descbinds-anything "descbinds-anything")
(fset 'describe-bindings 'descbinds-anything)

(eval-after-load 'anything
  '(progn
     (setq anything-samewindow t)
     (setq anything-idle-delay 0.3)
     (setq anything-input-idle-delay 0)
     ;;在*anything-**buffer里面的键绑定
     (define-key anything-map (kbd "C-r") 'anything-previous-page)
     (define-key anything-map (kbd "C-j") 'anything-execute-persistent-action);;默认是C-z
     ;; (define-key anything-map (kbd "C-f") 'anything-execute-persistent-action)

     (define-key anything-map (kbd "C-.") 'anything-previous-source)
     (define-key anything-map (kbd "C-o") 'anything-next-source)
     (define-key anything-map (kbd "C-,") 'anything-find-files-down-one-level)
     ;;删除当前选项
     (define-key anything-map (kbd "C-d") 'anything-delete-current-selection)
     ))



(eval-after-load 'anything-complete
  '(progn
     (substitute-key-definition 'execute-extended-command 'anything-execute-extended-command global-map)

     (defun anything-execute-extended-command ()
       "Replacement of `execute-extended-command'."
       (interactive)
       (setq alcs-this-command this-command)
       (let* ((cmd (anything
                    (if (and anything-execute-extended-command-use-kyr
                             (require 'anything-kyr-config nil t))
                        (cons anything-c-source-kyr
                              anything-execute-extended-command-sources)
                      anything-execute-extended-command-sources))))
         (when  (and cmd (commandp (intern-soft cmd)))
           (setq extended-command-history (cons cmd (delete cmd extended-command-history)))
           (setq cmd (intern cmd))
           (if (or (stringp (symbol-function cmd))
                   (vectorp (symbol-function cmd)))
               (execute-kbd-macro (symbol-function cmd))
             (setq this-command cmd)
             (call-interactively cmd))  )
         ))
     )
  )


(eval-after-load 'anything-config
  '(progn
     (setq anything-candidate-number-limit 100)
     (setq  anything-su-or-sudo "sudo")
     (anything-dired-bindings 1);;
     (setq  anything-c-boring-buffer-regexp
            (rx (or
                 (group bos  " ")
                 ;; anything-buffer
                 "*anything"
                 ;; echo area
                 " *Echo Area" " *Minibuf"
                 " *"
                 "*Completions*"
                 "*Ibuffer*"
                 )))

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
     (define-key global-map (kbd "M-y") 'anything-show-kill-ring)
     ;;在firefox里 about:config修改下面的值为true后就可以在emacs里打开firefox书签里的内容
     ;; user_pref("browser.bookmarks.autoExportHTML", true);
     (define-key ctl-w-map (kbd "b") 'anything-firefox-bookmarks)
     (define-key ctl-w-map (kbd "x") 'anything-M-x)
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
     (define-key  anything-c-buffer-map (kbd "C-=") 'anything-buffer-run-ediff)
     (define-key anything-c-buffer-map (kbd "H-m") 'anything-buffer-run-ediff-merge)



     (setq anything-completing-read-handlers-alist
           '((describe-function . anything-completing-read-symbols)
             (describe-variable . anything-completing-read-symbols)
             (debug-on-entry . anything-completing-read-symbols)
              ;; (find-file . ido-find-file)
             (ffap-alternate-file . nil))
           )
     (anything-completion-mode)
     (defalias 'completing-read 'anything-completing-read-default)

     (defun anything-man-woman (&optional arg)
       "Preconfigured `anything' for Man and Woman pages."
       (interactive "P")
       (anything 'anything-c-source-man-pages (if arg ""  (thing-at-point 'symbol)) "Man Page:" nil ))

     ))

(require 'anything-startup)
(require 'joseph-anything-filelist)

(provide 'joseph-anything)
