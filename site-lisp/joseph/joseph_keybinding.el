;;一些快捷键的设置
;;{{{ byte-compile

  (eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )

;;}}}

;;{{{  关于键绑定的一些知识

;;关于键绑定的一些设置
;; change a binding in the global keymap, the change is effective in all
;; buffers (though it has no direct effect in buffers that shadow the
;; global binding with a local one).  If you change the current buffer's
;; local map, that usually affects all buffers using the same major mode.
;; The `global-set-key' and `local-set-key' functions are convenient
;; interfaces for these operations .
;;也就是说global-set-key 对所有的buffer 有效,
;;而local-set-key 只影响某一种major-mode,
;;当同时设置了local-set-key global-set-key ,造成键冲突时,前者的优先级高.后者会被屏避掉.

;;(global-set-key key binding) 等价于 (define-key (current-global-map) key binding)
;;取消键绑定 (global-unset-key key) 等价于 (define-key (current-global-map) key nil)
;;(local-set-key key binding) == (define-key (current-local-map) key binding)
;;(local-unset-key key) == (define-key (current-local-map) key nil)
;;     (global-set-key (kbd "C-x C-\\") 'next-line)
;;     (global-set-key [?\C-x ?\C-\\] 'next-line)
;;     (global-set-key [(control ?x) (control ?\\)] 'next-line)
;;
;;关于前缀的一点介绍
;;比如默认情况下C-z 被绑定到最小化窗口,这个时候我们是没法绑定像"C-z C-f"
;;这样的以C-z 为前缀的快捷键的,如果想要这么做,必须定义一个 前缀,
;;然后把C-z 绑定到这个前缀上.
;;比如
;;(define-prefix-command 'ctl-z-map)
;;(global-set-key (kbd "C-z") 'ctl-z-map)
;;ctrl-z-map 的名字你可以随便取,比如
;;(define-prefix-command 'aaaaaaaaaa)
;;(global-set-key (kbd "C-z") 'aaaaaaaaaa)
;;效果也是相同的
;;这样定义的C-z 的前缀后就可以将键绑定到C-z 开头的的快捷键上了.
;;绑定的方式有两种
;;1, (global-set-key (kbd "C-z C-f") 'find-file)
;;2,或者明确指定使用ctl-z-map 前缀
;; (define-key ctl-z-map (kbd "C-f") 'find-file)

;;}}}
;;{{{ 设置一些按键的前缀，如此可以绑定更多的C-z 开头的命令
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-x C-z") 'suspend-frame )
(global-set-key (kbd "C-z C-z") 'execute-extended-command )
;;一键显隐菜单栏
(global-set-key "\C-zm" (lambda () (interactive) (menu-bar-mode) (tool-bar-mode)  ) )

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)
;;when meet long line ,whether to wrap it 
(setq-default truncate-lines t)
(global-set-key "\C-z$" 'toggle-truncate-lines)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-g") 'meta-g-map)
;;}}}
;;{{{ scroll up down C-v C-r
        
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

;;{{{ smart-beginning-of-line 

(defun smart-beginning-of-line ()
    "Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character. "
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (and (= oldpos (point))
         (back-to-indentation) )))

(defun smart-end-of-line()
  "Move point to first non-whitespace character or end-of-line.
Move point to end-of-line ,if point was already at that position,
  move point to first non-whitespace character."
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (when (re-search-forward "[ \t]*$" (point-at-eol) t) 
      (goto-char (match-beginning 0))) 
    (when (= oldpos (point)) 
      (end-of-line))))
(global-set-key (kbd "C-q") 'smart-beginning-of-line)
(global-set-key (kbd "C-e") 'smart-end-of-line)
(global-set-key (kbd "C-a" ) (quote  quoted-insert))
;;}}}
;;{{{ joseph-goto-line
;; (defun joseph-goto-line()
;;   "when read a num then (goto-line num ) when read a string+num then goto line by percent "
;;   (interactive)
;;   (let ((readed-string (read-from-minibuffer "Goto line(char+num by percent): "))(percent) )
;;     (if (string-match "^[%a-zA-Z ]+\\([0-9]+\\)$" readed-string )
;;         (let* ((total (count-lines (point-min) (point-max))) (num ))
;;           (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
;;           (setq num (round (* (/ total 100.0) percent)))
;;           (line-number-at-pos)
;;           (goto-char (point-min))
;;           (forward-line (1- num))
;;            )
;;       (when (string-match "^[0-9]+$" readed-string )
;;           (goto-char (point-min))
;;           (forward-line  (1- (string-to-number readed-string) ))
;;             )
;;     ))
;;   )
(defun joseph-goto-line-by-percent ()
  (interactive)
(let ((readed-string (read-from-minibuffer "Goto line( by percent): "))(percent) )
     (if (string-match "^[ \t]*\\([0-9]+\\)[ \t]*$" readed-string )
        (let* ((total (count-lines (point-min) (point-max))) (num ))
          (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
          (setq num (round (* (/ total 100.0) percent)))
          (goto-char (point-min) )
          (forward-line (1- num)) )
    ))
  )
(global-set-key "\M-gf"      'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta f)] 'joseph-goto-line-by-percent)
;(global-set-key [(meta g) (meta f)] 'joseph-goto-line)
(global-set-key [(meta g) (meta g)] 'goto-line)
;;}}}
;;{{{ Ctrl+, Ctrl+. 在设定我两个光标间跳转(被joseph-quick-jump取代)
;; (global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  记住当前光标位置，可用"C+," 跳转回去
;; (global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;结合ska-point-to-register使用 "C+," 来加跳转
;; (defun ska-point-to-register()
;;   "Store cursorposition _fast_ in a register.
;;    Use ska-jump-to-register to jump back to the stored position."
;;   (interactive) (let (( zmacs-region-stays t)) (point-to-register 8)) )
;; (defun ska-jump-to-register()
;;   "Switches between current cursorposition and position
;;    that was stored with ska-point-to-register."
;;   (interactive) (let ((tmp (point-marker))( zmacs-region-stays t) ) (jump-to-register 8) (set-register 8 tmp)))
;;}}}

;;{{{ 渐近搜索
;Emacs下c-s对应渐进搜索。不过我们更多的时候需要搜索某种模式，所以用得最多的还是渐进式的正则表达式搜索。正则表达式搜索有个烦人的问题：搜索结束时光标不一定停留在匹配字串的开端。幸好这个问题容易解决：
;头两行重新绑定标准搜索键c-s和c-r，把isearch换成regex-isearch。后面三行加入定制函数。关键的语句是(goto-char isearch-other-end)，保证光标停留在匹配字串的开头，而不是缺省的末尾。
;;(global-unset-key [(control r)] )
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
(global-set-key "\C-m" 'newline-and-indent) ;return 


(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,一次前进后退5行
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   4)(forward-line 4) (recenter 10)))
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 4)(forward-line -4)(recenter 10)))

(global-set-key "\M-\C-n" 'scroll-other-window)
(global-set-key "\M-\C-p" 'scroll-other-window-down)

(defun switch-to-scratch-buffer()
  "switch to *scratch* buffer."
  (interactive)
  (switch-to-buffer "*scratch*")
  (goto-char (point-max))
  )
(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
;;{{{ hooks 
;;(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; 退出 emacs 时，自动关闭当前 buffer



(define-key emacs-lisp-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;}}}

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
