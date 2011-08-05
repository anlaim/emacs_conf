;; -*- coding:utf-8 -*-
;;; joseph-auto-install.el --- config about auto-install

;; Copyright (C) 2011 孤峰独秀

;; Author: 孤峰独秀  jixiuf@gmail.com
;; Keywords: auto install fetch emacswiki

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
;;; auto install
(autoload 'auto-install-from-url "auto-install" "auto install from url" nil)
(autoload 'auto-install-batch "auto-install" "auto install batch" t)
(autoload 'auto-install-from-library "auto-install" "auto install from library" t)

(setq-default auto-install-save-confirm nil)
(setq-default auto-install-directory "~/.emacs.d/site-lisp/auto-install/")

(autoload 'anything-auto-install-from-emacswiki "anything-auto-install" " Launch anything with auto-install separately." t)
(autoload 'anything-auto-install-from-library "anything-auto-install" "Update library with `anything'." t)
(autoload 'anything-auto-install-batch "anything-auto-install" "    Batch install elisp libraries.." t)
(autoload 'anything-auto-install "anything-auto-install" "  All-in-one command for elisp installation." t)
;;  `anything-auto-install-from-emacswiki'
;;    Launch anything with auto-install separately.
;;  `anything-auto-install-from-library'
;;    Update library with `anything'.
;;  `anything-auto-install-batch'
;;    Batch install elisp libraries.
;;  `anything-auto-install'
;;    All-in-one command for elisp installation.

;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-auto-install.el")
;; (auto-install-batch "icicles")
;;;;icicles中有文件依赖ring+.el,手动下载之
;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/ring+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/doremi-frm.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/hexrgb.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/frame-fns.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/faces+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/thingatpt+.el")
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/session.el")
;;;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-c-javadoc.el")
;;http://www.emacswiki.org/emacs/download/anything-dabbrev-expand.el
;;
;;(auto-install-from-url "http://www.emacswiki.org/emacs/download/anything-dabbrev-expand.el")

(provide 'joseph-auto-install)
;;; joseph-auto-install.el ends here


