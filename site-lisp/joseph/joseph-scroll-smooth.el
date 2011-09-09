;; -*- coding:utf-8 -*-
;;; joseph-scroll-smooth.el --- 平滑滚动

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: scroll window

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
;;; smooth-scroll 平滑滚动

(autoload 'scroll-up-1 "smooth-scroll" "" t)
(autoload 'scroll-down-1 "smooth-scroll" "" t)
(autoload 'scroll-right-1 "smooth-scroll" "" t)
(autoload 'scroll-left-1 "smooth-scroll" "" t)
(autoload 'smooth-scroll-mode "smooth-scroll" "" nil )
(setq-default smooth-scroll/vscroll-step-size 1)
(smooth-scroll-mode -1)

(global-set-key [(control  down)]  'scroll-up-1)
(global-set-key [(control  up)]    'scroll-down-1)
(global-set-key [(control  left)]  'scroll-right-1)
(global-set-key [(control  right)] 'scroll-left-1)

(provide 'joseph-scroll-smooth)
;;; joseph-scroll-smooth.el ends here


