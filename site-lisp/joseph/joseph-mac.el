(setq exec-path (delete-dups  (cons "/usr/local/bin" exec-path)))
(setenv "PATH" (concat  "/usr/local/bin:" (getenv "PATH") ))

;; (setq-default server-auth-dir (expand-file-name "~/.emacs.d/cache/"))
;; (setq-default server-socket-dir  (expand-file-name "~/.emacs.d/cache/"))
;; (setq-default server-name "emacs-server-file")
;; (require 'server)
;;进行server认证的目录,

;; (shell-command (concat "chmod 700 "  (expand-file-name "~/.emacs.d/cache/")))
;;上面两个值连起来即为emacsclient --server-file后面跟的参数
;;为方便计只需要设置EMACS_SERVER_FILE,值为emacs-server-file的绝对路径名称
;;如我的"d:\.emacs.d\cache\emacs-server-file"
;;注意在windows 上我把环境变量HOME设成了D:\,所以"~"就代表"D:\"了.
(when (not (server-running-p)) (server-start))

;; 允许emacs 直接编辑 OSX下的 .plist文件
;; Allow editing of binary .plist files.
(add-to-list 'jka-compr-compression-info-list
             ["\\.plist$"
              "converting text XML to binary plist"
              "plutil"
              ("-convert" "binary1" "-o" "-" "-")
              "converting binary plist to text XML"
              "plutil"
              ("-convert" "xml1" "-o" "-" "-")
              nil nil "bplist"])

;; # mac 上 emacs 直接编辑二进制applescript
(add-to-list 'jka-compr-compression-info-list
             `["\\.scpt\\'"
               "converting text applescript to binary applescprit " ,(expand-file-name "applescript-helper.sh" "~/.emacs.d/bin/") nil
               "converting binary applescript to text applescprit " ,(expand-file-name "applescript-helper.sh" "~/.emacs.d/bin/") ("-d")
               nil t "FasdUAS"])


;;It is necessary to perform an update!
(jka-compr-update)

(global-set-key (kbd "s-m") 'toggle-frame-maximized) ;cmd-m
;; f11 (toggle-frame-fullscreen) default


(provide 'joseph-mac)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-mac.el ends here
