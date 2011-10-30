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
(require 'sql)
(require 'sqlparser-sqlserver-complete)
;; (sqlserver-complete-minor-mode)

(setq sql-ms-options (quote ("-w" "65535" )))
(setq sql-ms-program "sqlcmd")

(provide 'joseph-sqlserver)
;;; joseph-sqlserver.el ends here


