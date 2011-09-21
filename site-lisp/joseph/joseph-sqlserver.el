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


;; (defvar sqlserver-complete-minor-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map  (quote [tab]) 'anything-sqlserver-complete)
;;     map))
;; (defvar  sqlserver-complete-minor-mode-hook nil)

;; ;;;###autoload
;; (define-minor-mode sqlserver-complete-minor-mode
;;   "mode for editing sqlserver script"
;;   :lighter " MSSqlC"
;;   :keymap sqlserver-complete-minor-mode-map
;;   :group 'SQL
;;   (if sqlserver-complete-minor-mode
;;       (run-hooks 'sqlserver-complete-minor-mode-hook)))


(add-hook  'sqlserver-complete-minor-mode-hook 'sqlserver-complete-minor-mode-setup)

(defun sqlserver-complete-minor-mode-setup()
  (setq sql-user "haihua")
  (setq sql-database "HAIHUA_MRP_Test_jixf")
  (setq sql-server "172.20.68.10")

  (setq sqlserver-connection-info
    '((username . "haihua")
      (password . "hh")
      (server-instance . "172.20.68.10")
      (dbname . "HAIHUA_MRP_Test_16"))
    )
  (setq sqlserver-cmd 'sqlcmd)
  )


(provide 'joseph-sqlserver)
;;; joseph-sqlserver.el ends here


