 ;; -*-no-byte-compile: t; -*-
;;when byte-compile-a file eval this line
 (defvar joseph_root_install_path (expand-file-name "~/.emacs.d/"))
 (add-to-list 'load-path  joseph_root_install_path);; 加入配置文件的根路径
 (defvar joseph_site-lisp_install_path (expand-file-name (concat joseph_root_install_path "site-lisp/")))
 (add-to-list 'load-path joseph_site-lisp_install_path);; 
 (defvar joseph_joseph_install_path (expand-file-name (concat joseph_site-lisp_install_path "joseph/")))
 (add-to-list 'load-path  joseph_joseph_install_path);;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "ajc-java-complete"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "anything-config"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "anything-config/extensions/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "anything-config/developer-tools/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "auto-complete-1.3/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "ca2/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "hide/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "joseph/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "yasnippet-0.6.1c/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "sunrise"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "smart-tab/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "elpa/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "elpa/company-0.5"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "elpa/jtags-0.96/"));;
 (add-to-list 'load-path  (concat joseph_site-lisp_install_path "dired/"))



;(add-to-list 'load-path (expand-file-name "./"))

;; find . -name "*.el"  -exec emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile {} \;


(provide 'joseph_byte_compile_include)