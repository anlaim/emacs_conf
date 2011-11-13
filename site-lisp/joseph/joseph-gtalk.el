;;; joseph-gtalk.el --- gtalk jabberEL   -*- coding:utf-8 -*-

;; Description: gtalk jabberEL
;; Created: 2011-11-10 01:17
;; Last Updated: Joseph 2011-11-13 16:12:38 星期日
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
                             ;; (:password. "zhao2170")
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ;; ("hackjixf@gmail.com"
                            ;;  ;; (:password. "zhao2170")
                            ;;  (:network-server . "talk.google.com")
                            ;;  (:port . 443)
                            ;;  (:connection-type . ssl))
                            ))

(eval-after-load 'jabber
  '(progn
     (setq jabber-default-status "hello")
     ;; (setq jabber-alert-info-wave (expand-file-name "~/.emacs.d/resource/ding.wav"))
     (setq jabber-alert-message-wave  (expand-file-name "~/.emacs.d/resource/ding.wav")) ;消息来
     (setq jabber-alert-message-hooks (quote (jabber-message-awesome jabber-message-wave jabber-message-echo jabber-message-switch jabber-message-scroll)))
     ;; (setq jabber-alert-muc-wave  (expand-file-name "~/.emacs.d/resource/ding.wav"))
     (setq jabber-alert-presence-wave (expand-file-name "~/.emacs.d/resource/horse.wav")) ;有请求加好友
     (set jabber-alert-presence-hooks (quote (jabber-presence-awesome jabber-presence-wave jabber-presence-switch jabber-presence-echo)))
     (setq jabber-avatar-cache-directory "~/.emacs.d/cache/jabber-avatars/")

     (when (equal system-type  'windows-nt)
       (setq jabber-alert-message-hooks (quote (jabber-message-wave jabber-message-echo jabber-message-switch jabber-message-scroll)))
       (set jabber-alert-presence-hooks (quote (jabber-presence-wave jabber-presence-switch jabber-presence-echo))))
     ))
(provide 'joseph-gtalk)
;;; joseph-gtalk.el ends here
