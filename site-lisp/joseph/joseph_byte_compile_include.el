 ;; -*-no-byte-compile: t; coding:utf-8  -*-
;;when byte-compile-a file eval this line
(defun joseph-add-subdirs-to-load-path (dir)
  "把DIR的所有子目录都加到`load-path'里面"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))

(defvar joseph_root_install_path (expand-file-name "~/.emacs.d/"))
(defvar joseph_site-lisp_install_path (expand-file-name (concat joseph_root_install_path "site-lisp/")))
(defvar joseph_joseph_install_path (expand-file-name (concat joseph_site-lisp_install_path "joseph/")))
(defvar joseph-cedet-path (concat joseph_site-lisp_install_path "cedet-1.0") "Path of `cedet'")

(add-to-list 'load-path  joseph_joseph_install_path);;
;;(require 'joseph-util)
;;然后调用joseph-util.el中的my-add-subdirs-to-load-path 函数将.emacs.d/site-lisp/目录
;;下所有的目录递归地加入到load-path
(joseph-add-subdirs-to-load-path joseph_site-lisp_install_path)
;(add-to-list 'load-path (expand-file-name "./"))
;; find . -name "*.el"  -exec emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile {} \;
;;emacs -batch -f batch-byte-compile  filename
;; emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile *.el


(provide 'joseph_byte_compile_include)
