;;; joseph-util.el --- util functions   -*- coding:utf-8 -*-

;; Description: util functions
;; Time-stamp: <Joseph 2011-09-12 00:41:09 星期一>
;; Created: 2011-09-12 00:40
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: util functions
;; URL: http://www.emacswiki.org/emacs/joseph-util.el

;; Copyright (C) 2011, 孤峰独秀, all rights reserved.

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

;;(add-auto-mode 'java-mode "\\.java" "\\.jsp")
;;;###autoload
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;(joseph-add-hooks 'java-mode-hook '(lambda() (message "ffffff")))
;;;###autoload
(defun joseph-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.
HOOKS can be one list or just a hook.
将function绑到一个或多个hook上
"
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (if (symbolp hooks)
        (add-hook hooks function append local)
      (add-hook (quote hooks) function append local)
      )
    ))


;;(joseph-define-key c-mode-map "\C-y" (lambda ()  (interactive) (message "ddd")))
;;(joseph-define-key 'c++-mode-map "\C-y" (lambda ()  (interactive) (message "ddd")))
;;(joseph-define-key '(org-mode-map perl-mode-map) "\C-y" (lambda ()  (interactive) (message "ddd")))
;;;###autoload
(defun joseph-define-key (mode-maps  key command)
  "`mode-maps' can be a map ,can be a list of map ,and can be a symbol of map
参数`mode-maps'可以是一个mode-map ,可以是一系列mode-mpa ,也可以是一个mode-map 的symbol
"
  (cond
   ( (keymapp mode-maps)
     (define-key mode-maps  key command))

   ((symbolp mode-maps)
    (define-key (symbol-value mode-maps)   key command)
    )
   ((listp mode-maps)
    (dolist ( mode-map mode-maps)
      (cond
       ((keymapp mode-map)
        (define-key mode-map  key command))
       ((symbolp mode-map)
        (define-key (symbol-value mode-map)   key command)
        ))
      )
    )
   )
  )

(provide 'joseph-util)
;;; joseph-util.el ends here
