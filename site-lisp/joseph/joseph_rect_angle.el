;; -*- coding:utf-8 -*-
;; vim 里C-v 后可以d y  c  ,可以I A在矩形块前后添加内容后按 esc 在所有行上都添加此内容
;; 而C-v$后 ，A内容esc 会在每行的最后添加内容
;; evil-mode 也支持此操作，所以 本文件的内容在evil 启用后， 不再需要

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
(autoload 'rm-set-mark "rect-mark" "Set mark for rectangle." t)
(global-set-key (kbd "M-SPC") 'rm-set-mark);;alt+space 开始矩形操作，然后移动位置，就可得到选区
(global-set-key (kbd "C-3") 'rm-set-mark);;alt+space 开始矩形操作，然后移动位置，就可得到选区
;(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
;; (define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark);交换始末点
;; (define-key ctl-x-map "r\C-w" 'rm-kill-region)            ;cut
;; (define-key ctl-x-map "r\C-k" 'rm-kill-region)            ;cut
;; (define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)         ;copy
;; (define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region); shift 鼠标左键拖动
;; (global-set-key   "\M-I"          'string-insert-rectangle) ; insert string
;; (autoload 'rm-exchange-point-and-mark "rect-mark" "Exchange point and mark for rectangle." t)
;; (autoload 'rm-kill-region "rect-mark" "Kill a rectangular region and save it in the kill ring." t)
;; (autoload 'rm-kill-ring-save "rect-mark" "Copy a rectangular region to the kill ring." t)
;; (autoload 'rm-mouse-drag-region "rect-mark" "Drag out a rectangular region with the mouse." t)
(define-key ctl-x-map "r\C-e" 'extend-rectangle-to-end) ;以最长的line 为准， 跳到行末
 

;; 先选中多行，然后同时编辑各行的开头或行尾,主要用编辑行尾的功能 ，rect有更强大的列编辑
;; 不再需要了 ，evil-mode里有C-v$ 模式，即C-v$后使用A+内容+Esc 会在每行行尾添加此内容
(autoload 'mulled/edit-trailing-edges "multiple-line-edit" "" t)
(autoload 'mulled/edit-leading-edges "multiple-line-edit" "" t)
;; (require 'multiple-line-edit)
(global-set-key (kbd "C-x r e") 'mulled/edit-trailing-edges)
(global-set-key (kbd "C-x r a") 'mulled/edit-leading-edges)

(provide 'joseph_rect_angle)
