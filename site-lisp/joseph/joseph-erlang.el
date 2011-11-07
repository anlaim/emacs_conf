;;; joseph-erlang.el --- erlang mode config   -*- coding:utf-8 -*-

;; Description: erlang mode config
;; Created: 2011-11-07 10:35
;; Last Updated: Joseph 2011-11-07 11:02:29 星期一
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: erlang
;; URL: http://www.emacswiki.org/emacs/joseph-erlang.el

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
(when (equal system-type 'windows-nt)
  (setq erlang-root-dir "d:/usr/erl5.8.5/")
  (setq exec-path (cons "d:/usr/erl5.8.5//bin" exec-path)))

;; (when  (equal system-type 'gnu/linux)
;;   (setq erlang-root-dir "/usr/local/otp")
;;   (setq exec-path (cons "/usr/local/otp/bin" exec-path)))

(require 'erlang-start)

(provide 'joseph-erlang)
;;; joseph-erlang.el ends here
