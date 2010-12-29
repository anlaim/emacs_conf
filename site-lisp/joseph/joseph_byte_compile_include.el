 ;; -*-no-byte-compile: t; -*-
;;when byte-compile-a file eval this line
(eval-when-compile
 (require 'cl)
 (defvar joseph_root_install_path (expand-file-name "~/.emacs.d/"))
 (add-to-list 'load-path  joseph_root_install_path);; 加入配置文件的根路径
 (defvar joseph_site-lisp_install_path (expand-file-name (concat joseph_root_install_path "site-lisp/")))
 (add-to-list 'load-path joseph_site-lisp_install_path);; 
 (defvar joseph_joseph_install_path (expand-file-name (concat joseph_site-lisp_install_path "joseph/")))
 (add-to-list 'load-path  joseph_joseph_install_path);; 
  )
(cd joseph_root_install_path)
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path (expand-file-name "./"))
(print load-path)
(provide 'joseph_byte_compile_include)