;;; joseph-gtalk.el --- gtalk jabberEL   -*- coding:utf-8 -*-

;; Description: gtalk jabberEL
;; Created: 2011-11-10 01:17
;; Last Updated: Joseph 2011-11-10 01:17:51 星期四
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: gtalk
;; URL: http://www.emacswiki.org/emacs/joseph-gtalk.el

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

(require 'jabber-autoloads)
(setq jabber-account-list '(
                            ("jixiuf@gmail.com"
                             (:password. "zhao2170")
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ))

(provide 'joseph-gtalk)
;;; joseph-gtalk.el ends here
