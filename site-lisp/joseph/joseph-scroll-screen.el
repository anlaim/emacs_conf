;;{{{ highlight a line 

(defcustom scroll-highlight-tag-after-jump t
  "*If non-nil, temporarily highlight the tag
  after you jump to it.
  (borrowed from etags-select.el)"
  :group 'scroll-
  :type 'boolean)
(defcustom scroll-highlight-delay 0.3
  "*How long to highlight the tag.
  (borrowed from etags-select.el)"
  :group 'scroll-
  :type 'number)

(defface scroll-highlight-line-face
  '((t (:foreground "white" :background "cadetblue4" :bold t)))
  "Font Lock mode face used to highlight tags.
  (borrowed from etags-select.el)"
  :group 'scroll-)
        
(defun scroll-highlight (beg end)
  "Highlight a region temporarily.
   (borrowed from etags-select.el)"
  (if (featurep 'xemacs)
      (let ((extent (make-extent beg end)))
        (set-extent-property extent 'face 'scroll-highlight-line-face)
        (sit-for scroll-highlight-delay)
        (delete-extent extent))
    (let ((ov (make-overlay beg end)))
      (overlay-put ov 'face 'scroll-highlight-line-face)
      (sit-for scroll-highlight-delay)
      (delete-overlay ov))))

;;}}}
;;{{{ scroll up down C-v C-r

(defun scroll-half-screen-down()
  (interactive)
  (let ((b (point-at-bol) )(e (1+ (point-at-eol)) ))
  (forward-line  (round (/ (frame-height) 1.5) ))
  (recenter 5)
;;  (scroll-highlight b e)
  (scroll-highlight (point-at-bol)(1+ (point-at-eol)))
  ))
(defun scroll-half-screen-up()
  (interactive)
  (let ((b (point-at-bol) )(e (1+ (point-at-eol)) ))
  (forward-line (- 0 (round (/(frame-height) 1.5))))
  (recenter 5)
;;  (scroll-highlight b e)
  (scroll-highlight (point-at-bol)(1+ (point-at-eol)))
  ))

(global-set-key "\C-r" 'scroll-half-screen-up)
(global-set-key "\C-v" 'scroll-half-screen-down)

;; (defun chb-page-down ()
;;   (interactive)
;;   (when (featurep 'xemacs) (setq zmacs-region-stays t))
;;   (forward-line
;;    (- (if (fboundp 'window-displayed-height)      ;XEmacs
;;           (window-displayed-height)
;;         (window-text-height))                     ;GNUEmacs
;;       next-screen-context-lines))
;;   (recenter next-screen-context-lines)
;;   )

;; (defun chb-page-up ()
;;   (interactive)
;;   (when (featurep 'xemacs) (setq zmacs-region-stays t))
;;   (forward-line
;;    (- (- (if (fboundp 'window-displayed-height)   ;XEmacs
;;              (window-displayed-height)
;;            (window-text-height))                  ;GNUEmacs
;;          next-screen-context-lines)))
;;     (recenter next-screen-context-lines)
;;   )
;; (global-set-key "\C-r" 'chb-page-up)
;; (global-set-key "\C-v" 'chb-page-down)

;;}}}
(provide 'joseph-scroll-screen)