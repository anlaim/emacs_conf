;; -*- coding:utf-8 -*-
;;; oracle-shell-query.el --- execute a query sentence

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: oracle sqlplus script shell

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
;;  `osq-username'
;;    oracle user name.
;;    default = sql-user
;;  `osq-password'
;;    oracle user password.
;;    default = mysql-password
;;  `osq-server'
;;    Default server or host.
;;    default = ""
;;  `osq-dbname'
;;    database name .
;;    default = "orcl"
;;  `osq-port'
;;    Default port.
;;    default = 0

;;; Code:
(require 'sql)
(defcustom osq-username sql-user
  "oracle user name."
  :group 'sqlparse
  :type 'string)
(defcustom osq-password mysql-password
  "oracle user password."
  :group 'sqlparse
  :type 'string)
(defcustom osq-server ""
  "Default server or host."
  :type 'string
  :group 'SQL
  :safe 'stringp)
(defcustom osq-dbname "orcl"
  "database name ."
  :type 'string
  :group 'SQL
  :safe 'stringp)

(defcustom osq-port 0
  "Default port."
  :type 'number
  :group 'SQL
  :safe 'numberp)

;;http://stackoverflow.com/questions/1639704/sqlplus-statement-from-command-line
;;echo "select 1 from dual;" | sqlplus -s username/password@host:1521/service
(defun osq--conn-str()
  (format "sqlplus %s/%s@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s)))(CONNECT_DATA=(SERVIC E_NAME=%s)))"
          osq-username osq-password osq-server osq-port osq-dbname)
  )
(defun osq-generate-sql-script(sql)
  (let* ((tmp-script-file (make-temp-file "oracle-shell-query-"))
         (tmp-script-file-result (concat tmp-script-file ".dat"))
         )
    (with-temp-buffer
      (insert "set heading off; \n")
      (insert "set lines 1000; \n")
      (insert "set pagesize 0; \n")
      (insert "set feedback off; \n")
      (insert "set serveroutput on; \n")

      (insert (concat  "spool " tmp-script-file-result " ;\n"))
      (insert  (concat sql " ;\n"))
      (insert "spool off; \n")
      (append-to-file (point-min) (point-max) tmp-script-file)
      )
    )

  )

(defun oracle-shell-query(sql)

 )


(provide 'oracle-shell-query)
;;; oracle-shell-query.el ends here


