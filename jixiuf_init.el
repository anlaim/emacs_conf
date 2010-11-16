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

;;所有关于矩形操作的配置都在jixiuf_rect_angle.el文件中
(require 'jixiuf_rect_angle)

;javascript.el
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)


;; now you can use "C-c o" to toggle between root and common user to edit current file
(require 'jixiuf_sudo)
(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
;(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file) ;;不好用,可以从脚本里--eval
(setq hostname "jf.org")


;;所有关于自动补全的功能都在jixiuf_auto_complete.el 文件中进行配置
(require 'jixiuf_auto_complete)

;;all about 剪切板 以及编码相关的东西都在jixiuf_clipboard_and_encoding.el
(require 'jixiuf_clipboard_and_encoding)

;;shell emacs 之间快速切换
   (autoload 'shell-toggle "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
   (autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
   (global-set-key [M-f1] 'shell-toggle)
;  (global-set-key [C-f1] 'shell-toggle-cd)



(provide 'jixiuf_init)
