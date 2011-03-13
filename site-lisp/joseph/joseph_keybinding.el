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
;;{{{ 像Vi一样用%在匹配的括号间跳转

(defun goto-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) )
	((looking-back "\\s\)")  (backward-list 1))
   ((looking-at "\\s\{") (forward-list 1) )
	((looking-back "\\s\}") (forward-char 1))
	(t (self-insert-command (or arg 1)))))

;; (defun goto-match-paren (arg)
;;   "Go to the matching parenthesis if on parenthesis AND last command is a movement command, otherwise insert %.
;; vi style of % jumping to matching brace."
;;   (interactive "p")
;;   (message "%s" last-command)
;;   (if (not (memq last-command '(
;;                                 set-mark
;;                                 cua-set-mark
;;                                 goto-match-paren
;;                                 down-list
;;                                 up-list
;;                                 end-of-defun
;;                                 beginning-of-defun
;;                                 backward-sexp
;;                                 forward-sexp
;;                                 backward-up-list
;;                                 forward-paragraph
;;                                 backward-paragraph
;;                                 end-of-buffer
;;                                 beginning-of-buffer
;;                                 backward-word
;;                                 forward-word
;;                                 mwheel-scroll
;;                                 backward-word
;;                                 forward-word
;;                                 mouse-start-secondary
;;                                 mouse-yank-secondary
;;                                 mouse-secondary-save-then-kill
;;                                 move-end-of-line
;;                                 move-beginning-of-line
;;                                 backward-char
;;                                 forward-char
;;                                 scroll-up
;;                                 scroll-down
;;                                 scroll-left
;;                                 scroll-right
;;                                 mouse-set-point
;;                                 next-buffer
;;                                 previous-buffer
;;                                 )
;;              ))
;;   (self-insert-command (or arg 1))
;; (cond ((looking-at "\\s\(") (forward-list 1) )
;;       ((looking-back "\\s\)")  (backward-list 1))
;;       (t (self-insert-command (or arg 1))))))

