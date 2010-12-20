;;一些快捷键的设置

(global-set-key [(meta g)] 'goto-line) ;alt+g 跳到指定行
(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; 退出 emacs 时，自动关闭当前 buffer 
(add-hook 'lisp-interaction-mode-hook '(lambda ()
  (global-set-key (kbd "C-;") (quote eval-print-last-sexp))
  (global-unset-key "\C-j" )
  (global-set-key "\C-j" 'open-and-move-to-next-line )
 ))


    
;;交换C-v C-b 的功能 
(global-set-key (kbd "C-v")  (quote backward-char))
(global-set-key (kbd "C-b") (quote scroll-up))
;;交换M-b M-v 
(global-set-key (kbd "M-v") (quote backward-word) )
(global-set-key (kbd "M-b") (quote scroll-down) )
(global-set-key (kbd "C-t") (quote scroll-down) )
;;;交换C-a C-q
(global-set-key (kbd "C-q" ) (quote  move-beginning-of-line))
;;(global-set-key (kbd "C-a" ) (quote  quoted-insert))
(defun quit_twice () "just quit serval times " (interactive ) (keyboard-quit) (keyboard-quit) (keyboard-quit) )
(global-set-key (kbd "C-g") 'quit_twice ) 
(global-unset-key "\C-z" )

;;{{{ 设置Ctrl-z 的前缀，如此可以绑定更多的C-z 开头的命令
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
;;然后可以有这两种方式
(global-set-key (kbd "C-z C-c C-w b") 'find-file)
(define-key ctl-z-map (kbd "存") 'find-file)
;;}}}
;;{{{ Ctrl+, Ctrl+. 在设定我两个光标间跳转
(global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  记住当前光标位置，可用"C+," 跳转回去
(global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;结合ska-point-to-register使用 "C+," 来加跳转
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
   Use ska-jump-to-register to jump back to the stored position."
  (interactive) (let (( zmacs-region-stays t)) (point-to-register 8)) )
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
   that was stored with ska-point-to-register."
  (interactive) (let ((tmp (point-marker))( zmacs-region-stays t) ) (jump-to-register 8) (set-register 8 tmp)))
;;}}}
;;{{{ ibuffer 及CRM 两个切换buffer的设置, 与buffer 相关的一些设置
;;两个切换buffer的选项，比默认的好
;;CRM bufer list
;(require 'ibuffer)
;;ibuffer 的管理 
;;n p 上下，m进行标记 D标记为删除（关闭buffer） x如关闭标记的buffer
;; = 进行diff操作（已保存的与buffer中的） 
;;O 过滤标记的buffer ，在搜索进行搜索，显示搜索结果 
(global-set-key ( kbd "C-x C-c")' ibuffer)
;(global-set-key "\C-x\C-c" 'electric-buffer-list)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; 原来 的C-x C-c 
;;}}}
;;{{{ 渐近搜索
;Emacs下c-s对应渐进搜索。不过我们更多的时候需要搜索某种模式，所以用得最多的还是渐进式的正则表达式搜索。正则表达式搜索有个烦人的问题：搜索结束时光标不一定停留在匹配字串的开端。幸好这个问题容易解决：
;头两行重新绑定标准搜索键c-s和c-r，把isearch换成regex-isearch。后面三行加入定制函数。关键的语句是(goto-char isearch-other-end)，保证光标停留在匹配字串的开头，而不是缺省的末尾。
(global-unset-key [(control r)] )
(global-set-key [(control s)] 'isearch-forward-regexp)
;(global-set-key [(control r)] 'isearch-forward-regexp)
;; Always end searches at the beginning of the matching expression.
 (add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
  (defun custom-goto-match-beginning () "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))
;;}}}

;; (global-set-key "\C-r" 'backward-delete-cdsfhar-untabify) ;;向前删除一个字符
;; (global-set-key "\M-r" 'backward-kill-word) ;;向前删除一个单词

(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") (quote set-mark-command))




 (provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
