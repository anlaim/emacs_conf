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

;;将当前行的语句
;;select 语句转化为update ,insert ,delete 等语名
;;`sql-to-update' `sql-to-insert' `sql-to-select' `sql-to-delete'
(require 'sql-transform)
;;  sql-completion.el mysql.el 给mysql 补全表名、列名。
;; (require 'sql-completion)
;; (setq sql-interactive-mode-hook
;;       (lambda ()
;;         (define-key sql-interactive-mode-map "\t" 'comint-dynamic-complete)
;;         (sql-mysql-completion-init)))

;;;###autoload
(defun mysql ()
  (interactive)
  (setq sql-user "root")
;;  (setq sql-password "root")
  (setq  sql-database "test")
  (setq sql-server "localhost")
  (setq sql-port 3306)
  ;; MS 上，mysql 不回显
  (setq sql-mysql-options '("-C" "-t" "-f" "-n"))
;;   ;;sql-completion.el中require mysql.el 中定义以下几个变量
;;    (setq mysql-user "root")
;;    (setq mysql-password "root")
;; ;;  (setq mysql-options '("-C" "-t" "-f" "-n" ))
  (sql-mysql)
  )

;;这个包通过C-RET执行当前行的sql语句，将结果显示在另一个buffer，并进行非常好
;;的格式化

;;  (require 'plsql)
;;  (setq auto-mode-alist
;;    (append '(("\\.pls\\'" . plsql-mode) ("\\.pkg\\'" . plsql-mode)
;; 		("\\.pks\\'" . plsql-mode) ("\\.pkb\\'" . plsql-mode)
;; 		("\\.sql\\'" . plsql-mode) ("\\.PLS\\'" . plsql-mode)
;; 		("\\.PKG\\'" . plsql-mode) ("\\.PKS\\'" . plsql-mode)
;; 		("\\.PKB\\'" . plsql-mode) ("\\.SQL\\'" . plsql-mode)
;; 		("\\.prc\\'" . plsql-mode) ("\\.fnc\\'" . plsql-mode)
;; 		("\\.trg\\'" . plsql-mode) ("\\.vw\\'" . plsql-mode)
;; 		("\\.PRC\\'" . plsql-mode) ("\\.FNC\\'" . plsql-mode)
;; 		("\\.TRG\\'" . plsql-mode) ("\\.VW\\'" . plsql-mode))
;; 	      auto-mode-alist ))
;;
;;  M-x sqlplus will start new SQL*Plus session.
;;
;;  C-RET   execute command under point
;;  S-C-RET execute command under point and show result table in HTML
;;          buffer
;;  M-RET   explain execution plan for command under point
;;  M-. or C-mouse-1: find database object definition (table, view
;;          index, synonym, trigger, procedure, function, package)
;;          in filesystem
;;  C-cC-s  show database object definition (retrieved from database)
;;
;;;###autoload
(defun oracle()
  (interactive)
  (setq sql-user "scott")
  (setq sql-database "scott")
  (setq sql-server "localhost")
  (with-current-buffer(switch-to-buffer "*ORACLE*")
    (sqlplus-mode)
    )
  )

(require 'sqlplus)
(eval-after-load 'sqlplus
  '(progn
    (setq sqlplus-html-output-encoding "utf-8")
    ))

(provide 'joseph-sql)
