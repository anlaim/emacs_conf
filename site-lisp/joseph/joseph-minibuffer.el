;;; joseph-complete.el --- complete   -*- coding:utf-8 -*-

;; Description: complete
;; Created: 2011-10-07 13:49
;; Last Updated: Joseph 2011-10-07 13:54:13 星期五
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: minibuffer complete
;; URL: http://www.emacswiki.org/emacs/joseph-complete.el

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

(setq save-completions-file-name "~/.emacs.d/cache/completions")

(icomplete-mode 1)

(provide 'joseph-minibuffer)
;;; joseph-complete.el ends here
