;; -*-no-byte-compile: t; -*-
;;{{{ 时间戳
;;;;Time-stamp: <jixiuf 2011-03-02 14:33:00>
;;}}}
;;  ╭∩╮⎝⏠_⏠⎠╭∩╮
;; ▇█▓▒░◕~◕░▒▓█▇
;;我自定义的一个变量，所有的配置文件都在这个变量所对应的目录下面,其他目录以他为相对目录
;;注意在byte-compile 时也要指定路径,所以在
;;joseph/joseph_byte_compile_include.el 文件中也定义了一份相同的配置,
;;需要byte-compile的,也要将其中的配置更正为你的路径
;;注意最后的"/" 不可以少
 

(defvar joseph_root_install_path (expand-file-name "~/.emacs.d/"))
(defvar joseph_site-lisp_install_path (expand-file-name (concat joseph_root_install_path "site-lisp/")))
(defvar joseph_joseph_install_path (expand-file-name (concat joseph_site-lisp_install_path "joseph/")))

(add-to-list 'load-path  joseph_root_install_path);; 加入配置文件的根路径
(add-to-list 'load-path  joseph_site-lisp_install_path);; 
(add-to-list 'load-path  joseph_joseph_install_path);; 
(add-to-list 'load-path (concat joseph_site-lisp_install_path "hide/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-config/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-config/extensions/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-config/developer-tools/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "anything-etags+/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "ajc-java-complete/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "yasnippet-0.6.1c/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "auto-complete-1.3/"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "icicles"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "js2"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "popwin-el"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "auto-install"))        
(add-to-list 'load-path (concat joseph_site-lisp_install_path "quick-jump"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "joseph-autopair"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "joseph-scroll-screen"))
(add-to-list 'load-path (concat joseph_site-lisp_install_path "joseph-term-toggle"))


(defvar joseph_cache_path (expand-file-name (concat joseph_root_install_path "cache/")))
(unless (file-exists-p  joseph_cache_path) (make-directory-internal joseph_cache_path))

(require 'joseph_init)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(anything-c-adaptive-history-file "~/.emacs.d/cache/anything-c-adaptive-history")
 '(company-backends (quote (company-elisp company-nxml company-css company-eclim company-semantic company-clang company-xcode company-ropemacs (company-gtags company-etags company-dabbrev-code company-pysmell company-keywords) company-files company-dabbrev)))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(image-dired-db-file "~/.emacs.d/cache/image-dired/.image-dired_db")
 '(image-dired-dir "~/.emacs.d/cache/image-dired/")
 '(image-dired-gallery-dir "~/.emacs.d/cache/image-dired/.image-dired_gallery")
 '(image-dired-main-image-directory "~/image")
 '(image-dired-temp-image-file "~/.emacs.d/cache/image-dired/.image-dired_temp")
 '(recentf-save-file "~/.emacs.d/cache/recentf")
 '(safe-local-variable-values (quote ((folded-file . t))))
 '(save-completions-file-name "~/.emacs.d/cache/completions")
 '(savehist-file "~/.emacs.d/cache/savehist_history")
 '(savehist-mode t nil (savehist))
 '(smooth-scroll/vscroll-step-size 1)
 '(thumbs-thumbsdir "~/.emacs.d/cache/thumbs"))
;;下面的值是通过Emacs的custom 系统关于外观的设置,如无必要不要手动修改
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(anything-file-name ((t (:foreground "cyan"))))
 '(completions-first-difference ((t (:inherit nil :foreground "green"))))
 '(diredp-dir-heading ((t (:background "#32323a" :foreground "#23da42"))))
 '(diredp-dir-priv ((t (:background "#1230492" :foreground "cyan" :overline nil :slant oblique))))
 '(diredp-display-msg ((t (:foreground "#1cd229"))))
 '(diredp-exec-priv ((t (:background "#352d2d" :foreground "#8da7a0"))))
 '(diredp-file-name ((t nil)))
 '(diredp-file-suffix ((t (:foreground "#8aa021"))))
 '(diredp-no-priv ((t (:background "#342736"))))
 '(diredp-number ((t (:foreground "#cababa"))))
 '(diredp-other-priv ((t (:background "#465e38"))))
 '(diredp-rare-priv ((t (:background "#a12cef" :foreground "Magenta"))))
 '(diredp-read-priv ((t nil)))
 '(diredp-write-priv ((t (:background "#2f3328" :foreground "#31edc3"))))
 '(icicle-historical-candidate ((((background dark)) (:foreground "#DBD599DF0000" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(linkd-generic-link ((t (:foreground "cyan"))))
 '(linkd-generic-link-name ((t (:foreground "yellow"))))
 '(linkd-tag-name ((t (:foreground "green" :underline t)))))
;;(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)



;;(hide-emacs-on-linux)