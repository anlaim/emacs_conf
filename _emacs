(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-mode t)
 '(ecb-layout-name "left-dir-plus-speedbar")
 '(ecb-options-version "2.40")
 '(nxml-slash-auto-complete-flag t)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis)))
;;显示匹配括号的形式是高亮对方，而不是默认的光标跳到对方


(setq joseph_root_install_path "/home/jixiuf/.emacs.d/");;我自定义的一个变量，所有的配置文件都在这个变量所对应的目录下面,其他目录以他为相对目录
(add-to-list 'load-path  joseph_root_install_path);; 加入配置文件的根路径
;(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
;(setq load-path (append load-path (list "~/.emacs.d")))
;(load "jixiuf_init")
(require 'joseph_init)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
