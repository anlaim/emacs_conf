;; -*- coding:utf-8 -*-
;;; joseph-highlight-parentheses.el --- 高亮匹配括号

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords:

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
;;;  highlight-parentheses 高亮显示括号

(require 'highlight-parentheses)
;; (add-hook 'highlight-parentheses-mode-hook
;;           '(lambda ()
;;              (setq autopair-handle-action-fns
;;                    (append
;; 					(if autopair-handle-action-fns
;; 						autopair-handle-action-fns
;; 					  '(autopair-default-handle-action))
;; 					'((lambda (action pair pos-before)
;; 						(hl-paren-color-update)))))))


(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(setq hl-paren-background-colors (quote ("LightSteelBlue" "Purple" "red" "purple")))
(setq hl-paren-colors (quote ("Blue" "Black" "green" "orange")))

(global-highlight-parentheses-mode t)

(provide 'joseph-highlight-parentheses)
;;; joseph-highlight-parentheses.el ends here
