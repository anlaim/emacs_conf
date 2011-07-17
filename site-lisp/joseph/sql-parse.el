;; -*- coding:utf-8 -*-
;;; sql-parse.el --- parse sql sentence

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: sql parse oracle mysql

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
;;;尚未完成，可能永远完不成。
(require 'thingatpt)
(require 'thingatpt+ nil t);;

(defun sqlp-column-candidates ()

  )
(defun sqlp-guest-table-name (alias)
  "find out the true table name depends on the alias.
suppose the sql is `select * from user u where u.age=11'
then the `u' is `alias' and `user' is the true table name.
"
  (let ((sql (sqlp-sql-sentence-at-point))
        (regexp (concat  "\\([a-zA-Z0-9_]+\\)[ \t]+\\(as[ \t]+\\)?" alias "[ \t,/;\n]+"))
        table-name
        )
    (if (and  sql (string-match regexp sql))
        (progn
          (setq table-name (match-string 1 sql))
          (if (string-equal "from" table-name)
              alias table-name))
          alias)
          ))

(defun sql-mode-hook-fun()
  "change the `sentence-end'"
  (make-local-variable 'sentence-end)
  (make-local-variable 'sentence-end-without-space)
  (setq sentence-end nil)
  (setq sentence-end-without-space ";")
  )
(add-hook 'sql-mode-hook 'sql-mode-hook-fun)

(defun sqlp-sql-sentence-at-point()
"get current sql sentence. "
(if (featurep 'thingatpt+)
    (thing-nearest-point 'sentence)
  (thing-at-point 'sentence)
  ))

(defun abc ()
(interactive)
(message (sqlp-guest-table-name "emp"))
  )
;; (defun abc ()
;;   (interactive)
;;   ( message ( thing-nearest-point 'sentence))
;;   )
;;  (global-set-key "" (quote abc))

(provide 'sql-parse)
;;; sql-parse.el ends here
