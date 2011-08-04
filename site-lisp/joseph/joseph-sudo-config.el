;; -*- coding:utf-8 -*-
;;; joseph-sudo-config.el --- sudo

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
;;; joseph_sudo 通过sudo 以root 用户身份打开当前文件(一键切换)
(when (eq system-type 'gnu/linux)
  ;;emacs 自带一个功能实现编辑只读文件C-x C-q  toggle-read-only
  ;; now you can use "C-c o" to toggle between root and common user to edit current file
  (require 'joseph_sudo)

  (global-set-key "\C-x\C-r" 'joseph-sudo-find-file)
  ;;   (add-hook 'find-file-hooks 'joseph-sudo-find-file-hook);; find-file-hooks 是加载完file 之后调用的一个hook
  (global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
  ;;(global-set-key (kbd "C-c C-r") 'wl-sudo-find-file) ;;
  )
(provide 'joseph-sudo-config)
;;; joseph-sudo-config.el ends here


