;; -*- coding:utf-8 -*-
;;; joseph-program.el --- some functions for programing

;; Copyright (C) 2010 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: java csharp code

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
;;  `csharp-set-get'
;;    generate sets and gets for c#.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:
;;;###autoload
(defun csharp-set-get(beg end)
  "generate sets and gets for c#."
  (interactive "r")
  (let ((region-string (buffer-substring-no-properties beg end))
        var var-type   capitalize-var set-gets)
    (with-temp-buffer
      (insert region-string) (insert "\n")
      (goto-char (point-min))(end-of-line)
      (while (not (eobp))
        (if (string-match "^[ \t]*$" (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
            (progn (forward-line)(end-of-line))
          (backward-sexp)
          (setq var (thing-at-point 'sexp))
          (backward-sexp)
          (setq var-type (thing-at-point 'sexp))
          (end-of-line)
          (setq capitalize-var (capitalize var))
          (insert (format  "\npublic %s %s \n" var-type  capitalize-var))
          (insert "{\n")
          (insert (format "set {%s=value ;}\n" var))
          (insert (format "get {return %s ;}\n" var))
          (insert "}\n")
          (forward-line)(end-of-line)))
      (indent-region (point-min) (point-max))
      (setq set-gets (buffer-string))
      )
    (kill-region beg end)
    (insert set-gets)

    )

  )

(provide 'joseph-program)
;;; joseph-program.el ends here


