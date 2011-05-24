;; -*-no-byte-compile: t; -*-
;;{{{ 时间戳
;;;;Time-stamp: <Joseph 2011-05-24 19:44:02>
;;}}}
;;  ╭∩╮⎝▓▓⎠╭∩╮
;; ▇█▓▒░◕~◕░▒▓█▇

;;我自定义的一个变量，所有的配置文件都在这个变量所对应的目录下面,其他目录以他为相对目录
;;注意在byte-compile 时也要指定路径,所以在
;;joseph/joseph_byte_compile_include.el 文件中也定义了一份相同的配置,
;;需要byte-compile的,也要将其中的配置更正为你的路径
;;注意最后的"/" 不可以少
(defvar joseph-origin-load-path load-path)

(defun joseph-add-subdirs-to-load-path (dir)
  "把DIR的所有子目录都加到`load-path'里面"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))

(defvar joseph_root_install_path        (expand-file-name "~/.emacs.d/"))
(defvar joseph_site-lisp_install_path   (concat joseph_root_install_path "site-lisp/"))
(defvar joseph_joseph_install_path      (concat joseph_site-lisp_install_path "joseph/"))
(defvar joseph-cedet-path               (concat joseph_site-lisp_install_path "cedet-1.0/") "Path of `cedet'")
;;joseph-add-subdirs-to-load-path 函数将.emacs.d/site-lisp/目录
;;下所有的目录递归地加入到load-path
(joseph-add-subdirs-to-load-path joseph_site-lisp_install_path)

(defvar joseph_cache_path (expand-file-name (concat joseph_root_install_path "cache/")))
(unless (file-exists-p  joseph_cache_path) (make-directory-internal joseph_cache_path))

(require 'joseph_init)


;;下面的值是通过Emacs的custom 系统关于外观的设置,如无必要不要手动修改
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anything-file-name ((t (:foreground "cyan"))))
 '(anything-isearch-match ((t (:background "LightSlateBlue" :foreground "cyan"))))
 '(completions-first-difference ((t (:inherit nil :foreground "green"))))
 '(dired-directory ((t (:background "Blue4" :foreground "gray"))))
 '(ediff-current-diff-B ((t (:background "DarkOliveGreen" :foreground "Gold"))))
 '(icicle-historical-candidate ((((background dark)) (:foreground "#DBD599DF0000" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(linkd-generic-link ((t (:foreground "cyan"))))
 '(linkd-generic-link-name ((t (:foreground "yellow"))))
 '(linkd-tag-name ((t (:foreground "green" :underline t)))))
;;(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
