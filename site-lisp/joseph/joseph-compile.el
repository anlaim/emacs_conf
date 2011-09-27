;; -*- coding:utf-8 -*-
;;; joseph-compile.el --- config about compile

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: compile config

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

;;;; eval-after-load compile-dwim
(eval-after-load 'compile-dwim '(require 'joseph-compile-dwim))

;;;; 关于Compilation mode
(eval-after-load 'compile
  '(progn
     ;;"C-x`"  跳到下一个error处(可以在源码及compilation窗口中使用)
     ;; "C-uC-x`" 从头开始查找error
     (setq compilation-ask-about-save nil) ;;编译之前自动保存buffer
     (setq compilation-auto-jump-to-first-error t);;编译完成后自动跳到第一个error处
     ;;(setq compilation-read-command nil);;不必提示用户输入编译命令
     (setq compilation-read-command t);;
     ))
;;;; after save el .compile it auto
(autoload 'joseph_compile_current_el_without_output "joseph-byte-compile" "doc" nil )
(add-hook 'after-save-hook 'joseph_compile_current_el_without_output)

(provide 'joseph-compile)
;;; joseph-compile-dwim.el ends here


