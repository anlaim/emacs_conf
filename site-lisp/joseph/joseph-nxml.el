;;; joseph-nxml.el --- Description   -*- coding:utf-8 -*-

;; Description: Description
;; Time-stamp: <Joseph 2010-08-29 14:40:51 星期日>
;; Created: 2010-08-29 14:37
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords:
;; URL:http://www.emacswiki.org/emacs/joseph-nxml.el

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

(autoload 'nxml-complete "nxml-mode" "nxml-complete." t)
;;C-c C-x 插入<?xml version="1.0" encoding="utf-8"?>
;;Set the schema for this buffer automatically and turn on `rng-validate-mode'.
;;C-c C-s C-a (rng-auto-set-schema-and-validate)
;;根据当前文件的内容决定用哪一个schema 进行补全验证等,
;;C-return  nxml-complete
(add-hook 'nxml-mode-hook (lambda ()
                            (local-set-key "\t" 'nxml-complete)
                            (local-set-key "\M-2" 'nxml-complete)
                            (setq yas/fallback-behavior 'nxml-complete)
                            ))
;;C-c C-b 在下一行补齐 end tag  ,如 <head 时输入
;;C-c TAB  在同一行关闭end tag
;;C-c C-f 关闭最近的未关闭的tag ,好像与C-c TAB 有点类似
;;树形导航
;;C-M-u 上一层元素
;;C-M-d 下一层元素
(setq-default nxml-auto-insert-xml-declaration-flag nil)
(setq-default nxml-attribute-indent 2)
(setq-default nxml-bind-meta-tab-to-complete-flag t)
(setq-default nxml-slash-auto-complete-flag t);;"</" 自动补全
;;<h1 > hello,-|- world </h1>  (-|-代表光标) C-c RET会分之为
;;<h1>hello,</h1> <h1>world</h1>
;;C-c RET (nxml-split-element)


(defun alexott/nxml-mode-hook ()
  (local-set-key "\C-c/" 'nxml-finish-element)
  (auto-fill-mode)
  (rng-validate-mode)
  (unify-8859-on-decoding-mode)
  (hs-minor-mode 1)
  )
(add-hook 'nxml-mode-hook 'alexott/nxml-mode-hook)

;;hideshow for nxml
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "\\|<[^/>]&>\\|<[^/][^>]*[^/]>"
               ""
               nil))

(provide 'joseph-nxml)
;;; joseph-nxml.el ends here


