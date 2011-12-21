;;; joseph-erlang.el --- erlang mode config   -*- coding:utf-8 -*-

;; Description: erlang mode config
;; Created: 2011-11-07 10:35
;; Last Updated: Joseph 2011-12-21 11:56:00 星期三
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
;;  `distel-load-shell'
;;    Load/reload the erlang shell connection to a distel node
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:

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

;; (defun flymake-erlang-init ()
;;   "need ~/.emacs.d/bin/eflymake.c ~/.emacs.d/bin/eflymake.exe ~/.emacs.d/bin/eflymake.erl."
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "eflymake" (list (expand-file-name "~/.emacs.d/bin/eflymake.erl") local-file))))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

(eval-after-load 'erlang
  '(progn
     (setq inferior-erlang-machine-options '("-sname" "emacs@localhost")) ;; erl -name emacs
     (when (equal system-type 'windows-nt)
       (setq erlang-root-dir "d:/usr/erl5.8.5/")
       (setq exec-path (cons "d:/usr/erl5.8.5/bin" exec-path))
       (setq inferior-erlang-machine-options '("-sname" "emacs@localhost")) ;; erl -sname emacs  ; -sname means short name
       (setenv "PATH" (concat (getenv "PATH") ";" (get-system-file-path  "d:/usr/erl5.8.5/bin")))
       )
     (require 'erlang-flymake) ;erlang 自带的flymake .
     (require 'distel)
     (distel-setup)))

(defun my-erlang-mode-hook ()
  (local-set-key [remap mark-paragraph] 'erlang-mark-clause) ;M-h mark子句 C-M-h mark-function
  (local-set-key [remap forward-sentence] 'erlang-end-of-clause) ;M-e 子句尾 (C-M-e function尾)
  (local-set-key [remap backward-sentence] 'erlang-beginning-of-clause) ;子句首M-a , (C-M-a function首)
  (local-set-key  [(control return)]  'erl-complete) ;;tab ,补全时，需要先启动一个node C-cC-z 可做到。然后连接到此节点。即可进行补全。
  (local-set-key "\M-."  'erl-find-source-under-point )
  (local-set-key "\M-,"  'erl-find-source-unwind)
  (local-set-key "\M-*"  'erl-find-source-unwind )
  (local-set-key (kbd "M-C-/") 'insert-sth )
  ;; (when (not buffer-read-only)(flymake-mode 1))
  (eval-after-load 'auto-complete '(setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
  )

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
(add-hook 'erlang-shell-mode-hook 'my-erlang-mode-hook)

(defun my-erlang-shell-mode-hook ()
  (local-set-key "\C-g"  'keyboard-quit-or-bury-buffer-and-window)
  (local-set-key (kbd"C-c C-z")  'bury-buffer-and-window)
  )
(add-hook 'erlang-shell-mode-hook 'my-erlang-shell-mode-hook)


(require 'erlang-start)

(defun insert-sth()
  (interactive)
  (insert "->")
  )
;;;; erlang-dired-mode
(require 'erlang-dired-mode)
(define-key erlang-dired-mode-map (kbd "C-z s") 'erlang-dired-emake) ;compile
(define-key erlang-dired-mode-map (kbd "C-z C-s") 'erlang-dired-emake) ;compile

;;;; 当打开erl  文件时，自动启动一个shell 以便distel进行补全
(add-hook 'erlang-mode-hook '(lambda () (unless erl-nodename-cache (distel-load-shell))))
(defun distel-load-shell ()
  "Load/reload the erlang shell connection to a distel node"
  (interactive)
  ;; Set default distel node name
  (setq erl-nodename-cache 'emacs@localhost)
  (setq derl-cookie "cookie_for_distel") ;;new added can work
  (setq distel-modeline-node "distel")
  (force-mode-line-update)
  ;; Start up an inferior erlang with node name `distel'
  (let ((file-buffer (current-buffer))
        (file-window (selected-window)))
    (setq inferior-erlang-machine-options '("-sname" "emacs@localhost" "-setcookie" "cookie_for_distel"))
    (switch-to-buffer-other-window file-buffer)
    (inferior-erlang)
    (select-window file-window)
    (switch-to-buffer file-buffer)))

(provide 'joseph-erlang)
;;; joseph-erlang.el ends here
