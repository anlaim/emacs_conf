;; -*- coding:utf-8 -*-
;;; joseph-boring-buffer.el --- 关于关闭某些讨厌的buffer

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: buffer burery

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
;;;; bury some boring buffers,把讨厌的buffer移动到其他buffer之后

(defun  bury-boring-buffer()
  (let ((cur-buf-name (buffer-name (current-buffer)))
        (boring-buffers '("*Completions*" "*SPEEDBAR*")))
    (mapc '(lambda(boring-buf)
             (unless (equal cur-buf-name boring-buf)
               (when (buffer-live-p (get-buffer boring-buf))
                 (bury-buffer boring-buf))))
          boring-buffers)
    ))
;;尤其是使用icicle时,经常关闭一个buffer后,默认显示的buffer是*Completions*
;;所以在kill-buffer时,把这些buffer放到最后
(add-hook 'kill-buffer-hook 'bury-boring-buffer)

;;;; 自动清除长久不访问的buffer
(require 'midnight)
;;kill buffers if they were last disabled more than this seconds ago
;;如果一个buffer有3min没被访问了那么它会被自动关闭
(setq clean-buffer-list-delay-special (* 60  5));;3*60s
;;有一个定时器会每隔一分钟检查一次,哪些buffer需要被关闭
(defvar clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one.
 You can disable clean-buffer-list by
 (cancel-timer clean-buffer-list-timer).")

;; run clean-buffer-list every 60s
(setq clean-buffer-list-timer (run-at-time t 60 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
;;这里设成匹配任何buffer,任何buffer都在auto kill之列,
;;(setq clean-buffer-list-kill-regexps '("^"))
(setq clean-buffer-list-kill-buffer-names
      '("*Completions*" "*Compile-Log*"
        "*Apropos*" "*compilation*" "*Customize*"
        "*desktop*" ;;"\\*Async Shell Command"
        ))
(setq clean-buffer-list-kill-regexps
      (list (rx (or
                 "\*anything"
                 "\*vc-diff\*"
                 "\*vc-change-log\*"
                 "\*VC-log\*"
                 "\*sdcv\*"
                 ))
            ))
;;下面的buffer是例外,它们不会被auto kill
;;这样的buffer不会被清除
;; * currently displayed buffers
;; * buffers attached to processes, and
;; * internal buffers that were never displayed
;; * buffers with files that are modified

(setq clean-buffer-list-kill-never-buffer-names
      '("*scratch*" "*Messages*" "*server*"))


(setq clean-buffer-list-kill-never-regexps
      '("^ \\*Minibuf-.*\\*$")
      )
;;自动清除某些buffer时,会输出一此很长的信息,我认为没用,暂时重新定义了`message'
(defadvice clean-buffer-list (around no-message-output activate)
  "Disable `message' when wrapping candidates."
  (flet ((message (&rest args)))
    ad-do-it)
  ;;  (kill-buffer "*Compile-Log*")
  )


;;;; close-boring-windows with `C-g'
;; (defvar boring-window-modes
;;   '(help-mode compilation-mode log-view-mode log-edit-mode ibuffer-mode)
;;   )

;; (defvar boring-window-bof-name-regexp
;;   (rx (or
;;        "\*Anything"
;;        "\*vc-diff\*"
;;        "*Completions*"
;;        "\*vc-change-log\*"
;;        "\*VC-log\*"
;;        "\*sdcv\*"
;;        "\*Messages\*"
;;        )))


;; (defun close-boring-windows()
;;   "close boring *Help* windows with `C-g'"
;;   (let ((opened-windows (window-list)))
;;     (dolist (win opened-windows)
;;       (set-buffer (window-buffer win))
;;       (when (or
;;              (memq  major-mode boring-window-modes)
;;              (string-match boring-window-bof-name-regexp (buffer-name))
;;              )
;;         (if (>  (length (window-list)) 1)
;;             (kill-buffer-and-window)
;;           (kill-buffer)
;;           )))))

;; (defadvice keyboard-quit (before close-boring-windows activate)
;;   (close-boring-windows)
;;   (when (active-minibuffer-window)
;;     (anything-keyboard-quit)
;;     ;; (abort-recursive-edit)
;;     )
;; )
;; (push '(dired-mode :height 50) popwin:special-display-config)
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config
      '(("*Help*")
        ("*Completions*" :noselect t)
        ("*compilation*" :noselect t)
        ("*Occur*" :noselect t)
        ("*Anything")
        ("*vc-diff*":position right :width 70)
        ("*vc-change-log*" :position right :width 70)
        ("*VC-log*" :height 20)
        ("*sdcv*")
        ("*Messages*")
        )
      )

(provide 'joseph-boring-buffer)
;;; joseph-boring-buffer.el ends here


