;在终端下alt+up down 好像被错认为esc+up down ,只好把esc 也映射上了，这样，按alt 好使
     ;Alt+up Alt+down 将当前行向上移动，向下移动
;用空格代替tab ,因为要维持列的位置，tab 的宽度影响移动后光标的位置
(setq-default indent-tabs-mode nil);

(global-set-key (kbd "ESC <up>" ) 'move-line-up)
(global-set-key (kbd "ESC <down>" ) 'move-line-down)
(global-set-key (kbd "M-<up>" ) 'move-line-up)
(global-set-key (kbd "M-<down>" ) 'move-line-down)

;;{{{ movd-line 函数 
(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
    (setq n 1))
  (let ((col (current-column)) (row (line-number-at-pos (point))))
     (if (or (> row 1  ) (> n 0))  ;当光标处于第一行时，是没法向上移动的，做个判断
        (progn
           (beginning-of-line)
           (forward-line 1)
           (transpose-lines n)
           (forward-line -1)
           (forward-char col)
        )
     )
   )
 )
;;}}} 

;;{{{ 向上移动当前行
(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))
;;}}}

;;{{{ 向下移动当前行
(defun move-line-down (n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (move-line (if (null n) 1 n)))
;;}}}

(provide 'joseph_move_line)
