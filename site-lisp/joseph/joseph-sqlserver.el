;; -*- coding:utf-8 -*-
;;; joseph-sqlserver.el --- setup for MS SQL SERVER

;; Copyright (C) 2010 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: sql server ms

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
;;;; byte compile
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  )
;;;; require
(require 'sql)
(require 'sqlparser-sqlserver-complete)

(setq sql-ms-options (quote ("-w" "65535" ))) ;长度设的长一点，免折行。
(setq sql-ms-program "sqlcmd")                ; 不使用默认的osql.exe ,似乎sqlcmd 比osql快。,并且osql有被微软弃用的可能。

;;;###autoload
(define-derived-mode sqlserver-mode sql-mode "MSSQL"
  (sqlserver-complete-minor-mode))

;;;###autoload
(defadvice sql-ms (around start-sqlserver-complete-minor-mode activate)
  "enable `sqlserver-complete-minor-mode' minor mode."
  ad-do-it
  (sqlserver-complete-minor-mode))

(provide 'joseph-sqlserver)
;;; joseph-sqlserver.el ends here


