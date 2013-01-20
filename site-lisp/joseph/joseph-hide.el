;; -*- coding:utf-8 -*-
;;; joseph-hide.el --- hide region or line

;; Copyright (C) 2011 纪秀峰

;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords: hide region or line

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
;;;; hide-region.el hide-lines.el
;;(require 'hide-region)
(autoload 'hide-region-hide "hide-region" "hide region" t)
(autoload 'hide-region-unhide "hide-region" "unhide region" t)
(global-set-key (kbd "C-z h ") (quote hide-region-hide));;隐藏选区
(global-set-key (kbd "C-z H ") (quote hide-region-unhide));;重现选区

(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
;;隐藏符合正则表达式的行，或只现示符合的行
;; (defun hide-lines (&optional arg)
;;   "Hide lines matching the specified regexp.
;; With prefix arg: Hide lines that do not match the specified regexp"
;;   (interactive "p")
;;   (if (> arg 1)
;;       (call-interactively 'hide-matching-lines)
;;       (call-interactively 'hide-non-matching-lines)
;;       ))

(global-set-key (kbd  "C-z l") 'hide-lines);;;All lines matching this regexp will be ;; hidden in the buffer
;;(define-key dired-mode-map "z" 'hide-lines)
;;加一个前缀参数C-u C-z l  则 只显示符合表达式的行
(global-set-key (kbd "C-z L" ) 'show-all-invisible);; 显示隐藏的行
(provide 'joseph-hide)
;;; joseph-hide.el ends here
