;; -*-no-byte-compile: t; -*-
;; Last Updated: 纪秀峰 2013-01-09 11:44:24 星期三
;;                                            ╭∩╮⎝▓▓⎠╭∩╮
;;                                           ▇█▓▒░◕~◕░▒▓█▇
;; ╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗
;; ╭(╯3╰)╮

(defvar joseph-origin-load-path load-path)
(load (expand-file-name "~/.emacs.d/site-lisp/joseph-file-util/joseph-file-util"))
(defvar user-load-path (all-subdir-under-dir-recursively
                        (expand-file-name "~/.emacs.d/site-lisp/") nil nil
                        "\\.git\\|\\.svn\\|RCS\\|rcs\\|CVS\\|cvs\\|doc\\|syntax\\|templates\\|tests\\|icons\\|testing\\|etc\\|script$" t))
(dolist (path user-load-path) (add-to-list 'load-path path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))


(when (equal system-type 'windows-nt)
  (setq exec-path (delete-dups  (cons (expand-file-name "~/.emacs.d/bin/") exec-path)))
  (setenv "PATH" (concat (get-system-file-path (expand-file-name  "~/.emacs.d/bin/")) ";" (getenv "PATH") )))
;; 调试工具 , 打印出require 的调用轨迹
  ;; (defadvice require (around require-around)
  ;;   "Leave a trace of packages being loaded."
  ;;   (let* ((feature (ad-get-arg 0))
  ;;          (require-depth (or (and (boundp 'require-depth) require-depth)
  ;;                             0))
  ;;          (prefix (concat (make-string (* 2 require-depth) ? ) "+-> ")))
  ;;     (cond ((featurep feature)
  ;;            (message "(info) %sRequiring `%s'... already loaded"
  ;;                     prefix feature)
  ;;            (setq ad-return-value feature))
  ;;           (t
  ;;            (let ((lvn/time-start))
  ;;              (message "(info) %sRequiring `%s'..." prefix feature)
  ;;              (setq lvn/time-start (float-time))
  ;;              (let ((require-depth (1+ require-depth)))
  ;;                ad-do-it)
  ;;              (message "(info) %sRequiring `%s'... %s (loaded in %.2f s)"
  ;;                       prefix feature
  ;;                       (locate-library (symbol-name feature))
  ;;                       (- (float-time) lvn/time-start)))))))
  ;; (ad-activate 'require)


(require 'joseph_init)
(require 'joseph-tmp nil t)
(setq custom-file (expand-file-name "~/.emacs.d/custom-file.el"))
(require 'custom-file)
;; (require 'custom-mode-line)
