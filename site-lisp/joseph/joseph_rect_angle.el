;; -*- coding:utf-8 -*-
;;{{{ byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
;;}}}
;;所有关于 rectangle矩阵操作
;;C-x r k  --------  cut
;;C-x r d  --------  delete
;;C-x r y  --------  yank(paste)
;;C-x r o  --------  insert this region with whitespace ,原来的内容右移
;;C-x r c  --------  replace this with whitespace
;;C-x r t String <RET>  --------  replace this with   your STRING
;;M-x delete-whitespace-rectangle   删除选择中区域开头处的空格

;;普通区域选中的操作 ;;C-x C-x 交换选中区的始末点，以便在相反方向上改变选区大小


;;关于寄存器(Register),有名字的rect-region
;;C-x r r X   将当前选中rect区域保存到名为X的寄存器
;;C-x r i X   将X中保存的插入到当前位置

;;(require 'rect-mark)

;; Support for marking a rectangle of text with highlighting.
;;(define-key ctl-x-map "r\C-@" 'rm-set-mark) ;C-x r C-SPC
(global-set-key (kbd "M-SPC") 'rm-set-mark);;alt+space 开始矩形操作，然后移动位置，就可得到选区
;(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark);交换始末点
(define-key ctl-x-map "r\C-w" 'rm-kill-region)            ;cut
(define-key ctl-x-map "r\C-k" 'rm-kill-region)            ;cut
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)         ;copy
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region); shift 鼠标左键拖动
(global-set-key   "\M-I"          'string-insert-rectangle) ; insert string
(autoload 'rm-set-mark "rect-mark" "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark" "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark" "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark" "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark" "Drag out a rectangular region with the mouse." t)
(defun goto-longest-region-line (beg end)
  "Find the longest line in region and go to it."
  (let* ((real-end  (save-excursion (goto-char end) (end-of-line) (point)))
         (buf-str   (buffer-substring beg real-end))
         (line-list (split-string buf-str "\n"))
         (longest   0)
         (count     0)
         nth-longest-line)
    (loop for i in line-list
         do (progn
              (when (> (length i) longest)
                (setq longest (length i))
                (setq nth-longest-line count))
              (incf count)))
    (goto-char beg)
    (forward-line nth-longest-line)))

(defun extend-rectangle-to-end (beg end)
  "Create a rectangle based on the longest line of region."
  (interactive "r")
  (let ((longest-len (save-excursion
                       (goto-longest-region-line beg end)
                       (length (buffer-substring (point-at-bol) (point-at-eol)))))
        column-beg column-end)
    (goto-char beg) (setq column-beg (current-column))
    (save-excursion (goto-char end) (setq column-end (current-column)))
    (if (not (eq column-beg column-end))
        (progn
          (while (< (point) end)
            (goto-char (point-at-eol))
            (let ((len-line (- (point-at-eol) (point-at-bol))))
              (when (< len-line longest-len)
                (let ((diff (- longest-len len-line)))
                  (insert (make-string diff ? ))
                  (setq end (+ diff end)))))
            (forward-line))
          ;; Go back to END and end-of-line to be sure END is there.
          (goto-char end) (end-of-line) (setq end (point))
          ;; Go back to BEG and push mark to new END.
          (goto-char beg)
          (push-mark end 'nomsg 'activate)
          (setq deactivate-mark  nil))
        (deactivate-mark 'force)
        (error "Error: not in a rectangular region."))))
(define-key ctl-x-map "r\C-e" 'extend-rectangle-to-end)            ;以最长的line 为准， 跳到行末
 


(provide 'joseph_rect_angle)
