;;; joseph-thing.el --- config for thingopt.el   -*- coding:utf-8 -*-

;; Description: config for thingopt.el
;; Created: 2011-11-04 14:39
;; Last Updated: Joseph 2011-11-04 16:50:44 星期五
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: thing thing-at-point
;; URL: http://www.emacswiki.org/emacs/joseph-thing.el

;; Copyright (C) 2011, 纪秀峰, all rights reserved.

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
;;; 用于选中thing的绑定,如选中word line sentence 等
(global-set-key (kbd "C-M-u") 'upward-mark-thing);多次按下效果不同
(global-set-key (kbd "C-M-d") 'kill-thing)
;;
(defun set-value-for--upward-mark-thing-list(value)
  (make-local-variable 'upward-mark-thing-list)
  (setq upward-mark-thing-list value))

(setq-default upward-mark-thing-list  '(word symbol email sexp filename url (up-list . *) buffer))
(add-hook 'c-mode-common-hook '(lambda() (set-value-for--upward-mark-thing-list  '(word symbol email filename url (up-list . *) buffer)) ))
;; (add-hook 'emacs-lisp-mode-hook '(lambda() (set-value-for--upward-mark-thing-list '(word symbol sexp (up-list . *))) ))
(add-hook 'text-mode-hook '(lambda() (set-value-for--upward-mark-thing-list '(word email filename url sentence paragraph buffer)) ))


(provide 'joseph-thing)
;;; joseph-thing.el ends here
