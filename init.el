;; -*-no-byte-compile: t; -*-
;;{{{ 时间戳
;;;;Time-stamp: <Joseph 2011-09-12 14:50:47 星期一>
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

;;因为Emacs 默认自带了一个版本的org-mode ,需要保证这个路径在默认org-mode 路径的前面，所
;; 以这个路径手动添加
(add-to-list 'load-path (format "%s/org-mode-git/lisp/" joseph_site-lisp_install_path))
(add-to-list 'load-path (format "%s/org-mode-git/contrib/lisp/" joseph_site-lisp_install_path))
;;joseph-add-subdirs-to-load-path 函数将.emacs.d/site-lisp/目录
;;下所有的目录递归地加入到load-path
(joseph-add-subdirs-to-load-path joseph_site-lisp_install_path)

;; (defvar joseph_cache_path (expand-file-name (concat joseph_root_install_path "cache/")))
;; (unless (file-exists-p  joseph_cache_path) (make-directory-internal joseph_cache_path))

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
 '(diff-added ((((background dark)) (:foreground "#FFFF9B9BFFFF")) (t (:foreground "DarkGreen"))))
 '(diff-changed ((((background dark)) (:foreground "Yellow")) (t (:foreground "MediumBlue"))))
 '(diff-context ((((background dark)) (:foreground "White")) (t (:foreground "Black"))))
 '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black")) (t (:foreground "Red" :background "White"))))
 '(diff-header ((((background dark)) (:foreground "Cyan")) (t (:foreground "Red"))))
 '(diff-hunk-header ((((background dark)) (:foreground "Black" :background "#05057F7F8D8D")) (t (:foreground "White" :background "Salmon"))))
 '(diff-index ((((background dark)) (:foreground "Magenta")) (t (:foreground "Green"))))
 '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) (t (:foreground "DarkBlue"))))
 '(diff-removed ((((background dark)) (:foreground "#7474FFFF7474")) (t (:foreground "DarkMagenta"))))
 '(dired-directory ((t (:background "Blue4" :foreground "gray"))))
 '(ediff-current-diff-B ((t (:background "DarkOliveGreen" :foreground "Gold"))))
 '(icicle-historical-candidate ((((background dark)) (:foreground "#DBD599DF0000" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(linkd-generic-link ((t (:foreground "cyan"))))
 '(linkd-generic-link-name ((t (:foreground "yellow"))))
 '(linkd-tag-name ((t (:foreground "green" :underline t))))
 '(magit-branch ((t (:foreground "Green" :weight bold))))
 '(magit-diff-file-header ((t (:foreground "Salmon"))))
 '(magit-diff-hunk-header ((t (:foreground "Purple" :slant italic))))
 '(magit-header ((t (:foreground "DodgerBlue"))))
 '(magit-section-title ((t (:foreground "Goldenrod" :weight bold)))))
;;(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point)))))

