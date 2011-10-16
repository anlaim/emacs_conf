
;;; -*- coding:utf-8 -*-
;; Last Updated : Joseph 2011-10-16 11:33:31 星期日
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
(defun create-tags-by-ctags(dir-name tag-file-save-path)
  "Create tags file."
  (interactive "DSelect Source Directory to generate ctags:\nF(Tag File Save AS):")
  (let ((ctags-cmd))
    (if (eq system-type 'gnu/linux)
        (setq ctags-cmd "ctags")
      (setq ctags-cmd "ctags.exe"))
    (shell-command
     (format "%s -f %s -e -R %s" ctags-cmd (expand-file-name "TAGS" tag-file-save-path) (directory-file-name dir-name))
     )))
(global-set-key "\C-wE" 'create-tags-by-ctags)
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
;;(require 'etags-table)
(autoload 'etags-table-recompute "etags-table" "" nil)
(add-hook 'anything-etags+-select-hook 'etags-table-recompute)

(eval-after-load "etags-table"
  '(setq etags-table-alist
         (list
          ;;       '("/home/me/Projects/foo/.*\\.[ch]$" "/home/me/Projects/lib1/TAGS" "/home/me/Projects/lib2/TAGS")
          ;;       '("/home/me/Projects/bar/.*\\.py$" "/home/me/Projects/python/common/TAGS")
          '("/tmp/.*\\.c$"  "/java/tags/linux.tag" "/tmp/TAGS" )
          '(".*\\.java$"  "/opt/sun-jdk-1.6.0.26/src/TAGS")
          '(".*\\.[ch]$"  "/tmp/TAGS")
          '(".*\\.el$"  "/java/tags/emacs.ctag")
          ))
  )
;;; Update TAGS auto
(defvar etags-update-command "ctags")

;; (get-etags-update-command "/tmp/TAGS") = "ctags -f /tmp/TAGS -e -R /tmp/"
;; (get-etags-update-command "/tmp/TAGS" "/tmp/hello/TAGS") "ctags -f /tmp/TAGS -e -R /tmp/hello/TAGS"
(defun get-etags-update-command (tagfile-full-path &optional save-tagfile-to-as)
  "`tagfile-full-path' is the full path of TAGS file . when files in or under the same directory
with `tagfile-full-path' changed ,then TAGS file need to be updated. this function will generate
the command to update TAGS"
  (if (string-match etags-update-command "ctags")
      (format  "ctags -f %s -e -R %s"
                (or save-tagfile-to-as-this- tagfile-full-path)
                (file-name-directory tagfile-full-path))
    ))


(defun update-tagfile-hook()
  (let ((tags-file-name (anything-etags+-file-truename (anything-etags+-find-tags-file)))
        update-tag-file-command process  )
    (when (and  tags-file-name (not (string-equal tags-file-name (anything-etags+-file-truename (buffer-file-name)))))
      (setq update-tag-file-command ( get-etags-update-command tags-file-name ))
      (unless  (get-process "update TAGS")
        (setq process  (start-process-shell-command
                        "update TAGS"
                        " *update TAGS*"
                        update-tag-file-command))
        (set-process-sentinel process
                              (lambda (proc change)
                                (when (string-match "\\(finished\\|exited\\)" change)
                                  (kill-buffer " *update TAGS*")
                                  ;; (rename-file tmp-tags-file-name tags-file-name  t)
                                  (message "TAGS in parent directory is updated. "  )
                                  )))
        )
      )
    )
  )

(add-hook 'after-save-hook 'update-tagfile-hook)

(provide 'joseph_tags)
