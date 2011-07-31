;; -*- coding:utf-8 -*-
;;; joseph-allout.el --- config for allout.el,it works like folding.el

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: folding outline-mode allout

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
;; allout.el 是emacs自带的，基于outline-mode主要做代码折叠工作，跟
;; folding.el很相似，都是通过在注释中加入一些特殊的标志，来进行代码的折叠，
;; 比folding.el 的优胜之处在于，它有层次感.

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
;;;_* code start
(setq-default allout-command-prefix "\C-cf")

(require 'allout)
(setq-default allout-keybindings-list
              '(
                                        ; Motion commands:
                ("n" allout-next-visible-heading)                    ; default \C-n
                ("p" allout-previous-visible-heading)                ; default \C-p
                ("u" allout-up-current-level)                        ; default \C-u
                ("f" allout-forward-current-level)                   ; default \C-f
                ("b" allout-backward-current-level)                  ; default \C-b
                ("a" allout-beginning-of-current-entry)              ; default \C-a
                ("e" allout-end-of-entry)                            ; default \C-e
                                        ; Exposure commands:    ; default
                ("C-i" allout-show-children)                           ; default \C-i
                ("s" allout-show-current-subtree)                    ; default \C-s
                ("h" allout-hide-current-subtree)                    ; default \C-h
                ("t" allout-toggle-current-subtree-exposure)         ; default \C-t
                ("h" allout-hide-current-subtree)
                ("o" allout-show-current-entry)
                ("!" allout-show-all)
                ("x" allout-toggle-current-subtree-encryption)
                                        ; Alteration commands:
                (" " allout-open-sibtopic)
                ("." allout-open-subtopic)
                ("," allout-open-supertopic)
                ("'" allout-shift-in)
                (">" allout-shift-in)
                ("<" allout-shift-out)
                ("\C-m" allout-rebullet-topic)
                ("*" allout-rebullet-current-heading)
                ("#" allout-number-siblings)
                ("\C-k" allout-kill-line t)
                ([?\M-k] allout-copy-line-as-kill t)
                ("\C-y" allout-yank t)
                ([?\M-y] allout-yank-pop t)
                ("\C-k" allout-kill-topic)
                ([?\M-k] allout-copy-topic-as-kill)
                                        ; Miscellaneous commands:
                                        ;([?\C-\ ] allout-mark-topic)
                ("@" allout-resolve-xref)
                ("=c" allout-copy-exposed-to-buffer)
                ("=i" allout-indented-exposed-to-buffer)
                ("=t" allout-latexify-exposed)
                ("=p" allout-flatten-exposed-to-buffer)))
;;(setq    allout-mode-map M-c-map)
(setq allout-default-layout  '(-1 : 0))
(setq allout-layout t)
(setq allout-auto-activation t)

(allout-init t)

(make-local-variable 'allout-primary-bullet)
(make-local-variable 'comment-start)
(defun my-c-mode-allout-hook()
  (setq allout-primary-bullet "\/\/\/_*")
  (setq comment-start "\/")
  (allout-mode t)
  )
(defun my-el-mode-allout-hook()
  (setq allout-primary-bullet ";;;_*")
  (allout-mode t)
  )
(add-hook 'c-mode-hook 'my-c-mode-allout-hook)
(add-hook 'emacs-lisp-mode-hook 'my-el-mode-allout-hook)
(add-hook 'lisp-interaction-mode-hook 'my-el-mode-allout-hook)



;; (add-hook 'allout-mode-hook
;;           (lambda () (local-set-key "\M-c" outline-mode-prefix-map)))))
(provide 'joseph-allout)
;;; joseph-allout.el ends here


