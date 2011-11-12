;; -*- coding:utf-8 -*-
;;; joseph-sql.el --- sql config

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: sql sqlserver oracle mysql

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

(require 'sql)
(require 'joseph-sqlserver)
(setq sql-input-ring-file-name "~/.emacs.d/cache/sql-cmd-hist")
;;(setq comint-input-ring-size 500)

;;在普通的sql mode 中
;; `C-cC-b' send buffer content to *SQL* buffer中去执行。
;; `C-cC-r' send 选中区域到 *SQL* buffer中去执行。
;; `C-cC-c' (sql-send-paragraph)
;;  以上命令的前提是当前buffer与*SQL* 进行了关联
;;下面这个hook，如果在启用*SQL* 时已经有sql-mode 的buffer了，则将其与*SQL* 进行关联
(add-hook 'sql-interactive-mode-hook 'my-sql-set-buffer)
(defun my-sql-set-buffer ()
  "Sets the SQLi buffer for all unconnected SQL buffers.
Called from `sql-interactive-mode-hook'."
  (let ((new-buffer (current-buffer)))
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (unless (buffer-live-p sql-buffer)
          (setq sql-buffer new-buffer)
          (run-hooks 'sql-set-sqli-hook))))))


;;;; 将当前行的语句select 语句转化为update ,insert ,delete 等语名
;;`sql-to-update' `sql-to-insert' `sql-to-select' `sql-to-delete'
(require 'sql-transform)
;;;; sql beautify
(require 'joseph-sql-beautify)
;; (autoload 'mysql-mode "joseph-mysql" "mode for editing mysql script(fn &optional ARG)" t nil)
;; (autoload 'oracle-mode "joseph-oracle" " mode for editing oracle script(fn &optional ARG)" t nil)
;; (autoload 'sqlserver-mode "joseph-sqlserver" " mode for editing sqlserver script(fn &optional ARG)" t nil)


(provide 'joseph-sql)
;;; joseph-sql.el ends here
