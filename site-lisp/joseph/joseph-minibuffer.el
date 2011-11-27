;;; joseph-complete.el --- complete   -*- coding:utf-8 -*-

;; Description: complete
;; Created: 2011-10-07 13:49
;; Last Updated: Joseph 2011-11-27 15:53:06 星期日
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords: minibuffer complete
;; URL: http://www.emacswiki.org/emacs/joseph-complete.el

;; Copyright (C) 2011, 孤峰独秀, all rights reserved.

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
;;  `minibuffer-up-parent-dir'
;;    回到上一层目录.同时更新*Completions*
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:

(setq save-completions-file-name "~/.emacs.d/cache/completions")
;;; minibuf
(setq enable-recursive-minibuffers t) ;;在minibuffer 中也可以再次使用minibuffer
(setq history-delete-duplicates t)   ;;minibuffer 删除重复历史
;;;minibuffer prompt 只读，且不允许光标进入其中
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))
(setq-default resize-mini-windows t) ;;允许minibuffer自由变化其大小（指宽度）
;;读取buffer name 时忽略大小写
(setq-default read-buffer-completion-ignore-case t)
;;读取file name 时忽略大小写
(setq-default read-file-name-completion-ignore-case t)

;; (icomplete-mode 1)

;;;; (require 'minibuffer-complete-cycle)
;; (require 'minibuffer-complete-cycle)
;; (setq minibuffer-complete-cycle t)

(defun minibuffer-up-parent-dir()
  "回到上一层目录.同时更新*Completions*"
  (interactive)
  (goto-char (point-max))
  (let ((directoryp  (equal ?/ (char-before)))
        (bob         (minibuffer-prompt-end)))
    (while (and (> (point) bob) (not (equal ?/ (char-before))))  (delete-char -1))
    (when directoryp
      (delete-char -1)
      (while (and (> (point) bob) (not (equal ?/ (char-before))))  (delete-char -1)))))


(defun minibuf-define-key-func ()	;
  "`C-n' `C-p' 选择上下一个candidate"
  (define-key  minibuffer-local-completion-map (kbd "C-,") 'minibuffer-up-parent-dir)
  ;; (local-set-key (kbd "C-,") 'backward-kill-word)
  )

(add-hook 'minibuffer-setup-hook 'minibuf-define-key-func )


(provide 'joseph-minibuffer)
;;; joseph-complete.el ends here
