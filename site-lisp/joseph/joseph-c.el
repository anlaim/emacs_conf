;;; joseph-c.el --- config for c    -*- coding:utf-8 -*-

;; Description: config for c
;; Created: 2011-10-22 12:05
;; Last Updated: Joseph 2011-10-22 17:19:40 星期六
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: c
;; URL: http://www.emacswiki.org/emacs/joseph-c.el

;; Copyright (C) 2011, 纪秀峰, all rights reserved.

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
;;; byte
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
  (require 'joseph_byte_compile_include)
  (require 'joseph-util)
  )
;;; config

(define-key-lazy c-mode-base-map ";" 'joseph-append-semicolon-at-eol  'cc-mode)

(provide 'joseph-c)
;;; joseph-c.el ends here