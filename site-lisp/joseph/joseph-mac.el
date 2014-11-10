(setq exec-path (delete-dups  (cons "/usr/local/bin" exec-path)))
(setenv "PATH" (concat  "/usr/local/bin:" (getenv "PATH") ))


(setenv "LANG" "zh_CN.UTF-8")

;; (setq-default server-auth-dir (expand-file-name "~/.emacs.d/cache/"))
;; (setq-default server-socket-dir (expand-file-name "~/.emacs.d/cache/"))
;; (setq-default server-name "emacs-server-file")
;; (require 'server)
;; (when (not (server-running-p)) (server-start))


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
(global-set-key (kbd "s-m") 'toggle-frame-maximized) ;cmd-m
(global-set-key  (kbd "S-a") 'evil-mark-whole-buffer) ;mac Cmd+a

;; f11 (toggle-frame-fullscreen) default
(setq ns-pop-up-frames nil)

;; 如果$PATH里有， 而exec-path里无的， 将其加入
(dolist ( path (split-string (getenv "PATH") ":" t "[ \t/]"))
  (add-to-list 'exec-path path))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil)) ; use pipe
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
 (defun copy-from-osx ()
"Copies the current clipboard content using the `pbcopy` command"
  (shell-command-to-string "pbpaste"))
  
(setq interprogram-paste-function 'copy-from-osx)
(setq interprogram-cut-function 'paste-to-osx)






(provide 'joseph-mac)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-mac.el ends here
