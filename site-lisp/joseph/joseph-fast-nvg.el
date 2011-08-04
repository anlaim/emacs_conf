;; -*- coding:utf-8 -*-
;;; joseph-fast-nvg.el --- Description

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
;;; fast navigate
(autoload 'zap-up-to-char-forward "fastnav"    "doc string." t)
(autoload 'zap-up-to-char-backward "fastnav"  "doc string." t)
(autoload 'jump-to-char-forward "fastnav"  "doc string." t)
(autoload 'jump-to-char-backward "fastnav"  "doc string." t)
(autoload 'replace-char-forward "fastnav"  "doc string." t)
(autoload 'replace-char-backward "fastnav"  "doc string." t)
(autoload 'insert-at-char-forward "fastnav"  "doc string." t)
(autoload 'insert-at-char-backward "fastnav"  "doc string." t)
(autoload 'execute-at-char-forward "fastnav"  "doc string." t)
(autoload 'execute-at-char-backward "fastnav"  "doc string." t)
(autoload 'delete-char-forward "fastnav"  "doc string." t)
(autoload 'delete-char-backward "fastnav"  "doc string." t)
(autoload 'mark-to-char-forward "fastnav"  "doc string." t)
(autoload 'mark-to-char-backward "fastnav"  "doc string." t)
(autoload 'sprint-forward "fastnav"  "doc string." t)
(autoload 'sprint-backward "fastnav"  "doc string." t)

(global-set-key "\M-k" 'zap-up-to-char-forward)
(global-set-key "\M-K" 'zap-up-to-char-backward)
(global-set-key "\M-s" 'jump-to-char-forward)
(global-set-key "\M-S" 'jump-to-char-backward)
(global-set-key "\M-m" 'mark-to-char-forward)
(global-set-key "\M-M" 'mark-to-char-backward)
(global-set-key (kbd "M-'") 'sprint-forward)
(global-set-key (kbd "M-\"") 'sprint-backward)

(global-set-key "\M-i" 'insert-at-char-forward)
(global-set-key "\M-I" 'insert-at-char-backward)
(global-set-key "\M-j" 'execute-at-char-forward)
(global-set-key "\M-J" 'execute-at-char-backward)
(global-set-key "\M-r" 'replace-char-forward)
(global-set-key "\M-R" 'replace-char-backward)
;; (global-set-key "\M-k" 'delete-char-forward)
;; (global-set-key "\M-K" 'delete-char-backward)


(provide 'joseph-fast-nvg)
;;; joseph-fast-nvg.el ends here


