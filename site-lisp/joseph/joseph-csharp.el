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
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:
  (defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (require 'flymake)
     (flymake-mode 1)
     (require 'rfringe)
  )
  (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(provide 'joseph-csharp)
;;; joseph-csharp.el ends here


