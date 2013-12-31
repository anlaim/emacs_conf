;; -*- coding:utf-8 -*-
;;; joseph-program.el --- some functions for programing

;; Copyright (C) 2010 纪秀峰

;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords: java csharp code

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

(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)
(eval-after-load 'csharp-mode '(add-csc-2-path-env))

(add-hook 'lua-mode-hook 'flymake-lua-load)


(setq-default gdb-many-windows t)
(add-hook 'c-mode-hook 'flymake-mode-on)
(add-hook 'c++-mode-hook 'flymake-mode-on)
;; (global-set-key [f6] 'gud-step)
;; (global-set-key [f7] 'gud-next)
;; (global-set-key [f8] 'gud-finish)


;;my config file
;;(require 'ajc-java-complete-config)
(autoload 'ajc-java-complete-mode "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(autoload 'ajc-4-jsp-find-file-hook "ajc-java-complete-config" "enable AutoJavaComplete." nil)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;; (define-key-lazy  java-mode-map ";" 'joseph-append-semicolon-at-eol)
(add-hook 'java-mode-hook 'hs-minor-mode);; hide show mode 代码折叠

(when (featurep 'w3m-load)  (require 'w3m-load))

;; M-x : w3m
(setq-default w3m-command "w3m")


(provide 'joseph-program)
;;; joseph-program.el ends here
