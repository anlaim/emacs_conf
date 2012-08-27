;; -*- coding:utf-8 -*-
;;; joseph-autopair-config.el --- joseph autopair括号配对

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
(require 'joseph-autopair)
(setq-default joseph-autopair-alist
              '( (emacs-lisp-mode . (
                                     ("\"" "\"")
                                     ("`" "'")
                                     ("(" ")")
                                     ("[" "]")
                                     ))
                 (lisp-interaction-mode . (
                                           ("\"" "\"")
                                           ("`" "'")
                                           ("(" ")")
                                           ("[" "]")
                                           ))
                 ( perl-mode . (
                             ("\"" "\"" )
                             ("'" "'")
                             ("(" ")" )
                             ("[" "]" )
                             ("{" (joseph-autopair-newline-indent-insert "}"))
                             ))
                 ( c-mode . (
                             ("\"" "\"" )
                             ("'" "'")
                             ("(" ")" )
                             ("[" "]" )
                             ("{" "}" )
                             ))
                 ( c++-mode . (
                             ("\"" "\"" )
                             ("'" "'")
                             ("(" ")" )
                             ("[" "]" )
                             ("{" "}" )
                             ))
                 (java-mode . (
                               ("\"" "\"")
                               ("'" "'")
                               ("(" ")")
                               ("[" "]")
                               ("{" (joseph-autopair-newline-indent-insert "}"))
                               ))
                 (sh-mode . ( ;;just a example
                             ("if" (joseph-autopair-newline-indent-insert "fi"))
                             ("begin" (progn
                                        (insert " end")
                                        (end-of-line)
                                        ))
                             )))
              )
(toggle-joseph-auto-pair-mode )
(provide 'joseph-autopair-config)
;;; joseph-autopair-config.el ends here
