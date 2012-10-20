;; -*-no-byte-compile: t; -*-
;; Last Updated: 纪秀峰 2012-10-20 10:43:38 星期六
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


(require 'joseph_init)

(setq custom-file (expand-file-name "~/.emacs.d/custom-file.el"))
(require 'custom-file)
;; (require 'custom-mode-line)
