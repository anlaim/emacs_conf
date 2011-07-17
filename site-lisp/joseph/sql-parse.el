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
(defun sqlp-fetch-tablename-from-sql (sql)
  "return a list of tablenames from a sql-sentence."
  (let ((sql-stack (list sql)) ele pt result-stack tablename-stack )
    (while (> (length sql-stack) 0)
      (setq ele (pop sql-stack))
      (with-temp-buffer
        (insert ele)
        (goto-char (point-min))
        (while (search-forward-regexp "[ \t]*(" (point-max) t)
          (forward-char -1)
          (setq pt (point))
          (forward-sexp)
          (push (buffer-substring (1+ pt)  (1- (point))) sql-stack)
          (delete-region  pt (point))
          (insert "table"))
        (push (buffer-substring (point-min) (point-max))  result-stack)
        ))
    (print result-stack)
    (while (> (length result-stack) 0)
      (setq ele (pop result-stack))
      (with-temp-buffer
        (insert ele)
        (goto-char (point-min))
        (when  (search-forward-regexp "[ \t]+from[ \t]+" (point-max) t)
          (delete-region (point-min) (point))
          (when (search-forward-regexp "[ \t]+where[ \t]+" (point-max) t)
            (backward-word)
            (delete-region (point) (point-max)))
          (goto-char (point-min))
          (while (search-forward-regexp "," (point-max) t)
            (push (buffer-substring 1 (1- (point))) tablename-stack)
            (delete-region  1 (point))
            )
          (push (buffer-substring (point-min) (point-max)) tablename-stack)
          )
        )
      )
    (while (> (length tablename-stack) 0)
      (setq ele (pop tablename-stack))
      (with-temp-buffer
        (insert ele)
        (goto-char (point-min))
        (replace-regexp "\n" " ")
        (goto-char (point-min))
        (replace-regexp "[ \t]+as[ \t]+" " ")
        (goto-char (point-min))
        (delete-horizontal-space)
        (goto-char (point-max))
        (delete-horizontal-space)

        (if (= 1  (count-words-region 1 (point-max)))
            (push (buffer-substring 1 (point-max)) result-stack)
          (goto-char 0)
          (push (thing-at-point 'word) result-stack)
          )
        )
      )
    (delete "table" result-stack)
    (print result-stack)
  ))

;; (sqlp-fetch-tablename-from-sql "select * from (select id from emp) ,abc
;;  as a  where name=''")


(defun sqlp-guess-table-name (alias)
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
