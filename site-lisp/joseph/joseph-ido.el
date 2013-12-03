;;; joseph-ido.el --- ido   -*- coding:utf-8 -*-

;; Description: ido
;; Created: 2011-11-10 23:23
;; Last Updated: 纪秀峰 2013-12-04 00:23:10 
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: ido
;; URL: http://www.emacswiki.org/emacs/joseph-ido.el

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
(eval-when-compile
  (require 'ido)
  (require 'joseph_keybinding)
  )
(setq-default ido-save-directory-list-file (convert-standard-filename "~/.emacs.d/cache/ido.last"))
(setq ido-max-directory-size 100000)
(setq-default ido-ignore-buffers '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf"
              "\\*ac-mode-"
                 "\\*reg group-leader\\*"
                 "\\*derl emacs@jf\\.org\\*"
                 "\\*trace emacs"
                 "\\*magit-process\\*"
                 "\\*magit"
                 ;; echo area
                 "\\*Completions\\*"
                 "\\*zsh\\*"
                 "\\*bash\*"
                 "\\*vc\*"
                 "\\*compilation\\*"
                 "\\*Compile-Log\\*"
                 "\\*Ibuffer\\*"
                 "\\*Help\\*"
                 "\\*Messages\\*"))

(ido-mode 'buffers)
(add-hook 'ido-setup-hook 'ido-my-keys)
(defun ido-my-keys ()
  "Add my keybindings for ido."
  ;; (define-key ido-completion-map (kbd "C-j") 'ido-exit-minibuffer) ;select or expand
  (define-key ido-completion-map (kbd "C-e") 'ido-exit-minibuffer) ;select or expand
  (define-key ido-completion-map [?\H-m] 'ido-exit-minibuffer) ;select or expand
  (define-key ido-completion-map "\r" 'ido-select-text);new buffer
  (define-key ido-completion-map (kbd "C-,") 'ido-up-directory)
  (setq ido-enable-flex-matching t)
  )


(provide 'joseph-ido)
;;; joseph-ido.el ends here
