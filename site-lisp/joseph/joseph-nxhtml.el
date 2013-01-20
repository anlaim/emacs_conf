;;; joseph-nxhtml.el --- nxhtml   -*- coding:utf-8 -*-

;; Description: nxhtml
;; Time-stamp: <Joseph 2011-10-19 14:07:30 星期三>
;; Created: 2011-10-19 14:07
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: nxhtml
;; URL: http://www.emacswiki.org/emacs/joseph-nxhtml.el

;; Copyright (C) 2011, 纪秀峰, all rights reserved.

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

(unless (featurep 'nxhtml-autostart) (load "autostart"))
;;nhtml
;;;###autoload
(defun joseph-nxhtml-mode() "an autoloaded  empty function")

(eval-after-load 'popcmp '(setq popcmp-completion-style (quote anything)))

(provide 'joseph-nxhtml)
;;; joseph-nxhtml.el ends here
