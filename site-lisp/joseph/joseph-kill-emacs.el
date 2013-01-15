;;; joseph-kill-emacs.el --- kill emacs hook   -*- coding:utf-8 -*-

;; Description: kill emacs hook
;; Time-stamp: <Joseph 2011-09-12 19:41:14 星期一>
;; Created: 2011-09-12 19:16
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: kill emacs
;; URL: http://www.emacswiki.org/emacs/joseph-kill-emacs.el

;; Copyright (C) 2011, 孤峰独秀, all rights reserved.

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
(defun save-emacs-session(&optional frame)
  "这里面的内容本来为`kill-emacs-hook'中的函数，但在在emacs --daemon
模式下，似乎`kill-emacs-hook'没有运行。故移到`delete-frame-functions'中"
  (when (member 'helm-c-adaptive-save-history kill-emacs-hook)
    (helm-c-adaptive-save-history))
  (when (member 'tramp-dump-connection-properties kill-emacs-hook)
    (tramp-dump-connection-properties))
  (when (member 'ac-comphist-save kill-emacs-hook)
    (ac-comphist-save))
  (when (member 'recentf-save-list kill-emacs-hook)
    (recentf-save-list))
  (when (member 'org-babel-remove-temporary-directory kill-emacs-hook)
    (org-babel-remove-temporary-directory))
  (when (member 'savehist-autosave kill-emacs-hook)
    (savehist-autosave))
  (when (member 'save-place-kill-emacs-hook kill-emacs-hook)
    (save-place-kill-emacs-hook))
  (write-file "/tmp/acse" "hello")
  ;;  (run-hooks 'kill-emacs-hook)
  )

(when (daemonp)
  (add-hook 'delete-frame-functions 'save-emacs-session))


(setq save-emacs-session-interval (* 60  10));;10*60s
(run-at-time t  save-emacs-session-interval 'save-emacs-session)

(provide 'joseph-kill-emacs)
;;; joseph-kill-emacs.el ends here间隔
