;; -*-no-byte-compile: t; -*-
;; Last Updated: Joseph 2011-11-14 12:53:08 星期一
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
(setenv "PATH" (concat (getenv "PATH") ";" (get-system-file-path "~/.emacs.d/bin/")))

(require 'joseph_init)

(setq custom-file (expand-file-name "~/.emacs.d/custom-file.el"))
(require 'custom-file)
