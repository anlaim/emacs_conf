(provide 'custom-file)

(defface font-lock-todo-face nil
  "Font Lock mode face used to highlight TODO."
  :group 'font-lock-faces)
(defface font-lock-done-face nil
  "Font Lock mode face used to highlight DONE."
  :group 'font-lock-faces)
(dolist (mode '(c-mode c++-mode java-mode lisp-mode emacs-lisp-mode erlang-mode
                       go-mode
                       actionscript-mode lisp-interaction-mode sh-mode sgml-mode))
  (font-lock-add-keywords
   mode
   '(("\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\|todo\\):" 1  'font-lock-todo-face prepend)
     ("@\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\|todo\\)" 1  'font-lock-todo-face prepend)
     ("\\<\\(DONE\\|Done\\|done\\):" 1 'font-lock-done-face t)
     ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)
     )))

;; show some functions as keywords
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\<\\(quote\\|add-hook\\|equal\\)" .
                           font-lock-keyword-face)))
;; recognize some things as functions
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\<\\(autoload\\|set\\|setq\\|setq-default\\|require-maybe\\|when-available\\|add-hook\\|define-key\\|define-key-lazy\\|global-set-key\\)\\>" .
                           font-lock-function-name-face)))
;; recognize some things as constants
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\<\\(nil\\|\\t\\)\\_>" .
                           font-lock-constant-face)))
;;; faces
;;(set-background-color "#2e2d28")
;;(set-foreground-color "#a1aca7") "#f7f8c6"
;;(set-default-font "DejaVu Sans Mono:pixelsize=16")
;;几种不错的颜色 263111棕色 354022浅棕色 ;;48433d  41412e
;; (set-background-color "#263111")
;; (set-background-color "#2e2d28")

