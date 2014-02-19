(eval-when-compile (require 'joseph-util))
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
(setq-default ethan-wspace-mode-line-element nil); 不在modeline 显示 是否启用ethan-wspace
;; (require 'ethan-wspace)
(set-default 'ethan-wspace-errors '(no-nl-eof eol)) ;many-nls-eof tabs
;; 只对特定的major mode 启用ethan-wspace-mode,因为在makefile 中启用会有bug
(add-hooks '(java-mode-hook c++-mode-hook python-mode-hook c-mode-hook org-mode-hook perl-mode-hook
                            gitconfig-mode-hook go-mode-hook
                            cperl-mode-hook emacs-lisp-mode-hook erlang-mode-hook)
           'ethan-wspace-mode)

;; (global-ethan-wspace-mode 1)


(provide 'joseph-ethan-wspace)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-ethan-wspace.el ends here
