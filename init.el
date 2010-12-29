 ;; -*-no-byte-compile: t; -*-
;;{{{ 时间戳
;;;;Time-stamp: <jixiuf 2010-12-28 23:46:27>
;;}}}
;;  ╭∩╮⎝⏠_⏠⎠╭∩╮
;; ▇█▓▒░◕~◕░▒▓█▇
;;我自定义的一个变量，所有的配置文件都在这个变量所对应的目录下面,其他目录以他为相对目录
;;注意在byte-compile 时也要指定路径,所以在
;;joseph/joseph_byte_compile_include.el 文件中也定义了一份相同的配置,
;;需要byte-compile的,也要将其中的配置更正为你的路径
;;注意最后的"/" 不可以少
  (defvar joseph_root_install_path (expand-file-name "~/.emacs.d/"))
  (add-to-list 'load-path  joseph_root_install_path);; 加入配置文件的根路径
 (defvar joseph_site-lisp_install_path (expand-file-name (concat joseph_root_install_path "site-lisp/")))
  (add-to-list 'load-path joseph_site-lisp_install_path);; 
 (defvar joseph_joseph_install_path (expand-file-name (concat joseph_site-lisp_install_path "joseph/")))
  (add-to-list 'load-path  joseph_joseph_install_path);; 
 
(require 'joseph_init)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
