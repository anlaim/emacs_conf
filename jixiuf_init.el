;其他零碎的配置都放到jixiuf_common.el文件
(require 'jixiuf_common)
 
;引入关于vim快捷键相关的一些配置，在jixiuf_vim.el
(require 'jixiuf_vim)

;显行号 引入linum+.el文件
;(require 'linum+)
;(global-linum-mode t)
;(set-scroll-bar-mode nil)   ; no scroll bar, even in x-window system (recommended)
;(require 'wb-line-number)
;(wb-line-number-toggle)


;alt+up alt+down 上下移动当前行
(require 'jixiuf_move_line)
;;普通区域选中的操作
;;C-x C-x 交换选中区的始末点，以便在相反方向上改变选区大小

;; rectangle矩阵操作
;;C-x r k  --------  cut
;;C-x r d  --------  delete
;;C-x r y  --------  yank(paste)
;;C-x r o  --------  insert this region with whitespace ,原来的内容右移
;;C-x r c  --------  replace this with whitespace         
;;C-x r t String <RET>  --------  replace this with   your STRING 
;;M-x delete-whitespace-rectangle   删除选择中区域开头处的空格


;;关于寄存器(Register),有名字的rect-region
;;C-x r r X   将当前选中rect区域保存到名为X的寄存器
;;C-x r i X   将X中保存的插入到当前位置

(require 'rect-mark)

;; Support for marking a rectangle of text with highlighting.
(define-key ctl-x-map "r\C-@" 'rm-set-mark) ;C-x r C-SPC
(global-set-key (kbd "M-SPC") 'rm-set-mark);;alt+space 开始矩形操作，然后移动位置，就可得到选区
;(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark);交换始末点
(define-key ctl-x-map "r\C-w" 'rm-kill-region)            ;cut
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)         ;copy 
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region); shift 鼠标左键拖动
(global-set-key   "\M-I"          'string-insert-rectangle) ; insert string
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)

;javascript.el
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;;;;Set the color of screen
;; (set-background-color "black")
;; (set-foreground-color "wheat")
;; (set-cursor-color "gold1")
;; (set-mouse-color "gold1")

;;;;yasnippet ,a autocomplete plugins
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) ;; 
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")
(setq yas/prompt-functions '( yas/ido-prompt yas/dropdown-prompt yas/x-prompt yas/completing-prompt)) ;;设置提示方式，文本/X

;;auto complete 
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;; now you can use "C-c o" to toggle a read-only file 
(require 'jixiuf_sudo)
(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file)
(setq hostname "jf.org")


(provide 'jixiuf_init)
