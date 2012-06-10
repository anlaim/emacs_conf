;; -*- coding:utf-8 -*-
;;; joseph-auto-document.el --- 自动为emacs文件编写时生成相应的文档，如Commentary

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: auto docuement el

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

;;;; auto-document 为el文件自动生成doc
(autoload 'auto-document "auto-document" "generate doc for el files" t)
(autoload 'auto-document-maybe "auto-document" "generate doc for el files" )
;;前提是 文档中必须有";;; Commentary:" 然后它会在其后自动插入相应的内容
;;如 ";;; Customizable Options:"
;;使用方法,在el文件中运行`auto-document'命令
;;(require 'auto-document)
;; If you want to update auto document before save, add the following.
;;如果想要在文件保存的时候自动插入及更新相应的文档内容,可以加入这个hook
;; (add-to-list 'before-save-hook 'auto-document-maybe)

(provide 'joseph-auto-document)
;;; joseph-auto-document.el ends here
