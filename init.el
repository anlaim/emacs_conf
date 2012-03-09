;; -*-no-byte-compile: t; -*-
;; Last Updated: Joseph 2012-03-10 01:40:55 星期六
;;                                            ╭∩╮⎝▓▓⎠╭∩╮
;;                                           ▇█▓▒░◕~◕░▒▓█▇
;; ╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗
;; ╭(╯3╰)╮

(defvar joseph-origin-load-path load-path)
(load (expand-file-name "~/.emacs.d/site-lisp/joseph-file-util/joseph-file-util"))
(defvar user-load-path (all-subdir-under-dir-recursively
                        (expand-file-name "~/.emacs.d/site-lisp/") nil nil
                        "\\.git\\|\\.svn\\|RCS\\|rcs\\|CVS\\|cvs\\|doc\\|syntax\\|templates\\|tests\\|icons\\|lib\\|testing\\|etc\\|script" t))
(dolist (path user-load-path) (add-to-list 'load-path path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

(setq exec-path (delete-dups  (cons (expand-file-name "~/.emacs.d/bin/") exec-path)))
(setenv "PATH" (concat (get-system-file-path (expand-file-name  "~/.emacs.d/bin/")) ";" (getenv "PATH") ))

(require 'joseph_init)

(setq custom-file (expand-file-name "~/.emacs.d/custom-file.el"))
(require 'custom-file)
(require 'custom-mode-line)
