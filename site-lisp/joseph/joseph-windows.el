;;----------------------------------------------------------------------------
;; Navigate window layouts with "C-c <left>" and "C-c <right>"
;;----------------------------------------------------------------------------
(winner-mode 1)


;;----------------------------------------------------------------------------
;; When splitting window, show (other-buffer) in the new window
;;----------------------------------------------------------------------------
(defvar split-window-status nil)
(defun split-window-func-with-other-buffer-horizontally()
  (interactive)
  (split-window-horizontally)
  (setq split-window-status 'horizontally)
  (set-window-buffer (next-window) (other-buffer))
  )
(defun split-window-func-with-other-buffer-vertically()
  (interactive)
  (split-window-vertically)
  (setq split-window-status 'vertically)
  (set-window-buffer (next-window) (other-buffer))
  )

(global-set-key "\C-x2" 'split-window-func-with-other-buffer-vertically )
(global-set-key "\C-x3"  'split-window-func-with-other-buffer-horizontally)


;;----------------------------------------------------------------------------
;; Rearrange split windows
;;----------------------------------------------------------------------------
(defun toggle-split-window-horizontally-vertically()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (if (equal split-window-status 'horizontally)
        (split-window-func-with-other-buffer-vertically)
      (split-window-func-with-other-buffer-horizontally)
      )
    ))

(global-set-key "\C-w3" 'toggle-split-window-horizontally-vertically)

;shift + 上下左右键，在各窗口间跳转。
(windmove-default-keybindings 'shift)

(provide 'joseph-windows)
