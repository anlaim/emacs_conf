(eval-when-compile (require 'evil))
;; 我会把此文件编译后的elc commit ,因为它几乎不会变化
;; http://vimcdoc.sourceforge.net/doc/motion.html
;; vim 里的 w 对单词进行操作，  此处定义一个o 对 symbol 进行操作
;; w  dw yw yaw daw
;; o  do yo yao dao
;; o光标移到下一个symbol的开头
;; O光标移到上一个symbol的开头

;;;###autoload
(evil-define-motion evil-forward-symbol-begin(count)
  "Move to the end of the COUNT-th next symbol."
  :jump t
  :type exclusive
  (evil-signal-at-bob-or-eob count)
  (evil-forward-beginning 'evil-symbol count))
;;;###autoload
(evil-define-motion evil-backward-symbol-begin(count)
  "Move to the end of the COUNT-th next symbol."
  :jump t
  :type exclusive
  (evil-signal-at-bob-or-eob count)
  ;; (forward-evil-symbol count)
  (evil-backward-beginning 'evil-symbol count)
  )

;;;###autoload
(evil-define-motion evil-forward-symbol-end(count)
  "Move to the end of the COUNT-th next symbol."
  :jump t
  :type exclusive
  (evil-signal-at-bob-or-eob count)
  ;; (evil-forward-end 'evil-symbol count)
  (forward-evil-symbol count)
  )
;;;###autoload
(evil-define-motion evil-backward-symbol-end(count)
  "Move to the end of the COUNT-th next symbol."
  :jump t
  :type exclusive
  (evil-signal-at-bob-or-eob count)
  (evil-backward-end 'evil-symbol count))

(provide 'joseph-evil-symbol)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-symbol.el ends here

