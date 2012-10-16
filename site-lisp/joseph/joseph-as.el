;;; joseph-as.el --- Description

;; Description: Description
;; Created: 2012-10-16 00:15
;; Last Updated: 纪秀峰 2012-10-16 22:38:12 星期二
;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords:
;; URL: http://www.emacswiki.org/emacs/download/joseph-as.el

;; Copyright (C) 2012, 纪秀峰, all rights reserved.

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

(eval-when-compile
  (progn
    (add-to-list 'load-path  (expand-file-name "."))
    (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
    (require   'joseph-util)
    ))

;; (autoload 'actionscript-mode "actionscript-mode"  "Major mode for editing Actionscript files." t)
;; Automatically use hideshow with actionscript files.
(add-hook 'actionscript-mode-hook 'hs-minor-mode)

(add-hook 'find-file-not-found-hooks 'insert-flash-boilerplate)
;; Keybindings
(define-key-lazy actionscript-mode-map "\C-c\C-f" 'as-print-func-info)
(define-key-lazy actionscript-mode-map "\C-c\C-t" 'as-insert-trace)

(provide 'joseph-as)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-as.el ends here
