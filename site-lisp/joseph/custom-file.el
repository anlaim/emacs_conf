
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
                  (background-color . "#0C1021")
                  (background-mode . dark)
                  (border-color . "black")
                  (alpha . 93)
                  ;; (cursor-color . "#A7A7A7")
                  (cursor-color . "green")
                  (foreground-color . "#F8F8F8")
                  (mouse-color . "sienna1")
                  ;; (foreground-color . "green")
                  ;;  (background-color . "black") ;;
                  ;;  ;; (background-color . "#263111")
                  ;;  (cursor-color . "green")
                  ;;  (mouse-color ."gold")
                  ;;  (mouse-color . "Gainsboro")
                  ;;         (font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
                  ;; (font . "DejaVu Sans Mono:pixelsize=15")
                  )
                 (ns ;; if frame created on mac
                  (background-color . "#0C1021")
                  (background-mode . dark)
                  (border-color . "black")
                  ;; (cursor-color . "#A7A7A7")
                  (cursor-color . "green")
                  (foreground-color . "#F8F8F8")
                  (mouse-color . "sienna1")
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
                  (background-color . "#0C1021")
                  (background-mode . dark)
                  (border-color . "black")
                  (alpha . 95)
                  ;; (cursor-color . "#A7A7A7")
                  (cursor-color . "green")
                  (foreground-color . "#F8F8F8")
                  (mouse-color . "sienna1")

                  (height . 30)
                  (width . 100)
                  (left . 200)
                  (top . 20)
                  ;; (visibility . nil)
                  ;;         (font . "fontset-gbk")
                  )
                 (nil ;; if on term
                  (background-color . "#0C1021")
                  (background-mode . dark)
                  (border-color . "black")
                  ;; (cursor-color . "#A7A7A7")
                  (cursor-color . "green")
                  (foreground-color . "#F8F8F8")
                  (mouse-color . "sienna1")
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
 '(default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
 '(blue ((t (:foreground "blue"))))
 '(buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
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
 '(font-lock-todo-face ((t (:foreground "Red" :box (:line-width 2 :color "grey75" :style released-button) :height 1.2))) t)
 '(font-lock-type-face ((t (:foreground "#8DA6CE"))))
 '(font-lock-variable-name-face ((t (:foreground "#40E0D0"))))
 '(font-lock-warning-face ((t (:foreground "Pink"))))
 '(gui-element ((t (:background "#D4D0C8" :foreground "black"))))
 '(highlight ((t (:background "darkolivegreen"))))
 '(highline-face ((t (:background "SeaGreen"))))
 '(hl-paren-face ((t (:overline t :underline t :weight extra-bold))) t)
 '(icicle-historical-candidate ((((background dark)) (:foreground "#DBD599DF0000" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(jabber-chat-prompt-local ((t (:foreground "Orange" :weight bold))))
 '(jabber-rare-time-face ((t (:foreground "Green" :underline t))))
 '(jabber-roster-user-away ((t (:foreground "Orange" :weight normal))))
 '(jabber-roster-user-online ((t (:foreground "Chartreuse" :slant normal :weight bold))))
 '(jabber-title-large ((t (:inherit variable-pitch :foreground "DarkOrange" :weight bold :height 3.0 :width ultra-expanded))))
 '(jabber-title-medium ((t (:inherit variable-pitch :foreground "LawnGreen" :weight bold :height 2.0 :width expanded))))
 '(jabber-title-small ((t (:inherit variable-pitch :foreground "Goldenrod" :weight bold :height 1.0 :width semi-expanded))))
 '(joseph-scroll-highlight-line-face ((t (:background "cadetblue4" :foreground "white" :weight bold))))
 '(log-view-file ((t (:foreground "DodgerBlue" :weight bold))))
 '(log-view-message ((t (:foreground "Goldenrod" :weight bold))))
 '(magit-branch ((t (:foreground "Green" :weight bold))))
 '(magit-diff-file-header ((t (:foreground "Salmon"))))
 '(magit-diff-hunk-header ((t (:foreground "Purple"))))
 '(magit-header ((t (:foreground "DodgerBlue"))))
 '(magit-section-title ((t (:foreground "Goldenrod" :weight bold))))
 '(mode-line ((t (:background "grey75" :foreground "black"))))
 '(region ((t (:background "DarkSlateGray"))))
 '(text-cursor ((t (:background "yellow" :foreground "black"))))
 '(tooltip ((t (:inherit variable-pitch :background "systeminfowindow" :foreground "DarkGreen" :height 2.5))))
 '(underline ((nil (:underline nil))))
 '(vhl/default-face ((t (:background "DarkSlateGray"))))
 '(warning ((t (:foreground "Salmon" :weight bold))))
 '(woman-addition ((t (:inherit font-lock-builtin-face :foreground "Tan2"))))
 '(woman-bold ((t (:inherit bold :foreground "yellow2"))))
 '(woman-italic ((t (:inherit italic :foreground "green"))))
 '(woman-unknown ((t (:inherit font-lock-warning-face :foreground "Firebrick"))))
 '(zmacs-region ((t (:background "snow" :foreground "ble")))))

