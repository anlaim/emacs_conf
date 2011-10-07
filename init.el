;; -*-no-byte-compile: t; -*-
;;;;Time-stamp: <Joseph 2011-10-19 11:05:47 星期三>
;; ╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗
;;  ╭∩╮⎝▓▓⎠╭∩╮
;; ▇█▓▒░◕~◕░▒▓█▇

(defvar joseph-origin-load-path load-path)
(load (expand-file-name "~/.emacs.d/site-lisp/joseph-file-util/joseph-file-util"))
(defvar user-load-path (joseph-all-subdirs-under-dir-recursively
                        (expand-file-name "~/.emacs.d/site-lisp/")
                        "\\.git\\|\\.svn\\|RCS\\|rcs\\|CVS\\|cvs\\|doc\\|syntax\\|templates\\|tests\\|icons\\|lib\\|testing\\|etc\\|script"))
(dolist (path user-load-path) (add-to-list 'load-path path))

(setq exec-path (delete-dups  (cons (expand-file-name "~/.emacs.d/bin/") exec-path)))
(setenv "PATH" (concat (getenv "PATH") ";" (expand-file-name "~/.emacs.d/bin/")))
;; (defun joseph-add-subdirs-to-load-path (dir)
;;   "把DIR的所有子目录都加到`load-path'里面"
;;   (interactive)
;;   (let ((default-directory (concat dir "/")))
;;     (add-to-list 'load-path dir)
;;     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;         (normal-top-level-add-subdirs-to-load-path))))

;; (defvar joseph_root_install_path        (expand-file-name "~/.emacs.d/"))
;; (defvar joseph_site-lisp_install_path   (concat joseph_root_install_path "site-lisp/"))
;; (defvar joseph_joseph_install_path      (concat joseph_site-lisp_install_path "joseph/"))
;; (defvar joseph-cedet-path               (concat joseph_site-lisp_install_path "cedet-1.0/") "Path of `cedet'")

;; ;;因为Emacs 默认自带了一个版本的org-mode ,需要保证这个路径在默认org-mode 路径的前面，所
;; ;; 以这个路径手动添加
;; (add-to-list 'load-path (format "%s/org-mode-git/lisp/" joseph_site-lisp_install_path))
;; (add-to-list 'load-path (format "%s/org-mode-git/contrib/lisp/" joseph_site-lisp_install_path))
;; ;;joseph-add-subdirs-to-load-path 函数将.emacs.d/site-lisp/目录
;; ;;下所有的目录递归地加入到load-path
;; (joseph-add-subdirs-to-load-path joseph_site-lisp_install_path)

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
 '(completions-common-part ((t (:inherit default :foreground "Cyan"))))
 '(completions-first-difference ((t (:background "black" :foreground "Gold2" :weight extra-bold :height 1.3))))
 '(diff-added ((((background dark)) (:foreground "#FFFF9B9BFFFF")) (t (:foreground "DarkGreen"))))
 '(diff-changed ((((background dark)) (:foreground "Yellow")) (t (:foreground "MediumBlue"))))
 '(diff-context ((((background dark)) (:foreground "White")) (t (:foreground "Black"))))
 '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black")) (t (:foreground "Red" :background "White"))))
 '(diff-header ((((background dark)) (:foreground "Cyan")) (t (:foreground "Red"))))
 '(diff-hunk-header ((((background dark)) (:foreground "Black" :background "#05057F7F8D8D")) (t (:foreground "White" :background "Salmon"))))
 '(diff-index ((((background dark)) (:foreground "Magenta")) (t (:foreground "Green"))))
 '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) (t (:foreground "DarkBlue"))))
 '(diff-refine-change ((((class color) (min-colors 88) (background dark)) (:background "grey30"))))
 '(diff-removed ((((background dark)) (:foreground "#7474FFFF7474")) (t (:foreground "DarkMagenta"))))
 '(dired-directory ((t (:background "Blue4" :foreground "gray"))))
 '(ediff-current-diff-B ((t (:background "DarkOliveGreen" :foreground "Gold"))))
 '(erc-command-indicator-face ((t (:background "Purple" :weight bold))))
 '(erc-direct-msg-face ((t (:foreground "Yellow"))))
 '(erc-header-line ((t (:background "GreenYellow" :foreground "Gold"))))
 '(erc-input-face ((t (:foreground "Cyan2"))))
 '(erc-my-nick-face ((t (:foreground "Goldenrod" :weight bold))))
 '(erc-nick-default-face ((t (:foreground "Chartreuse" :weight bold))))
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



