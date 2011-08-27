;; -*- coding:utf-8 -*-
;;; joseph-mysql.el --- setup for mysql

;; Copyright (C) 2010 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: mysql sql

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
;;  `mysql-mode'
;;    mode for editing mysql script
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:

(require 'sqlparser-mysql-complete)

(defvar mysql-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map  (quote [tab]) 'anything-mysql-complete)
    map))

;;;###autoload
(define-minor-mode mysql-mode
  "mode for editing mysql script"
  :lighter " mysql"
  :keymap mysql-mode-map
  :group 'SQL
  (if mysql-mode
      (mysql-mode-setup))
  )

(defun mysql-mode-setup()
  "start mysql ."
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
  ;;  (sql-mysql)
  (setq mysql-user "root")
  (setq mysql-password "root")
  (setq sqlparse-mysql-default-db-name "test")
  ;;  (define-key sql-mode-map (quote [tab]) 'anything-mysql-complete)
  ;;  (define-key sql-interactive-mode-map  (quote [tab]) 'anything-mysql-complete)
  )

(provide 'joseph-mysql)
;;; joseph-mysql.el ends here


