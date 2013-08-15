;;; -*- coding:utf-8 -*-
;;{{{  openwith ,外部程序

;;直接用正常的方式打开相应的文件,openwith会自动做处理
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph-util)
    (require 'dired))

(require 'openwith)
(openwith-mode t)
(when (eq system-type 'darwin)
  (setq openwith-associations
        '(("\\.pdf$" "acroread" (file)) ("\\.mp3$" "mpg123" (file) )
          ("\\.vob\\|\\.VOB\\|\\.wmv\\|\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "mplayer" (file) )
          ("\\.wav" "aplay" (file) )
          ;;          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "gpicview" (file))
          ("\\.CHM$\\|\\.chm$" "chmsee"  (file) )
          )))

(defun browse-url-of-buffer-with-firefox ()
  "Same as `browse-url-of-buffer' but using Firefox.
You need Firefox's path in the path environment variable within emacs.
⁖
 (setenv \"PATH\" (concat \"C:/Program Files (x86)/Mozilla Firefox/\" \";\" (getenv \"PATH\") ) )
On Mac OS X, you don't need to. This command makes this shell call:
 「open -a Firefox.app http://example.com/」"
  (interactive)
  (cond
   ;; ((string-equal system-type "windows-nt") ; Windows
   ;;  (shell-command (concat "firefox file://"  (if (equal major-mode 'dired-mode )  (dired-get-filename) (buffer-file-name))))
   ;;  )
   ((string-equal system-type "gnu/linux")
    (shell-command (concat "firefox file://" (if (equal major-mode 'dired-mode )  (dired-get-filename) (buffer-file-name))))
    )
   ((string-equal system-type "darwin") ; Mac
    (shell-command (concat "open -a Firefox.app file://" (if (equal major-mode 'dired-mode )  (dired-get-filename) (buffer-file-name))))
    ) ))

;; 第二种打开方式
(define-key-lazy  global-map "\C-\M-j" 'browse-url-of-buffer-with-firefox)
(define-key-lazy  dired-mode-map "\C-\M-j" 'browse-url-of-buffer-with-firefox)

;;; linux `C-M-RET' 用pcmanfm文件管理器打开当前目录
;; (define-key-lazy dired-mode-map (quote [C-M-return]) 'open-directory-with-pcmanfm)
;; (global-set-key (quote [C-M-return]) (quote open-directory-with-pcmanfm))

(provide 'joseph-openwith-mac)
