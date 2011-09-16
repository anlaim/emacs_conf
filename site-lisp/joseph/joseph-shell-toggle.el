;; -*- coding:utf-8 -*-
;;; joseph-shell-toggle.el --- Description

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
;;; shell emacs 之间快速切换
;;(autoload 'term-toggle-cd "term-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
;;(global-set-key [M-f1] 'term-toggle-cd)
(autoload 'shell-toggle "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
(global-set-key [C-f1] 'shell-toggle-cd)
(global-set-key [C-f2] 'shell-toggle-cd)
(autoload 'shell-toggle-cd "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
(global-set-key [M-f1] 'shell-toggle)
(global-set-key [M-f2] 'shell-toggle)
;; (autoload 'term-toggle "term-toggle"
;;  "Toggles between the *terminal* buffer and whatever buffer you are editing."
;;  t)
;; (autoload 'term-toggle-cd "term-toggle"
;;  "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;; (global-set-key [M-f1] 'term-toggle)
;; (global-set-key [C-f1] 'term-toggle-cd)


(provide 'joseph-shell-toggle)
;;; joseph-shell-toggle.el ends here


