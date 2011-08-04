;; -*- coding:utf-8 -*-
;;; joseph-ibuffer-config.el --- ibuffer

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
;;; ibuffer

;;加载完ibuffer.el之后，立即加载joseph_ibuffer,
;;如此，在启动emacs时不需要加载joseph_ibuffer.el.
(add-hook 'ibuffer-load-hook '(lambda () (require 'joseph_ibuffer)))
(global-set-key ( kbd "C-x C-c") 'ibuffer)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; 原来 的C-x C-c

(provide 'joseph-ibuffer-config)
;;; joseph-ibuffer-config.el ends here


