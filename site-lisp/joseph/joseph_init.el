;;{{{其他零碎的配置都放到joseph_common.el文件
(require 'joseph_common)
;;}}}

;;{{{ 引入关于vim快捷键相关的一些配置，在joseph_vim.el
(require 'joseph_vim)
;;}}}

;;{{{ 行号的设置
;显行号 引入linum+.el文件
(require 'linum+)
(global-linum-mode t)
;(set-scroll-bar-mode nil)   ; no scroll bar, even in x-window system (recommended)
;(require 'wb-line-number)
;(wb-line-number-toggle)
;;}}} 

;;{{{ 模仿eclipse 中的一个小功能，用;alt+up alt+down 上下移动当前行
(require 'joseph_move_line)
;;}}}

;;{{{ 所有关于矩形操作的配置都在joseph_rect_angle.el文件中
(require 'joseph_rect_angle)
;;}}}


;;{{{ javascript.el
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
;;}}}


;;{{{ joseph_sudo 通过sudo 以root 用户身份打开当前文件(一键切换)
;;emacs 自带一个功能实现编辑只读文件C-x C-q  toggle-read-only
;; now you can use "C-c o" to toggle between root and common user to edit current file
(require 'joseph_sudo)
(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
;(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file) ;;不好用,可以从脚本里--eval
;;}}}

;;{{{ 一些与键绑定相关的配置
(require 'joseph_keybinding)
;;}}}


;;{{{ 所有关于自动补全的功能都在joseph_auto_complete.el 文件中进行配置
(require 'joseph_complete)
;;}}}

;;{{{ 与 剪切板 以及编码相关的东西都在joseph_clipboard_and_encoding.el
(require 'joseph_clipboard_and_encoding)
;;}}}

;;{{{ shell emacs 之间快速切换
   (autoload 'shell-toggle "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
   (global-set-key [M-f1] 'shell-toggle)
;   (autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;  (global-set-key [C-f1] 'shell-toggle-cd)
(when (load (concat joseph_root_install_path  "elpa/package.el")) (package-initialize)) ;; a tools to downlaod el files 
;;}}} 

;;{{{ browse-kill-ring+ 的设置 ,关于列出剪切环中的内容以供选择
;;when M-y ,will show a window to select stuff in kill-ring
;;      q      quit
;;  	RET 	插入当前 kill-ring 的内容并关闭 browse-kill-ring 的窗口
;;      tab  切换到下一个 (跟n 相同)
;;  	U 	在原来那个窗口里面执行 Undo 命令
;;  	e 	编辑当前 kill-ring 项，编辑完之后按 C-c C-c 提交修改
;;  	d 	输出当前 kill-ring 项
;;  	n 	往前移动
;;  	p 	往后移动
;;  	s 	往前搜索
;;  	r 	往后搜索
;;  	i 	插入当前 kill-ring 项
;;  	y 	插入当前 kill-ring 项
;;  	a 	在末尾添加当前 kill-ring 项
;;  	b 	在开头插入当前 kill-ring 项
;;  	o 	插入当前 kill-ring 项，并把它提升到 kill-ring 的首部
;;  	u 	同上，但是插入之后关闭 browse-kill-ring 窗口
;;  	x 	插入当前 kill-ring 项，并把它从 kill-ring 中删除
;;  	<mouse-2>  	插入鼠标选中的内容

;(require 'second-sel) ;;second-selection support ,i don't use it now 
;;浏览剪切环的工具，使用方法M-y
(add-to-list 'load-path  (concat joseph_root_install_path "browse-kill-ring" ))
(require 'browse-kill-ring+)
;;}}}

;;{{{ tabbar 的设置，注释掉了
;; tabbar
;; (require 'tabbar)
;; (tabbar-mode t)
;; (global-set-key (kbd "M--") 'tabbar-backward-group)
;; (global-set-key (kbd "M-=") 'tabbar-forward-group)
;; (global-set-key (kbd "M-1") 'tabbar-backward)
;; (global-set-key (kbd "M-2") 'tabbar-forward)    
;; (require 'tabbar)
;; (setq tabbar-speedkey-use t)
;; (setq tabbar-speedkey-prefix (kbd "C-z d"))
;; (tabbar-mode 1)
;;}}}

;;{{{ hide-region.el hide-lines.el 
(add-to-list 'load-path  (concat joseph_root_install_path "hide") ) ;;隐藏选中的区域
(require 'hide-region)
(global-set-key (kbd "C-z h ") (quote hide-region-hide));;隐藏选区
(global-set-key (kbd "C-z H ") (quote hide-region-unhide));;重现选区
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t) ;;隐藏符合正则表达式的行，或只现示符合的行
(global-set-key (kbd  "C-z l") 'hide-lines);;;All lines matching this regexp will be ;; hidden in the buffer
;;加一个前缀参数C-u C-z l  则 只显示符合表达式的行
(global-set-key (kbd "C-z L" ) 'show-all-invisible);; 显示隐藏的行
;;}}}

;;{{{ 将选区或者当前buffer 生成html格式（带语法着色）
;; M-x htmtize-file 
(require 'htmlize)
;;}}}

(require 'joseph_folder)

;;{{{mmm-mode 多个主major-mode共存
;; ;(add-to-list 'load-path (concat  joseph_root_install_path "mmm-mode-0.4.8"))
;; (require 'mmm-mode)
;; (require 'mmm-auto)
;; (require 'mmm-vars)
;; (require 'mmm-class)
;; (require 'mmm-cmds)
;; (require 'mmm-rpm)
;; (require 'mmm-cweb)
;; (setq mmm-submode-decoration-level 1)
;; ;(setq mmm-global-mode 'maybe)
;; (setq mmm-global-mode t)
;; (mmm-add-mode-ext-class 'html-mode "\\.jsp\\'" 'jsp)
;; ;; (mmm-add-group 'jsp
;; ;;                `((jsp-code
;; ;;                   :submode java
;; ;;                   :match-face (("<%!" . mmm-declaration-submode-face)
;; ;;                                ("<%=" . mmm-output-submode-face)
;; ;;                                ("<%"  . mmm-code-submode-face))
;; ;;                   :front "<%[!=]?"
;; ;;                   :back "%>"
;; ;;                   :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
;; ;;                            (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
;; ;;                            (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;; ;;                   )
;; ;;                  (jsp-directive
;; ;;                   :submode text-mode
;; ;;                   :face mmm-special-submode-face
;; ;;                   :front "<%@"
;; ;;                   :back "%>"
;; ;;                   :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @))
;; ;;                   )))

;; ;; (mmm-add-group
;; ;;      'fancy-html
;; ;;      '(
;; ;;        (html-php-tagged
;; ;;         :submode php-mode
;; ;;         :face mmm-code-submode-face
;; ;;         :front "<[?]php"
;; ;;         :back "[?]>")
;; ;;        (html-css-attribute
;; ;;         :submode css-mode
;; ;;         :face mmm-declaration-submode-face
;; ;;         :front "styleNO=\""
;; ;;         :back "\"")
;; ;;        (jsp-code
;; ;;         :submode java
;; ;;         :match-face (("<%!" . mmm-declaration-submode-face)
;; ;;     		 ("<%=" . mmm-output-submode-face)
;; ;;     		 ("<%"  . mmm-code-submode-face))
;; ;;         :front "<%[!=]?"
;; ;;         :back "%>"
;; ;;         :insert ((?% jsp-code nil @ "<%" @ " " _ " " @ "%>" @)
;; ;;     	     (?! jsp-declaration nil @ "<%!" @ " " _ " " @ "%>" @)
;; ;;     	     (?= jsp-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;; ;;         )
;; ;;        (jsp-directive
;; ;;         :submode text-mode
;; ;;         :face mmm-special-submode-face
;; ;;         :front "<%@"
;; ;;         :back "%>"
;; ;;         :insert ((?@ jsp-directive nil @ "<%@" @ " " _ " " @ "%>" @))
;; ;;         )
;; ;;        ))
;;}}}

;;{{{ multi-mode
;(require 'multi-mode)
;; (autoload 'multi-mode "multi-mode" "Allowing multiple major modes in a buffer." t)

;; (defun jsp-mode () (interactive)
;;       (multi-mode 1
;;                   'html-mode
;;                   '("<%--" indented-text-mode)
;;                   '("<%@" indented-text-mode)
;;                   '("<%=" html-mode)
;;                   '("<%" java-mode)
;;                   '("%>" html-mode)
;;                   '("<script" java-mode)
;;                   '("</script" html-mode)
;;                   ))
;;}}}

;;{{{ config about ecb ,一个浏览文件的工具
;(Add-to-list 'load-path  (concat joseph_root_install_path "ecb-2.40"))
;;         (require 'ecb)
;;         (require 'ecb-autoloads)
;; (setq ecb-auto-activate t ecb-tip-of-the-day nil);;自动启用ecb
;; ;;;; 各窗口间切换
;; (global-set-key [M-left] 'windmove-left)
;; (global-set-key [M-right] 'windmove-right)
;; (global-set-key [M-up] 'windmove-up)
;; (global-set-key [M-down] 'windmove-down)

;; ;;;; 隐藏和显示ECB窗口
;; (define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
;; (define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;  ;;;; 使某一ecb窗口最大化
;; (define-key global-map "\C-c1" 'ecb-maximize-window-directories)
;; (define-key global-map "\C-c2" 'ecb-maximize-window-sources)
;; (define-key global-map "\C-c3" 'ecb-maximize-window-methods)
;; (define-key global-map "\C-c4" 'ecb-maximize-window-history)
;; ;;;; 恢复原始窗口布局
;; (define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)
;;}}}


;;{{{ muse
(require 'muse-mode)
(require 'muse-html)         ;添加html格式的支持
(require 'muse-latex)        ; 添加latex格式的支持
(require 'muse-texinfo)      ; 添加texinfo格式的支持
(require 'muse-docbook)      ; 添加docbook格式的支持
(require 'muse-wiki nil t)   
(require 'muse-project)      ; 添加wiki project的支持

;设置编码方式为utf-8
(setq muse-html-meta-content-type (concat "text/html; charset=utf-8"))

;新建一个wiki工程
(setq muse-project-alist
      '(("joseph_wiki"
         ("~/documents/wiki" :default "index")
         (:base "html" :path "~/documents/wiki/publish")
         (:base "pdf" :path "~/documents/wiki/publish/")
)))
;;}}}

(provide 'joseph_init)
