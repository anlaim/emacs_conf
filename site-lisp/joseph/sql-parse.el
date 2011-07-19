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
;;  `sqlparse-mysql-default-db-name'
;;    default conn to this db .
;;    default = "test"
;;  `sqlparse-read-useful-info-interactively-p'
;;    read usefull info. interactively or not , like username
;;    default = t

;;; Code:
;;;尚未完成，可能永远完不成。
(require 'thingatpt)
(require 'mysql)
(require 'thingatpt+ nil t);;


(defgroup sqlparse nil
  "SQL-PARSE"
  :group 'tools
   )

(defcustom sqlparse-mysql-default-db-name "test"
  "default conn to this db ."
  :group 'sqlparse
  :type 'string)

(defcustom sqlparse-read-useful-info-interactively-p t
  "read usefull info. interactively or not , like username
,password db-name."
  :group 'sqlparse
  :type 'string)

;;(defvar sqlparse-mysql-conn  nil "a conn to mysql.")

(defun sqlparse-mysql-init()
"init. populate some variables and build a conn to mysql "
  (when sqlparse-read-useful-info-interactively-p
    (setq mysql-user (read-string "(build conn for completing)mysql-user:(default:root)" "" nil "root" ))
    (setq mysql-password  (read-passwd "(build conn for completing)mysql-passwd:(default:root)"  nil "root" ))
    (setq sqlparse-mysql-default-db-name (read-string "(build conn for completing)mysql-db-name:(default:test)" "" nil "test"))
    )
;;    (setq sqlparse-mysql-conn (mysql-connect  mysql-user mysql-password sqlparse-mysql-default-db-name ))
  )
(sqlparse-mysql-init)


;; 1 after keyword 'select' 'set' 'where' :complete  columnname.
;; 2 after keyword 'alter', 'from' 'update'  : complete tablename
;; 3 after keyword 'into' and and there isn't a
;; "\\(" between 'into' and current postion :complete tablename
;; 3.1 after keyword 'into' but there is a "(" between 'into' and current
;; position  :complete columnname
;; 4 after keyword 'values'  :complete nothing.
(defun sqlparse-parse()
  "judge now need complete tablename or column name or don't complete .
it will return 'table' ,or 'column' ,or nil.
"
(let* ((cur-pos (point))
      (sql (thing-at-point 'sentence))
      (sql-pos-info (bounds-of-thing-at-point 'sentence))
      (sql-start-pos (car sql-pos-info ))
      (sql-end-pos (cdr sql-pos-info))
      map keyword returnVal)
  (when (search-backward-regexp "\\balter\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "alter") map))
  (goto-char cur-pos)
  (when (search-backward-regexp "\\bfrom\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "from") map))
  (goto-char cur-pos)
  (when (search-backward-regexp "\\bupdate\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "update") map))
  (goto-char cur-pos)
  (when (search-backward-regexp "\\bselect\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "select") map))
  (goto-char cur-pos)
  (when (search-backward-regexp "\\bset\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "set") map))
  (goto-char cur-pos)
  (when (search-backward-regexp "\\bwhere\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "where") map))
  (goto-char cur-pos)
  (when (search-backward-regexp "\\bvalues\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "values") map))
  (goto-char cur-pos)
      (when (search-backward-regexp "\\binto\\b" sql-start-pos t 1)
    (push   (list (- cur-pos (point)) "into") map))
  (goto-char cur-pos)
  (setq map   (sort map (lambda (a b ) (when (< (car a ) (car b)) t))))
  (setq keyword  (car (cdar map)))
    (cond
     ( (null keyword)
       (setq returnVal nil)
      )
     ((string= "into" keyword)
      (progn
        ;; '(' between "into" and current position
        (if (search-backward-regexp (regexp-quote "(") (- cur-pos  (caar map)) t 1)
            (setq returnVal "column")
          (setq returnVal "table")
          )
        )
      )
     ((string-match "from\\|alter\\|update" keyword)
      (setq returnVal "table")
      )
     ((string-match "select\\|set\\|where\\|" keyword)
      (setq returnVal "column")
      )
     ((string-match "select\\|set\\|where\\|" keyword)
      (setq returnVal "column")
      )
     ((string-match "values" keyword)
      (setq returnVal nil.)
      )
     (t
      (setq returnVal nil)
      )
     )
    (goto-char cur-pos)
  returnVal
  ))
(defun mysql-complete-all ()
  (interactive)
  (let ((prefix (or  (thing-at-point 'word) "") )
        (mark (point-marker))
        (last-mark)
        )
    (insert (completing-read "complete:" ( sqlparse-context-candidates) nil t prefix ))
    (setq last-mark (point-marker))
    (goto-char (marker-position mark))
    (backward-delete-char (length prefix))
    (goto-char (marker-position last-mark))
    )
  )

(defun sqlparse-context-candidates()
"it will decide to complete tablename or columnname depend on
  current position."
(let ((context (sqlparse-parse))
      candidats)
;;  (print context)
  (cond
   ((string= "table" context)
    (setq candidats (sqlparse-mysql-tablename-or-schemaname-candidates))
    )
   ((string= "column" context)
    (setq candidats ( sqlparse-column-candidates))
    )
   ((null context)
    )
   )
;;  (print candidats)

  candidats
  )
)
;; (setq ac-ignore-case t)
;; (ac-define-source mysql-all
;;   '((candidates . (sqlparse-context-candidates ))
;;     (cache)))
;; (define-key sql-mode-map "\C-o" 'ac-complete-mysql-all)

(defun sqlparse-mysql-tablename-or-schemaname-candidates ()
  "is used to complete tablenames ,but sometimes you may
type in `schema.tablename'. so schemaname is considered as
candidats"
  ;;-s means use TAB as separate char . -N means don't print column name.
  (let (( mysql-options '("-s" "-N")))
    (mapcar 'car (mysql-shell-query
                  (format
                   "select concat( schema_name, '.') as tablename from
                 information_schema.schemata union select
                 table_name as tablename from information_schema.tables where
                 table_schema='%s'"
                   sqlparse-mysql-default-db-name)
                  ) )
    )
  )


(defun sqlparse-mysql-schemaname-candidates ()
  "all schema-name in mysql database"
  ;;-s means use TAB as separate char . -N means don't print column name.
  (let (( mysql-options '("-s" "-N")))
    (mapcar 'car (mysql-shell-query "SELECT SCHEMA_NAME FROM
    INFORMATION_SCHEMA.SCHEMATA" ) ) ))

(defun sqlparse-column-candidates ()
  "column name candidates of table in current sql "
  (let ( (sql "select column_name from information_schema.columns where 1=0")
         (table-names (sqlparse-fetch-tablename-from-sql (sqlparse-sql-sentence-at-point)))
         tablename tablenamelist schemaname)
    (while (> (length table-names) 0)
      (setq tablename (pop table-names))
      (setq tablenamelist (split-string tablename "[ \t\\.]" t))
      (if (= 1 (length tablenamelist))
          (progn
            (setq tablename (car tablenamelist))
            (setq schemaname nil)
            (setq sql (format   "%s union select column_name from information_schema.columns where table_name='%s' "  sql tablename))
            )
        (setq tablename (cadr tablenamelist))
        (setq schemaname (car tablenamelist))
        (setq sql (format   "%s union select column_name from information_schema.columns where table_name='%s' and table_schema='%s' "  sql tablename schemaname))
        ))
    (let (( mysql-options '("-s" "-N"))) ;;-s means use TAB as separate char . -N means don't print column name.
      (mapcar 'car (mysql-shell-query sql))
      )))

(defun sqlparse-fetch-tablename-from-sql (sql)
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

        (if (= 1  (count-matches  "[a-zA-Z0-9_\\.]+" 1 (point-max)))
            (push (buffer-substring 1 (point-max)) result-stack)
          (goto-char 0)
          (when (search-forward-regexp "[a-zA-Z0-9_\\.]+" (point-max) t )
            (push (match-string 0) result-stack)
            )
          )
        )
      )
    (delete "table" result-stack)
    result-stack
  ))

; TEST :
; (sqlparse-fetch-tablename-from-sql "select * from (select id from mysql.emp a , mysql.abc ad) ,abcd  as acd  where name=''")


(defun sqlparse-guess-table-name (alias)
  "find out the true table name depends on the alias.
suppose the sql is `select * from user u where u.age=11'
then the `u' is `alias' and `user' is the true table name.
"
  (let ((sql (sqlparse-sql-sentence-at-point))
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

(defun sqlparse-sql-sentence-at-point()
"get current sql sentence. "
(if (featurep 'thingatpt+)
    (thing-nearest-point 'sentence)
  (thing-at-point 'sentence)
  ))

;; (defun abc ()
;; (interactive)
;; (print ( sqlparse-column-candidates))
;;   )
(defun abc ()
  (interactive)

  (print  (sqlparse-parse))
;;  ( message ( thing-nearest-point 'sentence))
  )
 (global-set-key "" (quote abc))

(provide 'sql-parse)
;;; sql-parse.el ends here
