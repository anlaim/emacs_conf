;;{{{ yasnippet 的设置
;;;yasnippet ,a autocomplete plugins
(add-to-list 'load-path  (concat  joseph_root_install_path "yasnippet-0.6.1c"))
(require 'yasnippet) ;; 
(yas/initialize)
(yas/load-directory (concat joseph_root_install_path  "yasnippet-0.6.1c/snippets"))
(setq yas/prompt-functions '( yas/dropdown-prompt yas/x-prompt  yas/ido-prompt yas/completing-prompt)) ;;设置提示方式，文本/X
;;}}}
;;{{{  auto-complete 的配置
(add-to-list 'load-path  (concat joseph_root_install_path "auto-complete-1.3") )
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat joseph_root_install_path  "auto-complete-1.3/ac-dict") )
(ac-config-default)
;; After completion is started, operations in the following table will be enabled temporarily
;;这几个键是临时的，补全完毕会即不可用
;; TAB,  C-i 	ac-expand 	Completion by TAB         
;; RET,  C-m 	ac-complete 	Completion by RET  同TAB，但是他是级联的，也会完成补全的补全
;; down, M-n 	ac-next 	Select next candidate   选择下一个，我修改为C-n
;; up,   M-p 	ac-previous 	Select previous candidate  
;; C-?,  f1 	ac-help 	Show buffer help       
;; C-s 在出现候选项后，可以C-s 进行过滤，只过滤想要的选项
(setq ac-use-menu-map t) ;;只在菜单出现的出时进行C-n C-p 选择菜单的操作
(define-key ac-menu-map "\C-n" 'ac-next) ;;选择下一个候选项
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-menu-height 20);;设置菜单栏的高度20行
;; that is a case that an user wants to complete without inserting any character or
;; a case not to start auto-complete-mode automatically by settings
;;好像是说在还没有调入任何字符的时候,或者默认没启动auto-complete-mode 时，使用这个快捷键进行补全
(define-key ac-mode-map (kbd "M-1") 'auto-complete)
;;(define-key ac-mode-map (kbd "TAB") 'auto-complete)
(setq ac-use-quick-help nil) ;;不显示帮助信息,默认是启用的
;;; (setq ac-quick-help-delay 10)  ;;或者设置显示帮助的延迟
;;;列在这里，但不用它
;;; (setq ac-auto-start nil);; 将不会进行自动补全，结合ac-set-trigger-key 使用
;; (ac-set-trigger-key "TAB")   ;;当ac-auto-start=nil 时哪个键触发补全
;;(setq ac-auto-start 4)  ;;设置当输入几个字符后开始进行补全
;;(ac-use-comphist nil) 默认会根据用户输入频度调整候选词顺序，不想用可禁用之
;;使用字典 ~/.dict 
;;或者用这个命令,一个个加入1
;(setq ac-user-dictionary '("aaa" "bbb"))
 ;auto-complete-mode won't be enabled automatically for modes that are not in ac-modes. So you need to set if necessary:
;;将jde-mode 加入到ac-modes ,auto-complete 只对ac-modes 中的mode 开启，如果默认没加入进去，需手工加入
(add-to-list 'ac-modes 'jde-mode)
;(setq ac-ignore-case 'smart);; 智能的处理大小写的匹配 ，当有大写字母的时候不忽略大小写，
(setq ac-ignore-case nil)
;;dwim  do what i mean 
;; * After selecting candidates, TAB will behave as RET
;; * TAB will behave as RET only on candidate remains
;;当用C-n c-p 选中候选项时tab 表现为return 的行为，即令其上屏
(setq ac-dwim  t)

(defun my_ac-java-mode-setup ()
       (setq ac-sources '( ac-source-filename
                           ac-source-files-in-current-dir
                           ac-source-yasnippet
                           ac-source-semantic
                           ac-source-semantic-raw
                           ac-source-gtags 
                           ac-source-abbrev 
                           ac-source-dictionary
                           ac-source-words-in-all-buffer
                            )))

;;}}} 

;;my config file 
(add-to-list 'load-path (concat joseph_root_install_path "ajc-java-complete") )
(require 'ajc-java-complete-config)

;;{{{ ca2+的配置
;; (add-to-list 'load-path (concat joseph_root_install_path "ca2") )
;; (load "ca2+init" )

;; (defvar ca-source-class
;;   '((name       . "elisp")
;;     (candidates . '(lambda () (setq  a '(("aaa" "ccccc" ) ("aaaaaaaa" "d")) )  ))
;; ))
;; (ca-add-source ca-source-class '(emacs-lisp-mode lisp-interaction-mode))
;;}}}
;(add-to-list 'load-path (concat joseph_root_install_path "completion-ui") )
;(require 'completion-ui)
;;{{{ hippie-expand 补全的设置 alt+/ 代码补全
(global-set-key [(meta /)] 'hippie-expand)
(require 'hippie-exp)
(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list
     '(
        senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)
;;}}}

;;{{{ Java中的一个小扩展，在行尾加分号 
;;在当前行任何位置输入分号都在行尾添加分号，除非本行有for 这个关键字，如果行尾已经有分号则删除行尾的分号，将其插入到当前位置
;;就是说输入两次分号则不在行尾插入而是像正常情况一样
(defun java_append_semicolon(&optional arg)
  (interactive "*p")
  (let (( init_position (point)) (b nil) (e nil) (line_str "") (semicolon_end_of_line nil) ) ;;记录初始光标位置
  (beginning-of-line) (setq b (point)) ;;记录行首位置
  (end-of-line) (setq e (point)  )  ;;记录行尾位置
  (setq line_str (buffer-substring b e)) ;; 截取整行内容
  (setq semicolon_end_of_line  (string-match ";$" line_str )  )
  (if semicolon_end_of_line ;;;;如果行尾已经有分号，则删除行尾的分号，并在当前位置输入分号;;;;;; 
      (progn            
        (goto-char (+ semicolon_end_of_line b)) (delete-char 1)(insert " ")
        (goto-char init_position ) (insert ";")
        )
    (progn  
        (setq for_pos      (string-match "for" line_str)      ) ;;在整行内容中搜索有没有关键字for的存在 
        (if   for_pos  ;;如果for的位置不是nil 
            (progn   (goto-char init_position) (insert ";") ) ;;在光村原处插入分号;
            (progn   (end-of-line) (insert ";") (goto-char init_position)  ) ;;如果搜索不到 for 则在行尾插入分号;
          )
      
      )
)    )
  )
;;}}}

;;{{{  Java中的一个小扩展，在行尾补全大括号
;;输入左大括号，会在行尾添加{，而不是当前位置,并且另起一行补上}
(defun java_append_bracket(&optional arg)
  (interactive "*p")
  (let ( (begin nil) (end nil)  )
      (beginning-of-line) (setq begin (point)) ;;记录行首位置
      (end-of-line) (setq end (point)  )  ;;记录行尾位置
      (setq line_str (buffer-substring begin end)) ;; 截取整行内容
      (if (or (string-match "//" line_str) (string-match "/\\*" line_str )  ) ;;;如果所在行是注释，则行为正常，（判断并不严格）
          (insert "{")
           (progn 
            (end-of-line)
            (insert "{")
            (newline-and-indent)
            (newline)
            (insert "}")
            (setq end (point))
            (previous-line)
            (indent-according-to-mode)
            (indent-region begin end )
            )
    )
    )
  )

;;}}}

;;{{{ 关于Java自动补全中小括号
;;java c c++里自动补全() {} []
 (defun my-java-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
                   (?\(  _ ")")
                   (?\[  _ "]")
;                   (?{ \n > _ \n ?} >)
))
 (setq skeleton-pair t)
(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;(add-hook 'java-mode-hook 'my-java-mode-auto-pair)
;(add-hook 'jde-mode-hook 'my-java-mode-auto-pair)
(add-hook 'emacs-lisp-mode-hook 'my-java-mode-auto-pair)
;;}}}


;;{{{ java-mode相关的hook
(defun my-java-jde-mode-hook()
  (local-set-key (quote [C-return]) (quote jde-complete));;java jde 自动补全键C-return 
  (local-set-key ";" (quote java_append_semicolon)) ;;行尾添加分号
  (local-set-key "{" (quote java_append_bracket))   ;;自动补全{}
  (global-set-key (kbd "C-v")  (quote backward-char))
 (global-set-key (kbd "C-b") (quote scroll-up))
;;交换M-b M-v 
 (global-set-key (kbd "M-v") (quote backward-word) )
 (global-set-key (kbd "M-b") (quote scroll-down) )

    )
(add-hook 'java-mode-hook 'my-java-jde-mode-hook)
(add-hook 'java-mode-hook 'hs-minor-mode);; hide show mode 代码折叠
;;}}}

;;{{{ company   complete anything 相关配置
;;company is a complete tools 
;Enable company-mode with M-x company-mode.  Completion will start automatically after you type a few letters.  
;;Use M-n, M-p, <tab> and <tab> to complete.  Search through the completions with C-s, C-r and C-o.
(add-to-list 'load-path (concat joseph_root_install_path "elpa/company-0.5/"))
;; (autoload 'company-mode "company" nil t)
;; (add-hook 'java-mode-hook '(lambda () (company-mode)))
;; (add-hook 'emacs-lisp-mode-hook  '(lambda ()   (company-mode) ))

;; (defun company-my-backend (command &optional arg &rest ignored)
;;   (case command
;;     ('prefix (when (looking-back "foo\\>")
;;                (match-string 0)))
;;     ('candidates (list "foobar" "foobaz" "foobarbaz"))
;;     ('meta (format "This value is named %s" arg))))
;;}}} 
;(global-ede-mode 1)
(provide 'joseph_complete)


