;; -*- coding:utf-8 -*-
;;; joseph-quick-jump.el --- Description

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
;;;; quick-jump.el 我写的quick-jump

(autoload 'quick-jump-push-marker "quick-jump"
  " push current marker in ring. you can jump back" t)
(autoload 'quick-jump-go-back "quick-jump"
  "Go back in `qj-marker-ring'")
(autoload 'quick-jump-go-forward "quick-jump"
  "Go forward in `qj-marker-ring'")
(autoload 'quick-jump-clear-all-marker "quick-jump"
  "clear all marker in `qj-marker-ring'.")
(autoload 'quick-jump-default-keybinding "quick-jump"
  "default keybindings for quick-jump" nil)
(global-set-key (kbd "C-,") 'quick-jump-go-back)
(global-set-key (kbd "C-.") 'quick-jump-push-marker)
(global-set-key (kbd "C-<") 'quick-jump-go-forward)
(global-set-key (kbd "C->") 'quick-jump-clear-all-marker)


(provide 'joseph-quick-jump)
;;; joseph-quick-jump.el ends here