;;}}}
;;{{{ 合并当前行与下一行，同vim的 J命令 ,并作了增强，可以合并多行，使用方法 C-u n C-c C-j ;n是次数:
;(global-set-key (kbd "C-x C-j") 'joseph-join-lines)
(defun joseph-join-lines(&optional arg)
  (interactive "*p")
    (save-excursion
    (let ((index 1)   )        ;index 初始化为0
         (while (<= index  arg) ; when index <arg 
            (end-of-line)
            (delete-char  1)
            (delete-horizontal-space)
            (insert " ")
            (setq index (1+ index)) ; 计数器自增一 index=index+1
        )
     )
  )
)

;;}}}
;;{{{ ;此函数可以进行快速定位 ,vi 中有个f命令如fa 搜索a 并跳到相应位置, 如果这个函数用熟了完全可以去掉C-f 与C-b这两个键
;; 而这个命令与之相似，如将命令绑到C-f后，按下C-f后 连续按一个字母如s则会一直搜索s 并定位到相应的位置，按C-h可反向搜索
;;直到按下不同的字母(源码在王垠的wy-go-tochar上进行了修改，可以进行反向搜索)
; ;郑重向大家推荐我写的 ,把它绑定到C-f ,它具有普通C-f 向前移到一个字符的功能,同时又能根据特定字符快速定位
(defun joseph-go-to-char (n)
  "Move forward to Nth occurence of CHAR.
Typing `joseph-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR. Typing `\C-h' will move back ."
  (interactive "p")
  (forward-char n)
  (unless (equal last-command 'joseph-go-to-char)
    (let((char (read-event "Go to Char:" )))
      (if (characterp char) 
          (if (string-match "[[:cntrl:]]" (string char))
              (if (char-equal ?\C-f char)
                  (progn (forward-char n)
                         (let ((readed-char (read-event " ")))
                           (while (and  (characterp readed-char) (char-equal ?\C-f readed-char)) 
                             (forward-char)
                             (setq readed-char (read-event " "))))
                         (setq unread-command-events (list last-input-event)))
                )
            (progn 
              (when (search-forward (string char) nil nil n) (backward-char))                 
              (let ((readed-char (read-event
                                  (concat "(?\C-h for backward search ,\""
                                          (string char) "\" for forward search):"))))
                (while (and (characterp readed-char)
                            (or (char-equal readed-char char)  
                                (char-equal ?\C-h readed-char)))
                  (if    (char-equal ?\C-h readed-char)
                      (search-backward (string char) nil nil n)
                    (forward-char)
                    (when (search-forward (string char) nil nil n) (backward-char))
                    )
                  (setq readed-char (read-event
                                     (concat "(?\C-h for backward search ,\""
                                             (string char)"\" for forward search):"))))
                (setq unread-command-events (list last-input-event)))))
        (setq unread-command-events (list last-input-event))
        )
      )
    )
  )

;;}}}
;;{{{  open-line-or-new-line-dep-pos
(defun open-line-or-new-line-dep-pos()
  "if point is in head of line then open-line
if point is at end of line , new-line-and-indent"
  (interactive)
  (if (or (= (point) (line-beginning-position))
          (string-match "^[ \t]*$"
                        (buffer-substring-no-properties
                         (line-beginning-position)(point) ) ))
      (progn
        (beginning-of-line)
        (open-line 1)
        (indent-relative-maybe)
        )
    (newline-and-indent)
    ))
;;}}}
;;{{{  smart-beginning-of-line 
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
;;}}}
;;{{{  switch-to-scratch-buffer

(defun switch-to-scratch-buffer()
  "switch to *scratch* buffer."
  (interactive)
  (switch-to-buffer "*scratch*")
  (goto-char (point-max))
  )

;;}}}
;;{{{  move-backward-paren move-forward-paren 移向前(后)一个括号

(defun move-backward-paren()
  (interactive)
   (re-search-backward "\\s[\\|\\s(\\|\\s{" nil t)
  )
(defun move-forward-paren()
  (interactive)
   (re-search-forward "\\s]\\|\\s)\\|\\s}" nil t)
  )

;;}}}
;;{{{ stardict 词典
(defun query-stardict ()
  "Serch dict in stardict."
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    (message "searching  %s ... using stardicr" (buffer-substring begin end))
    (shell-command "notify-send \"`sdcv -n -u '朗道英汉字典5.0' %s`\"" (buffer-substring begin end) )
    (message "finished searching  朗道英汉字典5.0'")
    ))

(defun sdcv-to-buffer ()
  "Search dict in region or world."
(interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
      (current-word nil t)))
        (buf-name (buffer-name))
        )
    ;; (setq word (read-string (format "Search the dictionary for (default %s): " word)
    ;;                         nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (insert (shell-command-to-string  (format "sdcv -n %s " word) ))
    (if (equal buf-name "*sdcv*")
        (switch-to-buffer "*sdcv*")
      (switch-to-buffer-other-window "*sdcv*")
        )
    (goto-char (point-min))
    ))
;; (shell-command "notify-send \"`sdcv -n  %s`\"" (buffer-substring begin end))
;; (tooltip-show
;;      (shell-command-to-string
;;       (concat "sdcv -n "
;;               (buffer-substring begin end))))

;;}}}
;;{{{ 只留一个空格,或者删除光标处所有空格(多次连续调用此命令见效果)

(defun just-one-space-or-delete-horizontal-space()
   ""
   (interactive)
   (if (equal last-command 'just-one-space-or-delete-horizontal-space)
       (delete-horizontal-space)
     (just-one-space)
     )
   )

;;}}}

(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-G") 'Meta-G-Map)

;; 默认Emacs 把TAB==`C-i'
;;            RET==`C-m'
;;            ESC==`C-['
;;这样可以进行绑定的键好像少了一些,
;;下面的方法可以实现将`C-i' `C-m'绑定与`TAB' `RET'不同的func
;;不过只在Gui下有用
(when window-system
  (keyboard-translate ?\C-i ?\H-i)
  (keyboard-translate ?\C-m ?\H-m)
  (global-set-key [?\H-m] 'backward-char);C-m
  (global-set-key [?\H-i] 'delete-backward-char) ;C-i
  )
(global-set-key "\C-m" 'newline-and-indent) ;retu;;{{{ 在大小括号间前进后退
(global-set-key (kbd "M-[") 'move-backward-paren)
(global-set-key (kbd "M-]") 'move-forward-paren)
(define-key global-map (kbd "C-f") 'joseph-go-to-char)
(global-set-key "%" 'goto-match-paren)

;;when meet long line ,whether to wrap it 
(setq-default truncate-lines t)
(global-set-key "\C-z$" 'toggle-truncate-lines)

(global-set-key (kbd "C-x C-z") 'suspend-frame)
(global-set-key (kbd "C-z C-z") 'execute-extended-command)
;;一键显隐菜单栏
(global-set-key "\C-zm" (lambda () (interactive) (menu-bar-mode) (tool-bar-mode)))


(global-set-key "\C-j" 'open-line-or-new-line-dep-pos)
(global-set-key (kbd "C-q") 'smart-beginning-of-line)
(global-set-key (kbd "C-e") 'smart-end-of-line)
(global-set-key (kbd "C-a" ) (quote  quoted-insert))
(global-set-key (kbd "C-c C-j") 'joseph-join-lines)

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

(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,一次前进后退5行 
(global-set-key "\M-n"  (lambda () (interactive) (forward-line 4) (scroll-up   4)))
(global-set-key "\M-p"  (lambda () (interactive) (forward-line -4)(scroll-down 4)))

(global-set-key "\M-\C-n" 'scroll-other-window)
(global-set-key "\M-\C-p" 'scroll-other-window-down)
(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
(define-key emacs-lisp-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;只留光标处一个空格或者删除所有空格
(global-set-key "\M-\\" 'just-one-space-or-delete-horizontal-space)
;;词典,需要sdcd的支持
(global-set-key "\C-c\C-d" 'query-stardict)
(global-set-key "\C-cd" 'sdcv-to-buffer)

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp

