;;; joseph-erlang.el --- erlang mode config   -*- coding:utf-8 -*-

;; Description: erlang mode config
;; Created: 2011-11-07 10:35
;; Last Updated: Joseph 2011-12-02 14:22:47 星期五
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: erlang
;; URL: http://www.emacswiki.org/emacs/joseph-erlang.el

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
(when (equal system-type 'windows-nt)
  (setq erlang-root-dir "d:/usr/erl5.8.5/")
  (setq exec-path (cons "d:/usr/erl5.8.5/bin" exec-path))
  (setenv "PATH" (concat (getenv "PATH") ";" (get-system-file-path  "d:/usr/erl5.8.5/bin")))
  )
;;; my-erlang-mode-hook
;; add Erlang functions to an imenu menu
;; (imenu-add-to-menubar "Imenu"); 在菜单栏上添加 Imenu ,我不用它，用anything-imenu 代替。 C-wi
;; M-h mark子句, C-M-h mark-function
;; C-cC-q indent-function .不过可用C-M-h 与C-M-\ 结合来完成相同的操作
;; (erlang-generate-new-clause) C-cC-j  生成一个clause 类似于输入分号 ;
;; (erlang-clone-arguments)C-cC-y clone 前一个子句的参数到当前子句,此时光标要位于当前子句的参数位置
;; M-q 可用于格式化注释
;; C-cC-k erlang-compile ,C-zs compile-dwim 我做了集成。
;; C-cC-l compile有错，时，显示错误
;; C-cC-z switch to erlang-shell buffer
;;;; (erlang-align-arrows ) C-cC-a
;; sum(L) -> sum(L, 0).
;; sum([H|T], Sum) -> sum(T, Sum + H);
;; sum([], Sum) -> Sum.

;; becomes:

;; sum(L)          -> sum(L, 0).
;; sum([H|T], Sum) -> sum(T, Sum + H);
;; sum([], Sum)    -> Sum.
;;;; other
(defun my-erlang-mode-hook ()
  (setq inferior-erlang-machine-options '("-sname" "emacs")) ;; erl -sname emacs
  (local-set-key [remap mark-paragraph] 'erlang-mark-clause) ;M-h mark子句 C-M-h mark-function
  (local-set-key [remap forward-sentence] 'erlang-end-of-clause) ;M-e 子句尾 (C-M-e function尾)
  (local-set-key [remap backward-sentence] 'erlang-beginning-of-clause) ;子句首M-a , (C-M-a function首)
  )
(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

;;; other
;; (when  (equal system-type 'gnu/linux)
;;   (setq erlang-root-dir "/usr/local/otp")
;;   (setq exec-path (cons "/usr/local/otp/bin" exec-path)))

(require 'erlang-start)

(defun insert-sth()
  (interactive)
  (insert "->")
  )
(define-key-lazy erlang-mode-map (kbd "M-C-/") 'insert-sth "erlang")

(provide 'joseph-erlang)
;;; joseph-erlang.el ends here
