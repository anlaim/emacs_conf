;;; joseph-search-replace.el --- search and replace custom   -*- coding:utf-8 -*-

;; Last Updated: 纪秀峰 2012-12-06 11:28:00 星期四
;; Created: 2011-09-08 00:42
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords:isearch
;; URL: http://www.emacswiki.org/emacs/joseph-isearch.el

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
;;  `joseph-forward-symbol'
;;    直接搜索当前`symbol',并跳到相应位置
;;  `joseph-backward-symbol'
;;    直接搜索当前`symbol',并跳到相应位置(反向)
;;  `joseph-forward-symbol-or-isearch-regexp-forward'
;;    `C-s' call `isearch-forward-regexp'
;;  `joseph-backward-symbol-or-isearch-regexp-backward'
;;    `C-s' call `joseph-backward-symbol'
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;
;;  `joseph-highlight-delay'
;;    *How long to highlight the tag.
;;    default = 0.3

;;; Code:
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph_keybinding)
  (require 'thingatpt)
  (require 'wgrep)
  (require 'helm))

;;;; 渐近搜索注释
;;进入搜索模式之后，几个好用的按键
;;`C-w' 把光标下的word作为搜索关键字，可多次按下`C-w'
;;`M-y' 将`king-ring'中的内容取出作为搜索关键字
;;`M-e'光标跳到minibuffer，编辑关键字
;;`M-%' 改为用query-replace替换
;;`C-M-%' 改为用query-regex-replace替换
;;`M-r' 在正则与非正则之切换
;;`M-c' 是否忽略大小写

;;;; 停留在匹配字串的开端
;;Emacs下c-s对应渐进搜索。不过我们更多的时候需要搜索某种模式，所以用得最多的
;;还是渐进式的正则表达式搜索。正则表达式搜索有个烦人的问题：搜索结束时光标不
;;一定停留在匹配字串的开端。幸好这个问题容易解决：头两行重新绑定标准搜索键
;;c-s和c-r，把isearch换成regex-isearch。后面三行加入定制函数。关键的语句是
;;(goto-char isearch-other-end)，保证光标停留在匹配字串的开头，而不是缺省的末
;;尾。

;; Always end searches at the beginning of the matching expression.
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)

;;;; keybinding
;;`C-s' call `joseph-forward-symbol' and `C-uC-s' call `isearch-regexp-forward'
(global-set-key "\C-s" 'joseph-forward-symbol-or-isearch-regexp-forward)
(global-set-key "\C-r" 'joseph-backward-symbol-or-isearch-regexp-backward)
(global-set-key "\C-\M-s" 'isearch-forward)

(define-key  isearch-mode-map (kbd  "C-5")  'isearch-query-replace)

;;; helm-replace-string
(global-set-key (kbd "C-w C-r") 'helm-replace-string)


;;wgrep
(add-hook 'grep-setup-hook 'grep-mode-fun)
(setq wgrep-auto-save-buffer t)
(setq wgrep-enable-key "r")
(setq wgrep-change-readonly-file t)

(provide 'joseph-search-replace)
;;; joseph-isearch.el ends here
