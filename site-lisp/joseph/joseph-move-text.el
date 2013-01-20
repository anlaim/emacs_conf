;; -*- coding:utf-8 -*-
;;; joseph-move-text.el --- Description

;; Copyright (C) 2011 纪秀峰

;; Author: 纪秀峰  jixiuf@gmail.com
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
;;; 上下移动当前行, (Eclipse style) `M-up' and `M-down'
;; 模仿eclipse 中的一个小功能，用;alt+up alt+down 上下移动当前行
;;不仅当前行,也可以是一个选中的区域
;;; (require 'move-text)
;;default keybinding is `M-up' and `M-down'
(autoload 'move-text-up "move-text" "move current line or selected regioned up" t)
(autoload 'move-text-down "move-text" "move current line or selected regioned down" t)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

(provide 'joseph-move-text)
;;; joseph-move-text.el ends here
