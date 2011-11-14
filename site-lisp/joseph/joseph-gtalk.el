;;; joseph-gtalk.el --- gtalk jabberEL   -*- coding:utf-8 -*-

;; Description: gtalk jabberEL
;; Created: 2011-11-10 01:17
;; Last Updated: Joseph 2011-11-14 22:09:53 星期一
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
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'joseph_keybinding)
  )

(require 'jabber-autoloads)
(setq jabber-account-list '(
                            ("jixiuf@gmail.com"
                             ;; (:password. "zhao2170")
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ("hackjixf@gmail.com"
                             ;; (:password. "zhao2170")
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ))
(setq-default jabber-default-status "http://jixiuf.github.com/links.html http://code.google.com/p/screencast-repos/downloads/list  http://www.emacswiki.org/emacs/Joseph")
(setq-default jabber-avatar-cache-directory "~/.emacs.d/cache/jabber-avatars/")

(define-key ctl-w-map "\C-j" jabber-global-keymap)
(define-key ctl-x-map "\C-j" 'dired-jump) ;恢愎 C-xC-j 为dired-jump
(eval-after-load 'jabber-keymap '(progn (define-key ctl-x-map "\C-j" 'dired-jump )));恢愎 C-xC-j 为dired-jump

(setq-default jabber-alert-info-wave (expand-file-name "~/.emacs.d/resource/ding.wav"))
(setq-default jabber-alert-message-wave  (expand-file-name "~/.emacs.d/resource/ding.wav")) ;消息来
(setq-default jabber-alert-message-hooks (quote (jabber-message-awesome jabber-message-wave jabber-message-echo jabber-message-switch jabber-message-scroll)))
;; (setq jabber-alert-muc-wave  (expand-file-name "~/.emacs.d/resource/ding.wav"))
(setq-default jabber-alert-presence-wave (expand-file-name "~/.emacs.d/resource/horse.wav")) ;有请求加好友
(setq-default jabber-alert-presence-hooks (quote (jabber-presence-awesome jabber-presence-wave jabber-presence-switch jabber-presence-echo)))

(when (equal system-type  'windows-nt)
  (setq-default jabber-alert-message-hooks (quote (jabber-message-wave jabber-message-echo jabber-message-switch jabber-message-scroll)))
  (setq-default jabber-alert-presence-hooks (quote (jabber-presence-wave jabber-presence-switch jabber-presence-echo))))



(provide 'joseph-gtalk)
;;; joseph-gtalk.el ends here
