;; -*- coding:utf-8 -*-
;; Last Updated: 纪秀峰 2012-12-26 12:19:25 星期三
;;; byte compile
(eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (add-to-list 'load-path  (expand-file-name ".."))
    (add-to-list 'load-path  (expand-file-name "../auto-complete/"))
    (add-to-list 'load-path  (expand-file-name "../auto-complete/lib/popup/"))
    (add-to-list 'load-path  (expand-file-name "../auto-complete/lib/fuzzy/"))
    (add-to-list 'load-path  (expand-file-name "../magit"))
    (require 'joseph_byte_compile_include)
    (require   'outline)
    (require   'joseph-util)
    (require  'ediff)
    (require  'vc-hooks)
    (require  'log-edit)
    (require  'log-view)
    (require 'helm)
    (require 'magit)
    (require 'magit-svn)
    (require 'helm-replace-string)
  )
;;; require
;; 一些与键绑定相关的配置
;; (require 'joseph-util)
(require 'joseph-loaddefs nil t)
;;(require 'joseph-command) ; autoload command
(require 'joseph_keybinding);
(require 'joseph_common)
(eval-after-load 'dired '(require 'joseph_dired))

(when (equal system-type 'windows-nt)
  (require 'joseph-w32)
  (require 'joseph-openwith-w32))

(when (equal system-type 'gnu/linux)
    (require 'joseph_clipboard_and_encoding)
    (require 'joseph-openwith-linux)
    (require 'joseph-kill-emacs)
    )

(require 'joseph_rect_angle); 所有关于矩形操作的配置都在joseph_rect_angle.el文件中
(require 'joseph_jad_decompile); 用jad 反编译class文件
(require 'joseph-yasnippet-config)
(require 'joseph-hippie-expand)
(require 'joseph-auto-complete)
(eval-after-load 'ibuffer '(require 'joseph_ibuffer))
(require 'joseph-nxhtml)
(eval-after-load 'nxml-mode '(require 'joseph-nxml))
(require 'joseph-move-text)
(require 'joseph_tags);;需要在helm load之后 .tags
(require 'joseph-vc);;; VC
(require 'joseph-compile)
(require 'joseph-auto-document)
(require 'joseph-boring-buffer)
(require 'joseph-autopair-config)
(require 'joseph-minibuffer)
;;粘贴时，对于粘贴进来的内容进行高亮显示,仅仅是高亮显示overlay ，并未选中
(require 'volatile-highlights)
;; 对于helm-show-kill-ring命令也支持高亮显示
;; (vhl/define-extension 'helm-yank 'helm-show-kill-ring)
;; (vhl/install-extension 'helm-yank)
(volatile-highlights-mode t)

(require 'joseph-helm);helm
(eval-after-load 'ido '(require 'joseph-ido));ido
(require 'joseph-iedit )
(require 'joseph-windows)
(require 'joseph-yasnippet-auto-insert)
(require 'joseph-search-replace)
(require 'joseph-flymake)
(require 'joseph-program)
(run-with-idle-timer 10 nil '(lambda () (require 'joseph-cedet) (message "cedet is loaded")));;;  cedet
(eval-after-load 'shell '(require 'joseph-shell));;; shell
(eval-after-load 'shell '(require 'joseph-pcomplete));;; pcomplete
(eval-after-load 'sql '(require 'joseph-sql));;; Sql
(eval-after-load 'cperl-mode '(require 'joseph-perl));;; perl
(eval-after-load 'erc '(require 'joseph-erc));;; erc ,irc
(eval-after-load 'css-mode '(require 'joseph-css));;;
(eval-after-load 'csharp-mode '(require 'joseph-csharp));;;
(require 'joseph-outline)
(require 'joseph-fast-nvg)
(require 'joseph-ace)
(require 'joseph-org-config)
(require 'joseph-c)
(require 'joseph-java)
(require 'joseph-vb)
(require 'joseph-android)
(require 'joseph-thing)
(eval-after-load 'erlang '(require 'joseph-erlang))
(require 'joseph-gtalk)
(require 'joseph-mew)
(require 'joseph-w3m)
(require 'joseph-as)
;; https://github.com/glasserc/ethan-wspace
;; ethan-wspace是用来处理 空格及TAB 相应的问题的
;; 它的 特点是 "无害" "do not harm"
;;有些脚本 提供了自动trim 掉行尾的空格有功能 ，但是在进行diff操作时，会多出不必要的diff
;; ethan-wspace
;;当你打开一个已存在的文件时
;;1. 如果文件中的whitespace 已经都clean 掉了，则它会 在每次保存前进行一个clean ,确保无whitespace
;;2. 如果没有，ethan-wspace 高度显示 errors，它不会自动改动这些errors ,但是它会阻止添加新的errors

;; ethan-wspace 把以下几种情况定义为errors:
;; 1: 行尾空格, trailing whitespace at end of line (eol).
;; 2: 文末没有一个空行 no trailing newline (no-nl-eof).
;; 3:文末有多个空行 more than one trailing newline (many-nls-eof).
;; 4: TAB
;;如果你不想让TAB成为一种error 可以 (set-default 'ethan-wspace-errors (remove 'tabs ethan-wspace-errors))
;;
;; You should also remove any customizations you have made to turn on either
;; show-trailing-whitespace or require-final-newline; we handle those for you.
;; 如果需要 手动删除之 M-x:delete-trailing-whitespace
(setq-default ethan-wspace-face-customized t) ;使用自定义的face ，不必自动计算 ，在daemon模式下怀疑有bug
(require 'ethan-wspace)
(set-default 'ethan-wspace-errors '(no-nl-eof eol)) ;many-nls-eof tabs
;; 只对特定的major mode 启用ethan-wspace-mode,因为在makefile 中启用会有bug
(add-hooks '(java-mode-hook c++-mode-hook python-mode-hook c-mode-hook org-mode-hook perl-mode-hook
                            gitconfig-mode-hook
                            cperl-mode-hook lisp-interaction-mode lisp-mode-hook emacs-lisp-mode-hook erlang-mode-hook)
           'ethan-wspace-mode)

;; (global-ethan-wspace-mode 1)
;; (require 'joseph-linenum-config)


;; 先选中多行，然后同时编辑各行的开头或行尾,主要用编辑行尾的功能 ，rect有更强大的列编辑
(require 'multiple-line-edit)
(global-set-key (kbd "C-x r e") 'mulled/edit-trailing-edges)
(global-set-key (kbd "C-x r a") 'mulled/edit-leading-edges)

(require 'keep-buffers)                     ;; Load the package.
(setq keep-buffers-protected-alist
  '(("\\`\\*scratch\\*\\'" . nil)
    ("\\`\\*Messages\\*\\'" . erase))
  )
(keep-buffers-mode 1) ;;避免如scratch等buffer 被误杀

(provide 'joseph_init)
;;C-c return r ;重新加载当前文件
;;emacs -batch -f batch-byte-compile  filename
;; emacs  -batch    -l /home/jixiuf/emacsd/site-lisp/joseph/joseph_byte_compile_include.el  -f batch-byte-compile *.el

;;C-x C-e run current lisp
; ;; -*-no-byte-compile: t; -*-
;;
;;首先~/.emacs.d/site-lisp/lisp/josehp-loaddefs.el文件是
;;(joseph-update-directory-autoloads-recursively)函数自动生成的
;;这个文件中所有语句都是通过扫描~/.emacs.d/所有子目录下的el文件生成的autoload语句.
;;(joseph-update-directory-autoloads-recursively)
;;函数在joseph-autoload.el文件中定义，
;;而它也会被扫描进joseph-loaddefs.el,
