
;;; -*- coding:utf-8 -*-
;; Last Updated : Joseph 2011-11-25 10:30:42 星期五
;;需要在anything load之后

;;; ETAG
;;如果要生成emacs 支持的tags 可以使用etags 和ExuberantCtags(ctags)
;;使用ctags 需要加-e选择表示生成emacs支持的tag文件
;;-R 应该是递归整个目录,它会自动根据文件类型判断哪些文件需要索引
;;  cd /path/to/my/project
;;  ctags -e myfile.cpp
;;一般使用"ctags -e -R /usr/src/linux" 就可以了(建议使用绝对路径)
;;可以加上-f 或者-o 指定输出文件(应该是-e 选项前), 如:
;;ctags -f /tmp/tags-file -e -R /usr/src/linux
;;
;;etags 的使用方法
;;find . -regex ".*\.\(h\|c\|cpp\)" -exec etags -a -o "/tmp/TAG" {} \;

;; * `M-.’ (‘find-tag’) – find a tag, that is, use the Tags file to look up a definition. If there are multiple tags in the project with the same name, use `C-u M-.’ to go to the next match.
;; * `M-*’ (‘pop-tag-mark’) – jump back

;; * ‘M-x tags-search’ – regexp-search through the source files indexed by a tags file (a bit like ‘grep’)
;; * ‘M-x tags-query-replace’ – query-replace through the source files indexed by a tags file
;; * `M-,’ (‘tags-loop-continue’) – resume ‘tags-search’ or ‘tags-query-replace’ starting at point in a source file
;; * ‘M-x tags-apropos’ – list all tags in a tags file that match a regexp
;; * ‘M-x list-tags’ – list all tags defined in a source file

;;; etags-anything+.el 我写的
;;  (require 'anything-etags+)
(autoload 'anything-etags+-select-one-key "anything-etags+.el" "" t)
(autoload 'anything-etags+-history "anything-etags+.el" t)
(autoload 'anything-etags+-history-go-back "anything-etags+.el" "" t)
(autoload 'anything-etags+-history-go-forward "anything-etags+.el" "" t)
(eval-after-load "anything-etags+" '(setq anything-etags+-use-short-file-name nil))

;;you can use  C-uM-. input symbol (default thing-at-point 'symbol)
(global-set-key "\M-." 'anything-etags+-select-one-key)
;;list all
(global-set-key "\M-*" 'anything-etags+-history)
;;go back directly without-anything
(global-set-key "\M-," 'anything-etags+-history-go-back)
;;go forward directly without anything
(global-set-key "\M-/" 'anything-etags+-history-go-forward)
;;; etags-table
;;它会根据你打开的文件不同为 tags-table-list 属性设置不同的值
;; (require 'etags-table)
(autoload 'etags-table-recompute "etags-table" "" nil)
(add-hook 'anything-etags+-select-hook 'etags-table-recompute)

;;etags-table的正则语法 必须匹配全路径，所以要加上 ".*"
(eval-after-load "etags-table"
  '(progn
     (if (equal system-type 'gnu/linux)
         (setq etags-table-alist
               `((".*\\.java$"  ,(expand-file-name "src/TAGS" (getenv "JAVA_HOME")))
                 (".*\\.[ch]$"  "/usr/include/TAGS")
                 (".*\\.el$" ,(concat "/usr/share/emacs/" (substring emacs-version 0 (string-match "\\.[0-9]+$"  emacs-version)) "/lisp/TAGS"))
                 ))
       (setq etags-table-alist
             `((".*\\.java$"  ,(expand-file-name "src/TAGS" (getenv "JAVA_HOME")))
               (".*\\.el$" ,(expand-file-name(concat exec-directory "../lisp/TAGS" )))
               ))
       )
     )
  )

;;; defined in ctags-update.el
(when (equal system-type 'windows-nt)
  (setq ctags-update-command (expand-file-name  "~/.emacs.d/bin/ctags.exe")))
(ctags-update-minor-mode 1)
;; with prefix `C-u' ,then you can generate a new TAGS file in your
;; selected directory
(global-set-key "\C-wE" 'ctags-update)

(provide 'joseph_tags)
