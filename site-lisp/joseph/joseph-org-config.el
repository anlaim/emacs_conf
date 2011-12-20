;; -*- coding:utf-8 -*-
;;; joseph-org-config.el --- Description

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
;;; org mode
;;关于用org-publish 生成个人网站的功能
(eval-after-load 'org-publish '(require 'joseph-org-publish))
(autoload 'publish-my-note "joseph-org-publish" "publish my note笔记" t)
(autoload 'publish-my-note-force "joseph-org-publish" "publish my note笔记" t)

(eval-after-load 'org '(require 'joseph-org))
(eval-after-load 'org '(require 'joseph-org-publish))
(define-key global-map [(control meta ?r)] 'remember)
(eval-after-load 'remember '(require 'joseph-org))
(global-set-key (kbd "C-c a")  'org-agenda)

(provide 'joseph-org-config)
;;; joseph-org-config.el ends here
