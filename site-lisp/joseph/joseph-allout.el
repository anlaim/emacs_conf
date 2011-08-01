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
;;;_ code
(setq-default allout-command-prefix "\C-c\C-f")
(require 'allout)
;;;_. Gnu Emacs 23版的allout
(when (string-match "GNU Emacs 23" (emacs-version))
  (setq-default allout-keybindings-list
                '(
                                        ; Motion commands:
                  ("\C-n" allout-next-visible-heading)                    ; default \C-n
                  ("\C-p" allout-previous-visible-heading)                ; default \C-p
                  ("\C-u" allout-up-current-level)                        ; default \C-u
                  ("\C-f" allout-forward-current-level)                   ; default \C-f
                  ("\C-b" allout-backward-current-level)                  ; default \C-b
                  ("\C-a" allout-beginning-of-current-entry)              ; default \C-a
                  ("\C-e" allout-end-of-entry)                            ; default \C-e
                                        ; Exposure commands:    ; default
                  ("\C-i" allout-show-children)                           ; default \C-i
                  ("s" allout-show-current-subtree)                    ; default \C-s
                  ("\C-s" allout-show-current-subtree)
                  ("h" allout-hide-current-subtree)                    ; default \C-h
                  ("H" allout-hide-bodies)
                  ("\C-w" allout-hide-bodies)
                  ("t" allout-toggle-current-subtree-exposure)         ; default \C-t
                  ("\C-t" allout-toggle-current-subtree-exposure)
                  ("o" allout-show-current-entry)
                  ("!" allout-show-all)
                  ("\C-a" allout-show-all)
                  ("x" allout-toggle-current-subtree-encryption)
                                        ; Alteration commands:
                  (" " allout-open-sibtopic)
                  ("." allout-open-subtopic)
                  ("\C-." allout-open-subtopic)
                  ("," allout-open-supertopic)
                  ("'" allout-shift-in)
                  ("\C-'" allout-shift-in)
                  (">" allout-shift-in)
                  ("\C->" allout-shift-in)
                  ("<" allout-shift-out)
                  ("\C-<" allout-shift-out)
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
  )
;;;_.  Gnu Emacs 24 版的allout
(when (string-match "GNU Emacs 24" (emacs-version))
  (setq-default allout-prefixed-keybindings
                '(("[(control ?n)]" allout-next-visible-heading)
                  ("[(control ?p)]" allout-previous-visible-heading)
                  ("[(control ?u)]" allout-up-current-level)
                  ("[(control ?f)]" allout-forward-current-level)
                  ("[(control ?b)]" allout-backward-current-level)
                  ("[(control ?a)]" allout-beginning-of-current-entry)
                  ("[(control ?e)]" allout-end-of-entry)
                  ("[(control ?i)]" allout-show-children)
                  ("[(control ?s)]" allout-show-current-subtree)
                  ("[?s]" allout-show-current-subtree)
                  ("[(control ?t)]" allout-toggle-current-subtree-exposure)
                  ;; Let user customize if they want to preempt describe-prefix-bindings ^h use.
                  ;;    ("[(control ?h)]" allout-hide-current-subtree)
                  ("[?h]" allout-hide-current-subtree)
                  ("[(control ?h)]" allout-hide-current-subtree)
                  ("[?H]" allout-hide-bodies)
                  ("[(control ?w)]" allout-hide-bodies)
                  ("[(control ?o)]" allout-show-current-entry)
                  ("[?o]" allout-show-current-entry)
                  ("[?!]" allout-show-all)
                  ("[(control ?a)]" allout-show-all)
                  ("[?x]" allout-toggle-current-subtree-encryption)
                  ("[? ]" allout-open-sibtopic)

                  ("[?.]" allout-open-subtopic)
                  ("[(control ?.)]" allout-open-subtopic)

                  ("[?,]" allout-open-supertopic)
                  ("[(control ?,)]" allout-open-supertopic)
                  ("[?']" allout-shift-in)
                  ("[?>]" allout-shift-in)
                  ("[?<]" allout-shift-out)
                  ("[(control ?m)]" allout-rebullet-topic)
                  ("[?*]" allout-rebullet-current-heading)
                  ("[?#]" allout-number-siblings)
                  ("[(control ?k)]" allout-kill-topic)
                  ("[(meta ?k)]" allout-copy-topic-as-kill)
                  ("[?@]" allout-resolve-xref)
                  ("[?=?c]" allout-copy-exposed-to-buffer)
                  ("[?=?i]" allout-indented-exposed-to-buffer)
                  ("[?=?t]" allout-latexify-exposed)
                  ("[?=?p]" allout-flatten-exposed-to-buffer)
                  )
                )
  (allout-compose-and-institute-keymap)
  )
;;;_. common config
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
  (allout-hide-bodies)
  )
(defun my-el-mode-allout-hook()
  (setq allout-primary-bullet ";;;_*")
  (allout-mode t)
  (allout-hide-bodies)
  )
(add-hook 'c-mode-hook 'my-c-mode-allout-hook)
(add-hook 'emacs-lisp-mode-hook 'my-el-mode-allout-hook)
(add-hook 'lisp-interaction-mode-hook 'my-el-mode-allout-hook)



;; (add-hook 'allout-mode-hook
;;           (lambda () (local-set-key "\M-c" outline-mode-prefix-map)))))
(provide 'joseph-allout)
;;; joseph-allout.el ends here


