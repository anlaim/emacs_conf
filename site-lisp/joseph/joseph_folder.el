 ;; -*-no-byte-compile: t; -*-

;;{{{ 注释
;;folding 是一个可以折叠代码的扩展  对于不同代码，需要有不同的前缀后缀，之间的部分会被折叠，适用于代码量很大时的浏览
;;启用folding-mode 之后会在菜单栏有个Fld栏，里面有各种快捷键的定义
;;修改folding所有快捷键的前缀为"C-c f" 这一句要放在(load "folding")之前
;;常用 的键是(注意：我的快捷键前缀修改成了C-c f )
;;;默认folding.el文件中有这样的定义 (以java 为例)
;;;(folding-add-to-marks-list 'java-mode   "// {{{" "// }}}" nil t)
;;  "// {{{" "// }}}"两个数指定哪两个部分之间会被折叠
;;// {{{ this is main method
;;     public void main(){}
;;//  }}}
;;上面代码会被折叠成 // {{{this is main method ...
;;}}}
        
;;{{{ Folding mode 代码块的折叠 ,你当前正在使用的功能

(require 'folding)
;;注意这个函数是定义键的后缀 如 > 绑到folding-shift-in  ,实际是"C-c f >" 绑到上面
(defun joseph_bindingkeys_depend_on_default-keys ()
  "重新绑定快捷键的后缀,folding-mode-prefix-key变量定义前缀，两缀相连就是快捷键了"
  (interactive)
 (define-key folding-mode-map folding-goto-key 'folding-goto-line)
;;I bind C-f and C-b on other keys ,so I don't want to use the terminal-keys  
;;  (folding-bind-terminal-keys)
;;  (define-key folding-mode-map "\C-e" 'folding-end-of-line)
  (folding-kbd "w"   'folding-whole-buffer);; 全部折叠 (这两个好像没有toggle)
  (folding-kbd "o"   'folding-open-buffer)  ;;显示所有

  (folding-kbd "q"   'folding-toggle-show-hide);; 在折与不折间切换
  (folding-kbd "s"   'folding-show-current-entry);; 折
  (folding-kbd "x"   'folding-hide-current-entry) ;;不折
  
  (folding-kbd "u"   'folding-toggle-enter-exit) ;;这个shift-in shift-out间切换
  (folding-kbd ">"   'folding-shift-in) ;; 进入到此折叠区域内查看(此时只能看到此区域中的内容)
  (folding-kbd "<"   'folding-shift-out) ;;与上一个对应
  
  (folding-kbd "f"  'folding-fold-region);; 将选中的区域折叠  
  ;;下面这些还没弄明白
  (folding-kbd "t"  'folding-show-all) 
  (folding-kbd "r"  'folding-convert-buffer-for-printing)
  (folding-kbd "k"  'folding-marks-kill)
  (folding-kbd "v"  'folding-pick-move)
  (folding-kbd "v"  'folding-previous-visible-heading)
  (folding-kbd " "  'folding-next-visible-heading)
  (folding-kbd "."  'folding-context-next-action)
  ;;  C-u:  kinda "up" -- "down"
  ;; Think "#" as a 'fence'
  (folding-kbd "#"      'folding-region-open-close)
  ;; Esc-; is the standard emacs commend add key.
  (folding-kbd ";"      'folding-comment-fold)
  (folding-kbd "%"      'folding-convert-to-major-folds)
  (folding-kbd "/"      'folding-all-comment-blocks-in-region)
  (folding-kbd "y"      'folding-show-current-subtree)
  (folding-kbd "z"      'folding-hide-current-subtree)
  (folding-kbd "n"      'folding-display-name)
  (folding-kbd "I"      'folding-insert-advertise-folding-mode)
)

(setq folding-goto-key "\M-gg")
;;定义folding快捷键的前缀为 C-c f，默认是C-c @  (我嫌它太长，因为@实际是Shift+2 ,再加上后缀的两个键，共按六下，太长)
(setq folding-mode-prefix-key "\C-cf");;设置前缀为"C-c f"
;;不使用folding.el 提供的几种键绑定,使用下面的 joseph_bindingkeys_depend_on_default-keys
;;实际上 joseph_bindingkeys_depend_on_default-keys 提供的键绑定
;;是根据 folding.el 中提供的默认键绑定修改的,只是简单的将C-w 修改成w,减少了按键次数
(setq folding-default-keys-function 'joseph_bindingkeys_depend_on_default-keys)


(add-hook 'java-mode-hook 'folding-mode);;在java-mode中启动folding-mode
(add-hook 'html-mode-hook 'folding-mode)
(folding-add-to-marks-list 'emacs-lisp-mode  ";;{{{"  ";;}}}" nil nil) ;;最后一个nil 表示如果list中已经有这个选项则覆盖
(folding-add-to-marks-list 'java-mode  "//{{{"  "//}}}" nil nil) ;;最后一个nil 表示如果list中已经有这个选项则覆盖
(folding-add-to-marks-list 'html-mode  "<!--{{{"  "<!--}}}-->" "-->" nil) ;;最后一个nil 表示如果list中已经有这个选项则覆盖
(add-hook 'emacs-lisp-mode-hook 'folding-mode)



(folding-install)
(run-hooks 'folding-load-hook)

(provide 'joseph_folder)

;;}}}
