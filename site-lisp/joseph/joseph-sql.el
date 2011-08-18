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
;;  `sql-beautify'
;;    Beautify SQL. in region or current sql sentence.
;;  `mark-sql-at-point'
;;    select current sql at point.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:
(require 'sql)

;;将当前行的语句
;;select 语句转化为update ,insert ,delete 等语名
;;`sql-to-update' `sql-to-insert' `sql-to-select' `sql-to-delete'
(require 'sql-transform)



;;;_  sqlserver-create-table depend on formated lines
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
;;;_ Sql Beautify
;;;sql beautify 将，sql 语句更容易阅读，
;;http://www.emacswiki.org/emacs/SqlBeautify
;;后端需要java的支持.
(define-key sql-mode-map "\C-\M-\\" 'sql-beautify)
(define-key sql-interactive-mode-map "\C-\M-\\" 'sql-beautify)
(eval-after-load 'sqlplus
  '(progn (define-key sqlplus-mode-map  "\C-\M-\\" 'sql-beautify)))

(defun sql-beautify()
  "Beautify SQL. in region or current sql sentence."
  (interactive)
  (unless mark-active
    (let ((sql-bounds (bounds-of-sql-at-point) ))
      (set-mark (car  sql-bounds))
      (goto-char (cdr sql-bounds))))
  (sql-beautify-region (region-beginning) (region-end)))

(defun sql-beautify-region (beg end)
  "Beautify SQL in region between beg and END."
  ;;  (interactive "r")
  (if (equal system-type 'windows-nt)
      (setenv "CLASSPATH" (concat (getenv "CLASSPATH") ";" "d:\\.emacs.d\\script\\sqlbeautify\\blancosqlformatter-0.1.1.jar"))
    (setenv "CLASSPATH" (concat (getenv "CLASSPATH") ":" (getenv "HOME") "/.emacs.d/script/sqlbeautify/blancosqlformatter-0.1.1.jar")))
  (cd "~/.emacs.d/script/sqlbeautify/")
  (let ((beautified-sql))
    (shell-command-on-region beg end "java SqlBeautify" "*sqlbeautify*" nil)
    (with-current-buffer  "*sqlbeautify*"
      (goto-char (point-min))
      (while (search-forward "\^M" nil t) ;;delete ^m
        (replace-match "" nil nil))
      (setq beautified-sql (buffer-string)))
    (goto-char beg)
    (kill-region beg end)
    (insert beautified-sql)
    (kill-buffer"*sqlbeautify*")
    ))

(defun bounds-of-sql-at-point()
  "get start and end point of current sql."
  (let ((pt (point))begin end empty-line-p empty-line-p next-line-included tail-p)
    (when (and
           (looking-at "[ \t]*\\(\n\\|\\'\\)")
           (looking-back "[ \t]*;[ \t]*" (beginning-of-line))
           )
      (search-backward-regexp "[ \t]*;[ \t]*" (beginning-of-line) t)
      )
    (save-excursion
      (skip-chars-forward " \t\n\r")
      (re-search-backward ";[ \t\n\r]*\\|\\`\\|\n[\r\t ]*\n[^ \t]" nil t)
      (setq begin (point)))
    (save-excursion
      (skip-chars-forward " \t\n\r")
      (re-search-forward "\n[\r\t ]*\n[^ \t]\\|\\'\\|[ \t\n\r]*;" nil t)
      (unless (zerop (length (match-string 0)))
        (backward-char 1))
      (skip-syntax-backward "-")
      (setq end   (point)))
    (goto-char pt)
    (cons begin end)
    )
  )

;;;_ select sql sentence at point .
(defun mark-sql-at-point()
  "select current sql at point."
  (interactive)
  (unless mark-active
    (let ((sql-bounds (bounds-of-sql-at-point) ))
      (set-mark (car  sql-bounds))
      (goto-char (cdr sql-bounds))))
  )


;;osql -U haihua -P hh  -S 172.20.68.10 -d HAIHUA_SMART -q "select * from sysobjects"
(provide 'joseph-sql)
;;; joseph-sql.el ends here
;;;_ sqlparser-mysql-complete.el