;; (set-mouse-color "GreenYellow")
;; (set-foreground-color "#f7f8c6")
(create-fontset-from-fontset-spec
 "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-fontset-mymac,
 ascii:-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
han:-*-Microsoft YaHei-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
cjk-misc:-*-Microsoft YaHei-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
kana:-*-Microsoft YaHei-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")

(when (equal system-type 'darwin) (add-to-list 'default-frame-alist '(font . "fontset-mymac")))

(setq-default window-system-default-frame-alist
              '( (x ;; if frame created on x display
                  (alpha . 93)
                  (cursor-color . "green")
                  )
                 (ns ;; if frame created on mac
                  ;; (border-color . "black")
                  ;; (cursor-color . "green")
                  (alpha . 93)
                  (height . 55)
                  (width . 150)
                  (left . 200)
                  (top . 20)
                  ;; (foreground-color . "green")
                  ;;  (background-color . "black") ;;
                  ;;  ;; (background-color . "#263111")
                  ;;  (cursor-color . "green")
                  ;;  (mouse-color ."gold")
                  ;;  (mouse-color . "Gainsboro")
                  ;;         (font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
                  ;; (font . "fontset-mymac")
                  ;;(font . "Menlo-14")
		  )
                 (w32
                  ;; (font . "fontset-w32")
                  ;; (background-color . "#0C1021")
                  ;; (background-mode . dark)
                  ;; (border-color . "black")
                  (alpha . 95)
                  ;; (cursor-color . "#A7A7A7")
                  (cursor-color . "green")
                  ;; (foreground-color . "#F8F8F8")
                  ;; (mouse-color . "sienna1")
                  
                  (height . 30)
                  (width . 100)
                  (left . 200)
                  (top . 20)
                  ;; (visibility . nil)
                  ;;         (font . "fontset-gbk")
                  )
                 (nil ;; if on term
                  ;; (background-color . "#0C1021")
                  ;; (background-mode . dark)
                  ;; (border-color . "black")
                  ;; (cursor-color . "#A7A7A7")
                  ;; (cursor-color . "green")
                  ;; (foreground-color . "#F8F8F8")
                  ;; (mouse-color . "sienna1")
                  ;; (font . "fontset-mymac")
                  )))

(setq-default undo-tree-mode-lighter " Ü") ;undo
(setq-default helm-completion-mode-string " H") ;undo

(setq-default mode-line-cleaner-alist
              `((auto-complete-mode . " á")
                (yas-minor-mode . " ý")
                (undo-tree-mode . " Út")
                (golden-ratio-mode . "")
                ;; major mode
                (fundamental-mode . "Fd")
                (ibuffer-mode . "iBuf")
                (lisp-interaction-mode . "λ")
                (emacs-lisp-mode . "EL")))

(defun clean-mode-line ()
  (interactive)
  (dolist (cleaner mode-line-cleaner-alist)
    (let* ((mode (car cleaner))
           (mode-str (cdr cleaner))
           (old-mode-str (cdr (assq mode minor-mode-alist))))
      (when old-mode-str
        (setcar old-mode-str mode-str))
      ;; major mode
      (when (eq mode major-mode)
        (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;; (require 'joseph-font)

;;下面的值是通过Emacs的custom 系统关于外观的设置,如无必要不要手动修改
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#222" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
 '(completions-common-part ((t (:inherit default :foreground "Cyan"))))
 '(completions-first-difference ((t (:background "black" :foreground "Gold2" :weight extra-bold :height 1.3))))
 '(custom-comment-tag ((t (:inherit default))))
 '(custom-face-tag ((t (:inherit default))))
 '(custom-group-tag ((t (:inherit variable-pitch :weight bold :height 1.2))))
 '(custom-variable-tag ((t (:inherit default :weight bold))))
 '(diff-added ((t (:foreground "OliveDrab1"))))
 '(diff-changed ((t (:foreground "yellow"))))
 '(diff-context ((t (:inherit default))))
 '(diff-file-header ((t (:foreground "tan1"))))
 '(diff-function ((t (:inherit diff-header :inverse-video t))))
 '(diff-header ((t (:foreground "light steel blue"))))
 '(diff-hunk-header ((t (:inherit diff-header :inverse-video t))))
 '(diff-index ((t (:foreground "Magenta"))))
 '(diff-nonexistent ((t (:foreground "yellow"))))
 '(diff-refine-added ((t (:background "gray26"))))
 '(diff-refine-changed ((t (:background "gray26"))))
 '(diff-refine-removed ((t (:background "gray26"))))
 '(diff-removed ((t (:inherit font-lock-comment-face :slant italic))))
 '(dired-directory ((t (:background "Blue4" :foreground "gray"))))
 '(ediff-current-diff-B ((t (:background "DarkOliveGreen" :foreground "Gold"))))
 '(erc-command-indicator-face ((t (:background "Purple" :weight bold))))
 '(erc-direct-msg-face ((t (:foreground "Yellow"))))
 '(erc-header-line ((t (:background "GreenYellow" :foreground "Gold"))))
 '(erc-input-face ((t (:foreground "Cyan2"))))
 '(erc-my-nick-face ((t (:foreground "Goldenrod" :weight bold))))
 '(erc-nick-default-face ((t (:foreground "Chartreuse" :weight bold))))
 '(erl-fdoc-name-face ((t (:foreground "green" :weight bold))))
 '(error ((t (:foreground "red" :weight bold))))
 '(flymake-errline ((t (:inherit error :foreground "red"))))
 '(font-lock-builtin-face ((t (:foreground "#F8F8F8"))))
 '(font-lock-comment-face ((t (:foreground "#AEAEAE"))))
 '(font-lock-constant-face ((t (:foreground "#D8FA3C"))))
 '(font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
 '(font-lock-done-face ((t (:foreground "Green" :box (:line-width 2 :color "grey75" :style released-button) :height 1.2))) t)
 '(font-lock-function-name-face ((t (:foreground "#FF6400"))))
 '(font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 '(font-lock-reference-face ((t (:foreground "SlateBlue"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "red"))))
 '(font-lock-string-face ((t (:foreground "light salmon"))))
 '(font-lock-todo-face ((t (:foreground "Red" :box (:line-width 2 :color "grey75" :style released-button) :height 1.2))) t)
 '(font-lock-type-face ((t (:foreground "#8DA6CE"))))
 '(font-lock-variable-name-face ((t (:foreground "#40E0D0"))))
 '(font-lock-warning-face ((t (:foreground "Pink"))))
 '(gui-element ((t (:background "#D4D0C8" :foreground "black"))))
 '(helm-selection ((t (:background "gray26" :underline t))))
 '(helm-source-header ((t (:background "gray46" :foreground "yellow" :weight bold :height 1.3 :family "Sans Serif"))))
 '(helm-visible-mark ((t (:background "gray43" :foreground "orange1"))))
 '(highlight ((t (:background "darkolivegreen"))))
 '(highline-face ((t (:background "SeaGreen"))))
 '(hl-paren-face ((t (:overline t :underline t :weight extra-bold))) t)
 '(joseph-scroll-highlight-line-face ((t (:background "cadetblue4" :foreground "white" :weight bold))))
 '(log-view-file ((t (:foreground "DodgerBlue" :weight bold))))
 '(log-view-message ((t (:foreground "Goldenrod" :weight bold))))
 '(magit-branch ((t (:foreground "Green" :weight bold))))
 '(magit-branch-local ((t (:foreground "coral1"))))
 '(magit-branch-remote ((t (:foreground "green1"))))
 '(magit-diff-added ((t (:inherit diff-added))))
 '(magit-diff-added-highlight ((t (:background "gray26" :foreground "green4"))))
 '(magit-diff-context ((t (:inherit diff-context))))
 '(magit-diff-file-heading ((t (:inherit diff-file-header))))
 '(magit-diff-hunk-heading ((t (:inherit diff-hunk-header :inverse-video t))))
 '(magit-diff-removed ((t (:inherit diff-removed))))
 '(magit-header ((t (:foreground "DodgerBlue"))))
 '(magit-log-author ((t (:foreground "Green"))))
 '(magit-section-heading ((t (:background "gray29" :weight bold))))
 '(minibuffer-prompt ((t (:foreground "salmon1"))))
 '(mode-line ((t (:background "grey75" :foreground "black"))))
 '(org-agenda-date ((t (:inherit org-agenda-structure))) t)
 '(org-agenda-date-today ((t (:inherit org-agenda-date :underline t))) t)
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "green"))) t)
 '(org-agenda-done ((t (:foreground "#269926"))))
 '(org-agenda-restriction-lock ((t (:background "#FFB273"))))
 '(org-agenda-structure ((t (:foreground "#4671D5" :weight bold))))
 '(org-date ((t (:foreground "medium sea green" :underline t))))
 '(org-done ((t (:foreground "#008500" :weight bold))))
 '(org-drawer ((t (:foreground "#2A4480"))))
 '(org-ellipsis ((t (:foreground "#FF7400" :underline t))))
 '(org-footnote ((t (:foreground "#1240AB" :underline t))))
 '(org-hide ((t (:foreground "gray20"))))
 '(org-level-1 ((t (:inherit outline-1 :box nil))))
 '(org-level-2 ((t (:inherit outline-2 :box nil))))
 '(org-level-3 ((t (:inherit outline-3 :box nil))))
 '(org-level-4 ((t (:inherit outline-4 :box nil))))
 '(org-level-5 ((t (:inherit outline-5 :box nil))))
 '(org-level-6 ((t (:inherit outline-6 :box nil))))
 '(org-level-7 ((t (:inherit outline-7 :box nil))))
 '(org-level-8 ((t (:inherit outline-8 :box nil))))
 '(org-scheduled-previously ((t (:foreground "#FF7400"))))
 '(org-tag ((t (:weight bold))))
 '(org-todo ((t (:foreground "#FF6961" :weight bold))))
 '(region ((t (:background "DarkSlateGray"))))
 '(text-cursor ((t (:background "yellow" :foreground "black"))))
 '(tooltip ((t (:inherit variable-pitch :background "systeminfowindow" :foreground "DarkGreen" :height 2.5))))
 '(underline ((nil (:underline nil))))
 '(vhl/default-face ((t (:background "DarkSlateGray"))))
 '(warning ((t (:foreground "Salmon" :weight bold))))
 '(woman-addition ((t (:inherit font-lock-builtin-face :foreground "Tan2"))))
 '(woman-bold ((t (:inherit bold :foreground "yellow2"))))
 '(woman-italic ((t (:inherit italic :foreground "green"))))
 '(woman-unknown ((t (:inherit font-lock-warning-face :foreground "Firebrick")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-group-tag-faces (quote (default)))
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(helm-minibuffer-history-key "C-r")
 '(menu-bar-mode nil)
 '(recentf-auto-cleanup 30)
 '(safe-local-variable-values (quote ((folded-file . t) (tab-always-indent))))
 '(save-place t nil (saveplace))
 '(savehist-additional-variables
   (quote
    (magit-repository-directories mew-passwd-alist kill-ring sqlserver-connection-info mysql-connection-4-complete sql-server sql-database sql-user)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
