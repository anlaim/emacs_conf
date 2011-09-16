;;; joseph-java.el --- config for java   -*- coding:utf-8 -*-

;; Description: config for java
;; Time-stamp: <Joseph 2011-09-16 12:44:15 星期五>
;; Created: 2010-08-29 14:55
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: java
;; URL: http://www.emacswiki.org/emacs/joseph-java.el

;; Copyright (C) 2010, 孤峰独秀, all rights reserved.

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

(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph-util)
  )

;;my config file
;;(require 'ajc-java-complete-config)
(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

(define-key-lazy  java-mode-map ";" 'joseph-append-semicolon-at-eol)
(add-hook 'java-mode-hook 'hs-minor-mode);; hide show mode 代码折叠

(provide 'joseph-java)
;;; joseph-java.el ends here
