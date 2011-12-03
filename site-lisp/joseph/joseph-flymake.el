;;; joseph-flymake.el --- flymake 相关的配置   -*- coding:utf-8 -*-

;; Description: flymake 相关的配置
;; Time-stamp: <Joseph 2011-09-23 17:47:53 星期五>
;; Created: 2011-09-18 14:15
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: flymake
;; URL: http://www.emacswiki.org/emacs/joseph-flymake.el

;; Copyright (C) 2011, 孤峰独秀, all rights reserved.

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
(require 'flymake)

(add-hook 'view-mode-hook 'flymake-mode-off)

;; (autoload 'flymake-mode "flymake" "flymake mode" t)

(provide 'joseph-flymake)
;;; joseph-flymake.el ends here
