;;; -*- coding:utf-8 -*-
;;;;Time-stamp: <Joseph 2011-06-28 21:51:24 星期二>
;;需要在anything load之后

;;{{{ ETAG
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
(defun create-tags-by-ctags(dir-name tag-file-save-path)
  "Create tags file."
  (interactive "DSelect Source Directory to generate ctags:\nF(Tag File Save AS):")
  (let ((ctags-cmd))
    (if (eq system-type 'gnu/linux)
        (setq ctags-cmd "ctags")
      (setq ctags-cmd "ctags.exe"))
    (shell-command
     (format "%s -f %s -e -R %s" ctags-cmd tag-file-save-path (directory-file-name dir-name))
     )))
(global-set-key "\C-wE" 'create-tags-by-ctags)
;;}}}
;;{{{ anything-etags+.el 我写的
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
;;}}}
;;{{{ etags-table
;;它会根据你打开的文件不同为 tags-table-list 属性设置不同的值
;;(require 'etags-table)
(autoload 'etags-table-recompute "etags-table" "" nil)
(add-hook 'anything-etags+-select-hook 'etags-table-recompute)

(eval-after-load "etags-table"
  '(setq etags-table-alist
         (list
          ;;       '("/home/me/Projects/foo/.*\\.[ch]$" "/home/me/Projects/lib1/TAGS" "/home/me/Projects/lib2/TAGS")
          ;;       '("/home/me/Projects/bar/.*\\.py$" "/home/me/Projects/python/common/TAGS")
          '("/tmp/.*\\.c$"  "/java/tags/linux.tag" "/tmp/TAGS" )
          '(".*\\.java$"  "/opt/sun-jdk-1.6.0.24/src/TAGS")
          '(".*\\.[ch]$"  "/java/tags/linux.ctags")
          '("/tmp/d/.*\\.[ch]$"  "/tmp/d/TAGS")
          '("/tmp/.*\\.[ch]$"  "/java/tags/linux.ctags")
          '(".*\\.el$"  "/java/tags/emacs.ctag")
          ))
  )
;;}}}
;;{{{ update tag file at `after-save-hook'

(defvar etags-srcdir-tagfile-alist nil)
;;表示任务对/tmp/d/下文件在每次保存的时候都会重新生成/tmp/d/TAGS文件
;;而anything-etags+.el会自动加载修改后的TAGS文件,这样,在做一个项目的时
;;候,我们把与项目源代码相关的目录指定一个TAGS文件,而这个文件在项目中的文件
;;发生修改时会自动更新
;;接全anything-etags+.el etag-table.el 及这个hook就可以实现
;;简单的项目开发.
(setq  etags-srcdir-tagfile-alist
       '(("/tmp/d/" "ctags -f /tmp/d/TAGS -e -R /tmp/d/")
                                        ; ("/tmp"  "ctags -f /tmp/TAGS -e -R /tmp/")
         ))

(defun update-tagfile-hook()
  (dolist (entity etags-srcdir-tagfile-alist)
    (when (string-match (car entity) (buffer-file-name))
      (shell-command (nth 1 entity))
      )
    )
  )
(add-hook 'after-save-hook 'update-tagfile-hook)

;;}}}


(provide 'joseph_tags)
