(require 'evil)
;; vim 里的 w 对单词进行操作，  此处定义一个o 对 symbol 进行操作
;; w  dw yw yaw daw
;; o  do yo yao dao
;; o光标移到下一个symbol的开头
;; O光标移到上一个symbol的开头
;; (defun evil-forward-symbol1 (dir)
;;   (if (natnump dir)
;;       (re-search-forward  "\\(\\sw\\|\\s_\\)+" nil 'move )
;;     (prog1 (re-search-backward "\\(\\sw\\|\\s_\\)+" nil 'move)
;;       (skip-syntax-backward "w_"))))

;; (defun evil-forward-symbol (&optional count)
;;   (setq count (or count 1))
;;   (let* ((dir (if (>= count 0) +1 -1))
;;          (count (abs count)))
;;     (while (and (> count 0)
;;                 (evil-forward-symbol1 dir))
;;       (setq count (1- count)))
;;     count))

;; (evil-define-union-move evil-move-symbol (count)
;;   "Move by symbols."
;;   (evil-forward-symbol count)
;;   (evil-move-empty-lines count))

;; (evil-define-motion evil-forward-symbol-begin (count)
;;   "Move the cursor to the beginning of the COUNT-th next symbol."
;;   :type exclusive
;;   (evil-move-beginning count #'evil-forward-symbol))

;; (evil-define-motion evil-forward-symbol-begin (count)
;;   "Move the cursor to the beginning of the COUNT-th next symbol."
;;   :type exclusive
;;   (evil-move-beginning count #'evil-move-symbol))

;; (evil-define-motion evil-backward-symbol-begin (count)
;;   "Move the cursor to the beginning of the COUNT-th previous symbol."
;;   :type exclusive
;;   (evil-move-beginning (- (or count 1)) #'evil-move-symbol))





;; (define-key evil-motion-state-map (kbd "o") #'evil-forward-symbol-begin)
;; (define-key evil-normal-state-map "o" #'evil-forward-symbol-begin)
;; (define-key evil-motion-state-map (kbd ",e") #'evil-forward-symbol-end)
;; (define-key evil-motion-state-map (kbd ",ge") #'evil-backward-symbol-end)

(defun backward-symbol (&optional arg)
  "Move backward until encountering the beginning of a symbol.
With argument, do this that many times."
  (interactive "p")
  (forward-symbol (- (or arg 1))))

(evil-declare-motion 'forward-symbol)
(define-key evil-normal-state-map "o" #'forward-symbol)
(define-key evil-normal-state-map "O" #'backward-symbol)
;; (define-key evil-outer-text-objects-map (kbd "o") #'evil-a-symbol)
;; (define-key evil-inner-text-objects-map (kbd "o") #'evil-inner-symbol)
(provide 'joseph-evil-symbol)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-evil-symbol.el ends here

