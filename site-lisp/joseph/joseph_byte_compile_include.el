 ;; -*-no-byte-compile: t; coding:utf-8  -*-
(add-to-list 'load-path "~/.emacs.d/site-lisp/joseph-file-util/")
(require 'joseph-file-util)
(defvar user-load-path (all-subdir-under-dir-recursively
                        (expand-file-name "~/.emacs.d/site-lisp/") nil nil
                        "\\.git\\|\\.svn\\|RCS\\|rcs\\|CVS\\|cvs\\|doc\\|syntax\\|templates\\|tests\\|icons\\|lib\\|testing\\|etc\\|script" t))
(dolist (path user-load-path) (add-to-list 'load-path path))

(provide 'joseph_byte_compile_include)
