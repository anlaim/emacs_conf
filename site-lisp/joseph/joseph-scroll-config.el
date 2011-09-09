;; -*- coding:utf-8 -*-
;;; Commentary:

;;

;;; joseph-scroll-config.el --- Description

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords:

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
;;; joseph scroll screen up and down
(autoload 'joseph-scroll-half-screen-down "joseph-scroll-screen" "scroll half screen down" t)
(autoload 'joseph-scroll-half-screen-up "joseph-scroll-screen" "scroll half screen up" t)
(global-set-key "\C-v" 'joseph-scroll-half-screen-down)
(global-set-key "\C-r" 'joseph-scroll-half-screen-up)
(global-set-key "\M-v" 'joseph-scroll-half-screen-up)

(provide 'joseph-scroll-config)
;;; joseph-scroll-config.el ends here


