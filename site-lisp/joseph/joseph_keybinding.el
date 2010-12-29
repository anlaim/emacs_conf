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

;;{{{ 设置一些按键前缀 的前缀，如此可以绑定更多的C-z 开头的命令
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-z C-z") 'suspend-frame )

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-g") 'meta-g-map)

;;}}}

;;when meet long line ,whether to wrap it 
(setq truncate-lines t);;不管用
(global-set-key (kbd "C-c $") 'toggle-truncate-lines)
;;交换C-v C-b 的功能 
(global-set-key (kbd "C-v")  (quote backward-char))
(global-set-key (kbd "C-b") (quote scroll-up))
;;交换M-b M-v 
(global-set-key (kbd "M-v") (quote backward-word) )
(global-set-key (kbd "M-b") (quote scroll-down) )
(global-set-key (kbd "C-t") (quote scroll-down) )
(defun smart-beginning-of-line ()
    "Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character. "
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (and (= oldpos (point))
    (back-to-indentation) ) ))
(global-set-key (kbd "C-q") 'smart-beginning-of-line)
;;;交换C-a C-q
;(global-set-key (kbd "C-q" ) (quote  move-beginning-of-line))
(global-set-key (kbd "C-a" ) (quote  quoted-insert))
;(defun quit_three () "just quit serval times " (interactive ) (keyboard-quit) (keyboard-quit) (keyboard-quit) )
;(global-set-key (kbd "C-g") 'quit_three ) 
;;{{{ joseph-goto-line
(defun joseph-goto-line()
  "when read a num then (goto-line num ) when read a string+num then goto line by percent "
  (interactive)
  (let ((readed-string (read-from-minibuffer "Goto line(char+num by percent): "))(percent) )
    (if (string-match "^[%a-zA-Z ]+\\([0-9]+\\)$" readed-string )
        (let* ((total (count-lines (point-min) (point-max))) (num ))
          (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
          (setq num (round (* (/ total 100.0) percent)))
          (line-number-at-pos)
          (goto-char (point-min))
          (forward-line (1- num))
           )
      (when (string-match "^[0-9]+$" readed-string )
          (goto-char (point-min))
          (forward-line  (1- (string-to-number readed-string) ))
            )
    ))
  )
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
(global-set-key [(meta g)(g)]       'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta g)] 'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta f)] 'joseph-goto-line)

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
(global-unset-key (kbd "C-x C-c"))
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
(global-set-key "\C-m" 'newline-and-indent) ;return 

;;{{{ smart-compile
(eval-and-compile
(add-to-list 'load-path
               (expand-file-name  joseph_site-lisp_install_path )))
;; 这两个命令特别好用，可以根据文件的后缀或者 mode 判断调用的 compile
;; 命令。当目录下有 makefile 自动使用 make 命令。
(global-set-key (kbd "C-c r") 'smart-run)
(global-set-key (kbd "C-c s") 'smart-compile)
;; smart compile 是一个非常好用的 elisp。它的设置也相当简单。只要对相应的后缀
;; 定义 compile 和 run 的命令就行了。格式也列在下面。
;; smart-executable-alist 是用来在调用 smart-run 时是否需要 compile。所以
;; 脚本一般都要加入到这个列表中。除非你只用 smart-compile 运行。
(require 'smart-compile+)
;(require 'smart-compile nil t)
;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )
(when (featurep 'smart-compile)
(setq smart-compile-alist
      '(("\\.c$"          . "g++ -o %n %f")
        ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
        ("\\.java$"       . "javac %f")
        ("\\.f90$"        . "f90 %f -o %n")
        ("\\.[Ff]$"       . "f77 %f -o %n")
        ("\\.mp$"         . "runmpost.pl %f -o ps")
        ("\\.php$"        . "php %f")
        ("\\.tex$"        . "latex %f")
        ("\\.l$"          . "lex -o %n.yy.c %f")
        ("\\.y$"          . "yacc -o %n.tab.c %f")
        ("\\.py$"         . "python %f")
        ("\\.sql$"        . "mysql < %f")
        ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
        ("\\.sh$"         . "./%f")
        (emacs-lisp-mode  . (emacs-lisp-byte-compile))))
(setq smart-run-alist
      '(("\\.c$"          . "./%n")
        ("\\.[Cc]+[Pp]*$" . "./%n")
        ("\\.java$"       . "java %n")
        ("\\.php$"        . "php %f")
        ("\\.m$"          . "%f")
        ("\\.scm"         . "%f")
        ("\\.tex$"        . "dvisvga %n.dvi")
        ("\\.py$"         . "python %f")
        ("\\.pl$"         . "perl \"%f\"")
        ("\\.pm$"         . "perl \"%f\"")
        ("\\.bat$"        . "%f")
        ("\\.mp$"         . "mpost %f")
        ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
        ("\\.sh$"         . "./%f")))
(setq smart-executable-alist
      '("%n.class"
        "%n.exe"
        "%n"
        "%n.mp"
        "%n.m"
        "%n.php"
        "%n.scm"
        "%n.dvi"
        "%n.py"
        "%n.pl"
        "%n.ahk"
        "%n.pm"
        "%n.bat"
        "%n.sh")))

;;}}}

(global-set-key (kbd "C-c w") 'browse-url-at-point)


;;{{{ hooks 
(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; 退出 emacs 时，自动关闭当前 buffer 
(add-hook 'lisp-interaction-mode-hook '(lambda ()
  (global-set-key (kbd "C-;") (quote eval-print-last-sexp))
;  (global-unset-key "\C-j" )
 ; (global-set-key "\C-j" 'open-and-move-to-next-line )
 ))
;;}}}

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
