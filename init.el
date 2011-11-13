;; -*-no-byte-compile: t; -*-
;; Last Updated: Joseph 2011-11-13 16:02:05 星期日
;;                                            ╭∩╮⎝▓▓⎠╭∩╮
;;                                           ▇█▓▒░◕~◕░▒▓█▇
;; ╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗╔囧╗╔囧╝╚囧╝╚囧╗
;; ╭(╯3╰)╮

(defvar joseph-origin-load-path load-path)
(load (expand-file-name "~/.emacs.d/site-lisp/joseph-file-util/joseph-file-util"))
(defvar user-load-path (all-subdir-under-dir-recursively
                        (expand-file-name "~/.emacs.d/site-lisp/") nil nil
                        "\\.git\\|\\.svn\\|RCS\\|rcs\\|CVS\\|cvs\\|doc\\|syntax\\|templates\\|tests\\|icons\\|lib\\|testing\\|etc\\|script" t))
(dolist (path user-load-path) (add-to-list 'load-path path))

(setq exec-path (delete-dups  (cons (expand-file-name "~/.emacs.d/bin/") exec-path)))
(setenv "PATH" (concat (getenv "PATH") ";" (get-system-file-path "~/.emacs.d/bin/")))

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
 '(hl-paren-face ((t (:overline t :underline t :weight extra-bold))) t)
 '(icicle-historical-candidate ((((background dark)) (:foreground "#DBD599DF0000" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(jabber-roster-user-away ((t (:foreground "Orange" :slant italic :weight normal))))
 '(jabber-roster-user-online ((t (:foreground "Chartreuse" :slant normal :weight bold))))
 '(jabber-title-large ((t (:inherit variable-pitch :foreground "DarkOrange" :weight bold :height 3.0 :width ultra-expanded))))
 '(jabber-title-medium ((t (:inherit variable-pitch :foreground "LawnGreen" :weight bold :height 2.0 :width expanded))))
 '(jabber-title-small ((t (:inherit variable-pitch :foreground "Goldenrod" :weight bold :height 1.0 :width semi-expanded))))
 '(linkd-generic-link ((t (:foreground "cyan"))))
 '(linkd-generic-link-name ((t (:foreground "yellow"))))
 '(linkd-tag-name ((t (:foreground "green" :underline t))))
 '(log-view-file ((t (:foreground "DodgerBlue" :weight bold))))
 '(log-view-message ((t (:foreground "Goldenrod" :weight bold))))
 '(magit-branch ((t (:foreground "Green" :weight bold))))
 '(magit-diff-file-header ((t (:foreground "Salmon"))))
 '(magit-diff-hunk-header ((t (:foreground "Purple" :slant italic))))
 '(magit-header ((t (:foreground "DodgerBlue"))))
 '(magit-section-title ((t (:foreground "Goldenrod" :weight bold))))
 '(woman-addition ((t (:inherit font-lock-builtin-face :foreground "Tan2"))))
 '(woman-bold ((t (:inherit bold :foreground "yellow2"))))
 '(woman-italic ((t (:inherit italic :foreground "green"))))
 '(woman-unknown ((t (:inherit font-lock-warning-face :foreground "Firebrick")))))
;;(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(add-to-list 'byte-compile-not-obsolete-vars 'font-lock-beginning-of-syntax-function)
