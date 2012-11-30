;;; -*- coding:utf-8 -*-
;;; openwith ,外部程序

;;直接用正常的方式打开相应的文件,openwith会自动做处理
;;`C-xC-f'即可
(require'w32-shell-execute)
(require 'w32-browser)
(require 'joseph-util)
(require 'openwith)
(openwith-mode t)

;;windows 上使用w32-shell-execute 调用系统的相应程序打开
(setq openwith-associations
      '(("\\.pdf$" "open" (file))
        ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) )
        ;;       ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "open" (file))
        ("\\.bmp$" "open" (file))
        ("\\.mp3$" "mpg123" (file))
        ("\\.wav" "open" (file))
        ("\\.CHM$\\|\\.chm$" "open"  (file) )
        )
      )


(defun open-with-C-RET-on-w32()
  "in dired mode ,`C-RET' open file with ..."
  (interactive)
  (let ((openwith-associations
         '(("\\.pdf$" "open" (file))
           ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) )
           ;;       ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "open" (file))
           ("\\.bmp$" "open" (file))
           ("\\.mp3$" "mpg123" (file))
           ("\\.wav" "open" (file))
           ("\\.CHM$\\|\\.chm$" "open"  (file) )
           ("\\.HTML?$\\|\\.html?$" "open"  (file) )
           )))
    (if (equal major-mode 'dired-mode)
        (w32-shell-execute "open"  (expand-file-name (dired-get-filename)))
      (w32-shell-execute "open"  (expand-file-name  (or (buffer-file-name) "~"))))))

(define-key-lazy  global-map "\C-\M-j" 'open-with-C-RET-on-w32)
;; (define-key-lazy  dired-mode-map "\C-\M-j" 'open-with-C-RET-on-w32)
;; (define-key-lazy  nxml-mode-map "\C-\M-j" 'open-with-C-RET-on-w32)


;;C-M-<RET> 用资源管理器打开当前文件所处目录
(defun explorer-open()
  "用windows 上的explorer.exe打开此文件夹."
  (interactive)
  (if (equal major-mode 'dired-mode)
      (w32explore (expand-file-name (dired-get-filename)))
    (w32explore (expand-file-name  (or (buffer-file-name) "~")))))

(define-key-lazy dired-mode-map (quote [C-M-return]) 'explorer-open)
(global-set-key (quote [C-M-return]) 'explorer-open)

  (defun w32explore (file)
    "Open Windows Explorer to FILE (a file or a folder)."
    (interactive "fFile: ")
    (let ((w32file (convert-standard-filename file)))
      (if (file-directory-p w32file)
          (w32-shell-execute "explore" w32file "/e,/select,")
        (w32-shell-execute "open" "explorer" (concat "/e,/select," w32file)))))


(provide 'joseph-openwith-w32)
;;; joseph-open-w32.el ends here
