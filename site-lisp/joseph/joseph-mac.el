(setq exec-path (delete-dups  (cons "/usr/local/bin" exec-path)))
(setenv "PATH" (concat  "/usr/local/bin:" (getenv "PATH") ))


(setenv "LANG" "zh_CN.UTF-8")
;; (setq-default server-auth-dir (expand-file-name "~/.emacs.d/cache/"))
;; (setq-default server-socket-dir  (expand-file-name "~/.emacs.d/cache/"))
;; (setq-default server-name "emacs-server-file")
;; (require 'server)
;; (when (not (server-running-p)) (server-start))

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
()
(global-set-key (kbd "s-m") 'toggle-frame-maximized) ;cmd-m
(global-set-key  (kbd "S-a") 'evil-mark-whole-buffer) ;mac Cmd+a

;; f11 (toggle-frame-fullscreen) default


(provide 'joseph-mac)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-mac.el ends here
