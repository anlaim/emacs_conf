;; -*- coding:utf-8 -*-
;;; joseph-outline.el --- outline-mode outline-minor-mode

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: outline folding

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
(require 'outline)
;;(setq outline-regexp "[*]+")
(setq-default outline-mode-prefix-map
              (let ((map (make-sparse-keymap)))
                (define-key map "@" 'outline-mark-subtree)
                (define-key map "\M-n" 'outline-next-visible-heading)
                (define-key map "\M-p" 'outline-previous-visible-heading)
                (define-key map "\M-i" 'show-children)
                (define-key map "\M-s" 'show-subtree)
                (define-key map "\M-d" 'hide-subtree)
                (define-key map "\M-u" 'outline-up-heading)
                (define-key map "\M-f" 'outline-forward-same-level)
                (define-key map "\M-b" 'outline-backward-same-level)
                (define-key map "\M-t" 'hide-body)
                (define-key map "\M-a" 'show-all)
                (define-key map "\M-c" 'hide-entry)
                (define-key map "\M-e" 'show-entry)
                (define-key map "\M-l" 'hide-leaves)
                (define-key map "\M-k" 'show-branches)
                (define-key map "\M-q" 'hide-sublevels)
                (define-key map "\M-o" 'hide-other)
                (define-key map "\M-^" 'outline-move-subtree-up)
                (define-key map "\M-v" 'outline-move-subtree-down)
                (define-key map [(control ?<)] 'outline-promote)
                (define-key map [(control ?>)] 'outline-demote)
                (define-key map "\C-m" 'outline-insert-heading)
                ;; Where to bind outline-cycle ?
                map))
(add-hook 'outline-minor-mode-hook
          (lambda () (local-set-key "\M-c"
                                    outline-mode-prefix-map)))
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'lisp-interaction-mode-hook 'outline-minor-mode)
(add-hook 'java-mode-hook 'outline-minor-mode)


(provide 'joseph-outline)
;;; joseph-outline.el ends here


