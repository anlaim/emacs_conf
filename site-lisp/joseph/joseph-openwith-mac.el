;;; -*- coding:utf-8 -*-
;;{{{  openwith ,外部程序

;;直接用正常的方式打开相应的文件,openwith会自动做处理
(require 'openwith)
(openwith-mode t)
(setq openwith-associations
        '(("\\.pdf$" "open" (file))
          ("\\.mp3$" "open" (file) )
          ("\\.vob\\|\\.VOB\\|\\.wmv\\|\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) )
          ("\\.wav" "open" (file) )
          ;;          ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "gpicview" (file))
          ("\\.CHM$\\|\\.chm$" "open"  (file) )
          ("\\.docx?$" "open" ( "-a" "Pages" file))
          ("\\.xlsx$" "open"  (file) )
          ))


(defun open-with-2-on-mac()
  "in dired mode ,`C-RET' open file with ..."
  (interactive)
  (let ((file-name (if (equal major-mode 'dired-mode )  (dired-get-filename) (buffer-file-name)))
        (openwith-associations
         '(("\\.pdf$" "open" (file))
           ("\\.mp3$" "open" (file) )
           ("\\.vob\\|\\.VOB\\|\\.wmv\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp4\\|\\.mkv$\\|\\.rmvb$" "open" (file) )
           ("\\.jpe?g$\\|\\.png$\\|\\.bmp\\|\\.gif$" "open" (file))
           ("\\.wav" "open" (file))
           ("\\.html?$" "open" (file))
           ("\\.xlsx?$" "open" ( "-a" "Microsoft Excel.app" file))
           ("\\.docx?$" "open" ( "-a" "Microsoft Word.app" file))
           )))
    (if (equal major-mode 'dired-mode)
        (dired-find-file)
      (find-file file-name))
    )
  )

;; 第二种打开方式
(define-key-lazy  global-map "\C-\M-j" 'open-with-2-on-mac)
(define-key-lazy  dired-mode-map "\C-\M-j" 'open-with-2-on-mac)

(defun open-directory-mac-finder()
  (interactive)
  (start-process "finder"  nil "open" (expand-file-name  default-directory)))
;;; linux `C-M-RET' 用pcmanfm文件管理器打开当前目录
(define-key-lazy dired-mode-map (quote [C-M-return]) 'open-directory-mac-finder)
(global-set-key (quote [C-M-return]) (quote open-directory-mac-finder))

(evil-leader/set-key "<RET><RET>" 'open-directory-mac-finder) ;
(provide 'joseph-openwith-mac)
