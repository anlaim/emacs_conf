;; ;; -*- coding:utf-8 -*-
;; ;;; joseph-scroll-smooth.el --- 平滑滚动

;; ;; Copyright (C) 2011 纪秀峰

;; ;; Author: 纪秀峰  jixiuf@gmail.com
;; ;; Keywords: scroll window

;; ;; This program is free software; you can redistribute it and/or modify
;; ;; it under the terms of the GNU General Public License as published by
;; ;; the Free Software Foundation, either version 3 of the License, or
;; ;; (at your option) any later version.

;; ;; This program is distributed in the hope that it will be useful,
;; ;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; ;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; ;; GNU General Public License for more details.

;; ;; You should have received a copy of the GNU General Public License
;; ;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ;;; Commentary:

;; ;;

;; ;;; Commands:
;; ;;
;; ;; Below are complete command list:
;; ;;
;; ;;
;; ;;; Customizable Options:
;; ;;
;; ;; Below are customizable option list:
;; ;;

;; ;;; Code:
;; ;;; smooth-scroll 平滑滚动

;; ;; (autoload 'scroll-up-1 "smooth-scroll" "" t)
;; ;; (autoload 'scroll-down-1 "smooth-scroll" "" t)
;; ;; (autoload 'scroll-right-1 "smooth-scroll" "" t)
;; ;; (autoload 'scroll-left-1 "smooth-scroll" "" t)
;; ;; (autoload 'smooth-scroll-mode "smooth-scroll" "" nil )
;; ;; (setq-default smooth-scroll/vscroll-step-size 1)
;; ;; (smooth-scroll-mode -1)

;; ;; (global-set-key [(control  down)]  'scroll-up-1)
;; ;; (global-set-key [(control  up)]    'scroll-down-1)
;; (global-set-key [(control  left)]  'scroll-right-1)
;; (global-set-key [(control  right)] 'scroll-left-1)

;; (put 'scroll-right   'scroll-command-p t)
;; (put 'scroll-right-1   'scroll-command-p t)
;; (put 'scroll-left-1   'scroll-command-p t)
;; ;;;###autoload
;; (defun scroll-left-1 (&optional arg)
;;   "Scroll selected window display ARG columns left.
;; If ARG is omitted or nil, scroll left by a column.
;; Negative ARG means scroll rightward.
;; If ARG is the atom `-', scroll right by a column.
;; When calling from a program, supply as argument a number, nil, or `-'.

;; After scrolling, position of the cursor will be kept when possible."
;;   (interactive "P")
;;   (let ((amount (case arg ((-) -1) ((nil) 1) (t arg))))
;;     (scroll-left amount)))
;; ;;;###autoload
;; (defun scroll-right-1 (&optional arg)
;;   "Scroll selected window display ARG columns right.
;; If ARG is omitted or nil, scroll right by a column.
;; Negative ARG means scroll leftward.
;; If ARG is the atom `-', scroll left by a column.
;; When calling from a program, supply as argument a number, nil, or `-'.

;; After scrolling, position of the cursor will be kept when possible."
;;   (interactive "P")
;;   (let ((amount (case arg ((-) -1) ((nil) 1) (t arg))))
;;     (scroll-right amount)))



(provide 'joseph-scroll-smooth)
;;; joseph-scroll-smooth.el ends here
