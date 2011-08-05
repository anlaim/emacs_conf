;; -*- coding:utf-8 -*-
;;; joseph-srsppedbar.el --- Description

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
;;; 将 speedbar  在同一个frame 内显示

(autoload 'sr-speedbar-toggle "sr-speedbar" "show speedbar in same frame" t)
(setq-default sr-speedbar-width-x 36)
(setq-default sr-speedbar-width-console 36)
(setq-default sr-speedbar-auto-refresh t) ;;default is t
(setq-default sr-speedbar-right-side nil)
(global-set-key (kbd "H-s") 'sr-speedbar-toggle)

;;; sr-speedbar-refresh-toggle
;; `sr-speedbar-width-x'
;; `sr-speedbar-width-console'
;; `sr-speedbar-max-width'
;; `sr-speedbar-delete-windows'
;;      Whether delete other window before showing up.
;; `sr-speedbar-skip-other-window-p'
;;      Whether skip `sr-speedbar' window when use
;;      command `other-window' select window in cyclic ordering of windows.
;;      Control status of refresh speedbar content.
;;      Puts the speedbar on the right side if non-nil (else left).
;;
;; All above setup can customize by:
;;      M-x customize-group RET sr-speedbar RET
;;

(provide 'joseph-srsppedbar)
;;; joseph-srsppedbar.el ends here


