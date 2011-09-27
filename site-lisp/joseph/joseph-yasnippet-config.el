;; -*- coding:utf-8 -*-
;;; jospeh-yasnippet-config.el --- config for yasnippet

;; Copyright (C) 2010 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: yasnippet

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
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph-util))

(defvar yasnippet-snippet-path "~/.emacs.d/yasnippet-snippet" "Path of `yasnippet-snippet'")
(require 'yasnippet) ;;
(require 'dropdown-list)

(setq-default yas/root-directory yasnippet-snippet-path)
(yas/load-directory yas/root-directory)
(setq-default yas/prompt-functions '( yas/dropdown-prompt yas/x-prompt  yas/ido-prompt yas/completing-prompt)) ;;设置提示方式，文本/X
(yas/global-mode 1)
(define-key-lazy org-mode-map [(tab)] 'yas/expand)

;; (setq-default yas/next-field-key (quote ("TAB" "<tab>" "<return>")))
;; (yas/init-yas-in-snippet-keymap)
;;;; With `view-mdoe'
;; Mysteriously after exiting view-mode, yas/minor-mode is nil.
(defadvice view-mode-exit (after yasnippet activate)
  (yas/minor-mode-on))
;; (progn (ad-disable-advice 'view-mode-exit 'after 'yasnippet) (ad-update 'view-mode-exit))
(defadvice view-mode-disable (after yasnippet activate)
  (yas/minor-mode-on))
;; (progn (ad-disable-advice 'view-mode-disable 'after 'yasnippet) (ad-update 'view-mode-disable))
(defadvice view-mode-enable (after yasnippet activate)
  (yas/minor-mode-off))
;; (progn (ad-disable-advice 'view-mode-enable 'after 'yasnippet) (ad-update 'view-mode-enable))
(add-hook 'fundamental-mode-hook  'yas/minor-mode-off)


;;;; Disable flymake during expansion
;;如果你根本就没开flymake,直接将此值设为nil即可
(defvar flymake-is-active-flag nil)
(defadvice yas/expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))

(add-hook 'yas/after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))

(defun joseph-update-yasnippets-on-save ()
  (when (string-match "/yasnippet-snippet/" buffer-file-name)
    (yas/load-snippet-buffer)))

(add-hook 'after-save-hook 'joseph-update-yasnippets-on-save)

(provide 'joseph-yasnippet-config)
;;; jospeh-yasnippet-config.el ends here


