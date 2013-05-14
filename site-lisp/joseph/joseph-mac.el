;;; joseph-mac.el --- config for mac

;; Description: Description
;; Created: 2013-05-15 00:22
;; Last Updated: 纪秀峰 2013-05-15 00:23:55 Wednesday
;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords:
;; URL: http://www.emacswiki.org/emacs/download/joseph-mac.el

;; Copyright (C) 2013, 纪秀峰, all rights reserved.

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

;;; Code:
(setq exec-path (delete-dups  (cons "/usr/local/bin" exec-path)))
(setenv "PATH" (concat  "/usr/local/bin:" (getenv "PATH") ))

(provide 'joseph-mac)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-mac.el ends here
