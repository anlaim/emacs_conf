;;; joseph-yasnippet-auto-insert.el --- custom yasnippet auto insert   -*- coding:utf-8 -*-

;; Description: custom yasnippet auto insert
;; Time-stamp: <Joseph 2011-09-23 23:16:42 星期五>
;; Created: 2011-09-08 14:18
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: yasnippet auto insert
;; URL: http://www.emacswiki.org/emacs/joseph-yasnippet-auto-insert.el

;; Copyright (C) 2011, 孤峰独秀, all rights reserved.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Commands:
;;
;; Below are complete command list:
;;
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:

;;; auto-insert
(setq-default auto-insert-directory "~/.emacs.d/auto-insert/")
(auto-insert-mode 1)  ;;; Adds hook to find-files-hook
(setq-default auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\\.el$" "el-auto-insert")
(define-auto-insert "\\.c$" "c-auto-insert")
(define-auto-insert "\\.org$" "org-auto-insert")
(defadvice auto-insert  (around yasnippet-expand-after-auto-insert activate)
  "expand auto-inserted content as yasnippet templete, so that we could use yasnippet in autoinsert mode"
  (let ((is-new-file (and (not buffer-read-only)
                          (or (eq this-command 'auto-insert)
                              (and auto-insert   (< (buffer-size) 100)
                                   (not (string-match "[^ \t\n\r]+" (buffer-string))))))))

    ad-do-it
    (let ((old-point-max (point-max)))
      (when is-new-file
        (goto-char old-point-max)
        (yas/expand-snippet (buffer-substring-no-properties (point-min) (point-max)))
        (delete-region (point-min) old-point-max)
        )
      )
    )
  )

;;; my yasnippet auto insert
;;在此目录下存放命名以后缀名开头，"-auto-insert"结尾的文件，作为auto insert
;;时的模版，如果新建 一个 txt 文件，后使用txt-auto-insert 文件中的内容作为
;;模版，此模版语法使用 yasnippet 的模版,所以功能很强大。
;;txt-auto-insert ,org-auto-insert
;; (defvar yasnippet-auto-insert-dir "~/.emacs.d/auto-insert")

;; (defun yasnippet-auto-insert-fun()
;;   (let ((is-new-file (and    (< (buffer-size) 100) (string-match "^[ \t\n\r]*$" (buffer-string))))
;;         (ext (if  (buffer-file-name)  (file-name-extension  (buffer-file-name))
;;                (substring  (symbol-name major-mode) 0 (- (length (symbol-name major-mode) ) 5))))
;;         ext-templete-file ext-templete)
;;     (when (and is-new-file ext)
;;       (setq ext-templete-file (expand-file-name  (concat ext "-auto-insert") yasnippet-auto-insert-dir) )
;;       (when (file-exists-p ext-templete-file)
;;         (setq ext-templete (with-current-buffer  (find-file-noselect  ext-templete-file)
;;                              (prog1 (buffer-string) (kill-buffer))))
;;         (yas/expand-snippet ext-templete)
;;         ))
;;     )
;;   )
;; (add-hook 'find-file-hook 'yasnippet-auto-insert-fun)

(provide 'joseph-yasnippet-auto-insert)
;;; joseph-yasnippet-auto-insert.el ends here
