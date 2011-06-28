;;; -*- coding:utf-8 -*-
;;{{{  openwith ,外部程序

;;直接用正常的方式打开相应的文件,openwith会自动做处理
;;`C-xC-f'即可
(when (eq system-type 'windows-nt)
  (require'w32-shell-execute)
  )
(require 'openwith)
(openwith-mode t)
(when (eq system-type 'gnu/linux)
  (setq openwith-associations
        '(("\\.pdf$" "acroread" (file)) ("\\.mp3$" "mplayer" (file) )
          ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "mplayer" (file) )
;;          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "gpicview" (file))
          ("\\.CHM$\\|\\.chm$" "chmsee"  (file) )
          )
        )
  )
(when (eq system-type 'windows-nt)
  ;;windows 上使用w32-shell-execute 调用系统的相应程序打开
  (setq openwith-associations
        '(("\\.pdf$" "open" (file)) ("\\.mp3$" "open" (file) )
          ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) )
          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "open" (file))
          ("\\.CHM$\\|\\.chm$" "open"  (file) )
          )
        )
  )

(defun open-with-C-RET-on-linux()
  "in dired mode ,`C-RET' open file with ..."
  (interactive)
  (let ((file-name (dired-get-filename))
        (openwith-associations
        '(("\\.pdf$" "acroread" (file)) ("\\.mp3$" "mplayer" (file) )
          ("\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "mplayer" (file) )
          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "gpicview" (file))
          ("\\.CHM$\\|\\.chm$" "chmsee"  (file) ))))
    (if (string-match "\\.html?$" file-name)
          (if (> (string-to-number (shell-command-to-string "pgrep firefox | wc -l")) 0)
              (progn
                (start-process-shell-command "firefox" nil (format "echo ' show_matched_client({class=\"Firefox\" ,instance=\"Navigator\"},\"www\",\"/usr/bin/firefox %s  \" ,nil)' |awesome-client " file-name))
                (start-process "firefox-file" nil "firefox" file-name))
            (start-process-shell-command "firefox" nil (format "echo ' show_matched_client({class=\"Firefox\" ,instance=\"Navigator\"},\"www\",\"/usr/bin/firefox %s  \" ,nil)' |awesome-client " file-name))
            )
      (dired-find-file)
      )
    )
  )
(when (equal system-type 'gnu/linux)
  (eval-after-load 'dired
  '(define-key dired-mode-map [(control return)] 'open-with-C-RET-on-linux)))

;;}}}
;;{{{ 使用外部 文件管理器 打开选中文件
(when (eq system-type 'windows-nt)
  ;;on windows
  ;;  C-RET  用系统默认程序打开选中文件
  ;; M-RET  open Windows Explorer
  ;; ^ 我改成了u ,可以列出根盘符
  ;;
  (require 'w32-browser)
  ;; (define-key diredp-w32-drives-mode-map "n" 'next-line)
  ;; (define-key diredp-w32-drives-mode-map "p" 'previous-line)

  ;;M-<RET> 用资源管理器打开当前文件所处目录
  (defun explorer-open ()
    (interactive)
    (if (equal major-mode 'dired-mode)
        (w32explore (expand-file-name (dired-get-filename)))
      (w32explore (expand-file-name (buffer-file-name)))
       )
    )
  (global-set-key "\M-\C-m" 'explorer-open)
;;  (lambda () (interactive ) (w32explore (expand-file-name default-directory)))
  )

;;`M-RET' 用pcmanfm文件管理器打开当前目录
(when (eq system-type 'gnu/linux)
  (defun open-directory-with-pcmanfm()
    (interactive)
    (start-process "pcmanfm"  nil "pcmanfm" (expand-file-name  default-directory)))
  (eval-after-load 'dired
  '(define-key dired-mode-map "\M-\C-m" 'open-directory-with-pcmanfm))
  (global-set-key "\M-\C-m" 'open-directory-with-pcmanfm)
  )
;;}}}

(provide 'joseph-openwith)

