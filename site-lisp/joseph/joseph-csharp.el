;; -*- coding:utf-8 -*-
;;; joseph-csharp.el --- setup for csharp

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: csharp

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
;;  `csharp-setter-getter'
;;    generate sets and gets for c#.
;;  `csharp-db-2-seter-getter'
;;    generate setter getter depends on db
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:
;;;; c# hook
  (defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (require 'flymake)
     (flymake-mode 1)
     (require 'rfringe)
  )
  (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

;;;; (csharp-set-get)
;; 将选中区域内的所有格式为
;; private DateTime LAST_MONTH_CHECKSTOCK_DATE;
;; private DateTime last;
;; 的变量，替换成
;; private DateTime LAST_MONTH_CHECKSTOCK_DATE;
;; public DateTime Last_Month_Checkstock_Date
;; {
;; set {LAST_MONTH_CHECKSTOCK_DATE=value ;}
;; get {return LAST_MONTH_CHECKSTOCK_DATE ;}
;; }
;; private DateTime last;
;; public DateTime Last
;; {
;; set {last=value ;}
;; get {return last ;}
;; }
;;;###autoload
(defun csharp-setter-getter(beg end)
  "generate sets and gets for c#."
  (interactive "r")
  (let ((region-string (buffer-substring-no-properties beg end))
        var var-type   capitalize-var set-gets)
    (with-temp-buffer
      (csharp-mode)
      (insert region-string) (insert "\n")
      (goto-char (point-min))(end-of-line)
      (while (not (eobp))
        (if (string-match "^[ \t]*$" (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
            (progn (forward-line)(end-of-line))
          (backward-sexp)
          (setq var (thing-at-point 'sexp))
          (backward-sexp)
          (setq var-type (thing-at-point 'sexp))
          (kill-region (point-at-bol) (point-at-eol))
          (insert (csharp-a-setter-getter var-type var))
          (forward-line)(end-of-line)))
      (indent-region (point-min) (point-max))
      (setq set-gets (buffer-string))
      )
    (kill-region beg end)
    (insert set-gets)
    )
  )
;;;; (csharp-db-2-seter-getter)
;;将格式如下的内容，生成csharp的setter getter
;; STOCK_ID									IDENTITY
;; SEMIFINISHER_ID									INT
;; STOCK_WEIGHT									DECIMAL
;; STOCK_YEAR_MONTH									DATATIME
;; START_WEIGHT									DECIMAL
;; CREATE_DATETIME									DATETIME
;; CREATER_ID									NVARCHAR
;; UPDATE_DATETIME									DATETIME
;; UPDATER_ID									NVARCHAR
;; DELETE_FLG									NVARCHAR
;;;###autoload
(defun csharp-db-2-seter-getter(beg end)
  "generate setter getter depends on db "
  (interactive "r")
  (let ((region-string (buffer-substring-no-properties beg end))
        (case-fold-search t)
        field all-seter-getter
        )
    (with-temp-buffer
      (insert region-string)
      (insert "\n  ")
      (csharp-mode )
      (replace-string "datatime" "datetime" t (point-min) (point-max))
      (goto-char (point-min))
      (while (<  (line-number-at-pos )(count-lines (point-min)(point-max) ))
        (beginning-of-line)
        (forward-sexp 2)
        (when (thing-at-point 'sexp)
          (cond
           ((string-match "\\bnvarchar\\b\\|\\bchar\\b"  (thing-at-point 'sexp))
            (backward-sexp 2)
            (setq field   (thing-at-point 'sexp))
            (kill-region (point-at-bol) (point-at-eol))
            (insert (csharp-a-setter-getter "string" field)))
           ( (string-match "\\bint\\b\\|\\bidentity\\b"  (thing-at-point 'sexp))
             (backward-sexp 2)
             (setq field   (thing-at-point 'sexp))
             (kill-region (point-at-bol) (point-at-eol))
             (insert (csharp-a-setter-getter "int" field)))
           ((string-match "\\bdatetime\\b"  (thing-at-point 'sexp))
            (backward-sexp 2)
            (setq field   (thing-at-point 'sexp))
            (kill-region (point-at-bol) (point-at-eol))
            (insert (csharp-a-setter-getter "DateTime" field)))
           ( (string-match "\\bdecimal\\b"  (thing-at-point 'sexp))
             (backward-sexp 2)
             (setq field   (thing-at-point 'sexp))
             (kill-region (point-at-bol) (point-at-eol))
             (insert (csharp-a-setter-getter "decimal" field)))
           ))
        (forward-line)(end-of-line))
      (indent-region (point-min) (point-max))
      (setq all-seter-getter (buffer-substring-no-properties (point-min) (point-max)))
      )
    (goto-char beg)
    (kill-region beg end )
    (insert all-seter-getter)
    )
  )

;; (csharp-a-setter-getter "string" "nameAge")
;; (csharp-a-setter-getter "string" "FIRST_NAME")
(defun csharp-a-setter-getter(class-name object-name)
  (let(field property)
    (if (string-match "[A-Z0-9_]" object-name)
        (progn (setq field (concat "_" object-name))
               (setq property object-name))
      (setq field object-name)
      (setq property (capitalize object-name)))
    (with-temp-buffer
      (insert (concat "private " class-name " " field ";\n"))
      (insert (concat "public  " class-name " " property "\n"))
      (insert "{\n")
      (insert (format "   set { %s = value ; }\n" field))
      (insert (format "   get { return %s  ; }\n" field))
      (insert "}\n")
      (buffer-string))))
(provide 'joseph-program)

(provide 'joseph-csharp)
;;; joseph-csharp.el ends here


