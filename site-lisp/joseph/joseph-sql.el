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
;;  `sqlserver-create-table'
;;    做项目的时候用到的自动将excel表格格式的，创建成建表语句。region的格式如上面注释，注意顶格写
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:
(require 'sql)

;;;; 将当前行的语句select 语句转化为update ,insert ,delete 等语名
;;`sql-to-update' `sql-to-insert' `sql-to-select' `sql-to-delete'
(require 'sql-transform)
;;;; sql beautify
(require 'joseph-sql-buautify)
;; (autoload 'mysql-mode "joseph-mysql" "mode for editing mysql script(fn &optional ARG)" t nil)
;; (autoload 'oracle-mode "joseph-oracle" " mode for editing oracle script(fn &optional ARG)" t nil)
;; (autoload 'sqlserver-mode "joseph-sqlserver" " mode for editing sqlserver script(fn &optional ARG)" t nil)


;;;; sqlserver-create-table()
;;  sqlserver-create-table 会根据格式如下的一段内容，自动生成sql语句，创建这样一张表
;; STOCK_ID									IDENTITY
;; SEMIFINISHER_ID									INT
;; STOCK_WEIGHT									DECIMAL					18,2
;; STOCK_YEAR_MONTH									DATATIME
;; START_WEIGHT									DECIMAL					18,2
;; CREATE_DATETIME									DATETIME
;; CREATER_ID									NVARCHAR					20
;; UPDATE_DATETIME									DATETIME
;; UPDATER_ID									NVARCHAR					20
;; DELETE_FLG									NVARCHAR					1
;;;###autoload
(defun sqlserver-create-table (region-begin region-end)
  "做项目的时候用到的自动将excel表格格式的，创建成建表语句。region的格式如上面注释，注意顶格写"
  (interactive "r")
  (let ( (tablename (read-string "tablename:"))
        (region-string (buffer-substring-no-properties region-begin region-end))
        (case-fold-search t)
        column-scripts script)
    (with-temp-buffer
      (insert region-string)
      (insert "\n  ")
      (replace-string "datatime" "datetime" t (point-min) (point-max))
      (goto-char (point-min))
      (while (<  (line-number-at-pos )(count-lines (point-min)(point-max) ))
        (beginning-of-line)
        (forward-sexp 2)
        (when (thing-at-point 'word)
          (if (string-match "nvarchar"  (thing-at-point 'word))
              (progn
                (forward-sexp)
                (backward-sexp)
                (insert "(")
                (forward-sexp)
                (insert ") not null,")
                )
            (if (string-match "int"  (thing-at-point 'word))
                (progn
                  (insert " not null,")
                  )
              (if (string-match "datetime"  (thing-at-point 'word))
                  (progn
                    (insert " not null,")
                    )
                (if (string-match "DECIMAL"  (thing-at-point 'word))
                    (progn
                      (forward-sexp)
                      (backward-sexp)
                      (insert "(")
                      (forward-sexp 2)
                      (insert ") not null,")
                      )
                  (if (string-match "identity"  (thing-at-point 'word))
                      (progn
                        (backward-sexp )
                        (insert " int ")
                        (forward-sexp)
                        (insert "(1, 1) NOT NULL,")
                        )
                    )
                  )

                )
              )
            )
          )
        (forward-line)(end-of-line)
        )
      (setq column-scripts (buffer-substring-no-properties (point-min) (point-max)))
      )
    (with-temp-buffer
      (insert (format "USE [HAIHUA_SMART];
       GO
       SET ANSI_NULLS ON;
       GO
       SET QUOTED_IDENTIFIER ON;
       GO
       CREATE TABLE [dbo].[%s] ( \n" tablename))

      (insert column-scripts "\n")
      (insert " )
       ON [PRIMARY];
       GO ")
      (setq script (buffer-substring-no-properties (point-min) (point-max)))
      )
    (let ((buf (make-temp-name "*sql-temp-sqlserver-create-table")))
      (switch-to-buffer buf)
      (with-current-buffer buf
        (sql-mode)
        (insert script)
        (indent-region (point-min) (point-max))
        )
      )


    )
  )
;;osql -U haihua -P hh  -S 172.20.68.10 -d HAIHUA_SMART -q "select * from sysobjects"
(provide 'joseph-sql)
;;; joseph-sql.el ends here
;;;_ sqlparser-mysql-complete.el

