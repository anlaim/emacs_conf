;;; joseph-isearch.el --- isearch custom   -*- coding:utf-8 -*-

;; Description: isearch custom
;; Time-stamp: <Joseph 2011-09-08 10:44:46 星期四>
;; Created: 2011-09-08 00:42
;; Author: 孤峰独秀  jixiuf@gmail.com
;; Maintainer:  孤峰独秀  jixiuf@gmail.com
;; Keywords:isearch
;; URL: http://www.emacswiki.org/emacs/joseph-isearch.el

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
;;  `ocurr-when-isearch'
;;    Activate occur easily inside isearch.
;;  `my-anything-occur'
;;    Preconfigured Anything for Occur source.
;;  `isearch-yank-symbol'
;;    *Put symbol at current point into search string.
;;  `joseph-forward-current-symbol-keep-offset'
;;    modified  from (Vagn Johansen 1999)'s (vjo-forward-current-word-keep-offset)
;;  `joseph-backward-current-symbol-keep-offset'
;;    modified  from (Vagn Johansen 2002)'s (vjo-forward-current-word-keep-offset)
;;  `joseph-forward-current-symbol-keep-offset-or-isearch-regexp-forward'
;;    `C-s' call `joseph-forward-current-symbol-keep-offset'
;;  `joseph-backward-current-symbol-keep-offset-or-isearch-regexp-backwark'
;;    `C-s' call `joseph-forward-current-symbol-keep-offset'
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;
;;  `joseph-highlight-delay'
;;    *How long to highlight the tag.
;;    default = 0.3

;;; Code:

(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'thingatpt)
  (require 'anything))

;;;; 渐近搜索注释
;;进入搜索模式之后，几个好用的按键
;;`C-w' 把光标下的word作为搜索关键字，可多次按下`C-w'
;;`M-y' 将`king-ring'中的内容取出作为搜索关键字
;;`M-e'光标跳到minibuffer，编辑关键字
;;`M-%' 改为用query-replace替换
;;`C-M-%' 改为用query-regex-replace替换
;;`M-r' 在正则与非正则之切换
;;`M-c' 是否忽略大小写

;;;; 停留在匹配字串的开端
;;Emacs下c-s对应渐进搜索。不过我们更多的时候需要搜索某种模式，所以用得最多的
;;还是渐进式的正则表达式搜索。正则表达式搜索有个烦人的问题：搜索结束时光标不
;;一定停留在匹配字串的开端。幸好这个问题容易解决：头两行重新绑定标准搜索键
;;c-s和c-r，把isearch换成regex-isearch。后面三行加入定制函数。关键的语句是
;;(goto-char isearch-other-end)，保证光标停留在匹配字串的开头，而不是缺省的末
;;尾。

(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
  (when isearch-forward  (goto-char (or isearch-other-end (point)))))

;; Always end searches at the beginning of the matching expression.

;;;; keybinding
;;`C-s' call `joseph-forward-current-symbol-keep-offset' and `C-uC-s' call `isearch-regexp-forward'
(global-set-key "\C-s" 'joseph-forward-current-symbol-keep-offset-or-isearch-regexp-forward)
(global-set-key "\C-r" 'joseph-backward-current-symbol-keep-offset-or-isearch-regexp-backwark)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

(define-key isearch-mode-map "\C-\M-w" 'isearch-yank-symbol)
(define-key  isearch-mode-map (kbd  "C-5")  'isearch-query-replace)
(define-key  isearch-mode-map (kbd  "M-5")  'isearch-query-replace)
(define-key isearch-mode-map (kbd "C-o") 'ocurr-when-isearch)
(define-key isearch-mode-map  "\M-so" 'ocurr-when-isearch)

;;;; 在isearch 时C-o 改用`ocurr'进行搜索
(defun ocurr-when-isearch()
  "Activate occur easily inside isearch."
  (interactive) (isearch-exit)
  (call-with-current-isearch-string-as-regex 'my-anything-occur))

(defun call-with-current-isearch-string-as-regex (f)
  (let ((case-fold-search isearch-case-fold-search))
    (funcall f (if isearch-regexp isearch-string (regexp-quote isearch-string)))))

(defun my-anything-occur (regexp)
  "Preconfigured Anything for Occur source.
If region is active, search only in region,
otherwise search in whole buffer."
  (interactive)
  (let ((anything-compile-source-functions
         ;; rule out anything-match-plugin because the input is one regexp.
         (delq 'anything-compile-source--match-plugin
               (copy-sequence anything-compile-source-functions)))
        (anything-samewindow nil))
    (anything 'anything-c-source-occur regexp  "Regexp:"  "*Anything Occur*")))

;;;; isearch 启用后 `C-M-w' 使用当前symbol 作为搜索关键字
;; Search back/forth for the symbol at point
;; See http://www.emacswiki.org/emacs/SearchAtPoint
(defun isearch-yank-symbol ()
  "*Put symbol at current point into search string."
  (interactive)
  (let ((sym (symbol-at-point)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<" (regexp-quote (symbol-name sym)) "\\_>")
                isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))

;;; vim like # and *
;; 其操作基本等同于: M-b C-s C-w C-s.
(defcustom joseph-highlight-delay 0.3
  "*How long to highlight the tag.
  (borrowed from etags-select.el)"
  :type 'number)

(defface joseph-highlight-region-face
  '((t (:foreground "white" :background "cadetblue4" :bold t)))
  "Font Lock mode face used to highlight tags.
  (borrowed from etags-select.el)")

(defun joseph-highlight (beg end)
  "Highlight a region temporarily.
   (borrowed from etags-select.el)"
  (if (featurep 'xemacs)
      (let ((extent (make-extent beg end)))
        (set-extent-property extent 'face 'joseph-highlight-region-face)
        (sit-for joseph-highlight-delay)
        (delete-extent extent))
    (let ((ov (make-overlay beg end)))
      (overlay-put ov 'face 'joseph-highlight-region-face)
      (sit-for joseph-highlight-delay)
      (delete-overlay ov))))


(defun joseph-forward-current-symbol-keep-offset()
  "modified  from (Vagn Johansen 1999)'s (vjo-forward-current-word-keep-offset)
直接搜索当前`symbol',并跳到相应位置"
  (interactive)
  (let* ((current-symbol (thing-at-point 'symbol))
         (re-current-symbol (concat "\\_<" current-symbol "\\_>"))
         (bounds-of-symbol nil)
         (offset (point))
         (case-fold-search nil) )
    (if (not  current-symbol)
        (message "no symbol here. search end .")
      (beginning-of-thing 'symbol)
      (setq offset (- offset (point)))	; offset from start of symbol/word
      (setq offset (- (length current-symbol) offset)) ; offset from end
      (forward-char)
      (if (re-search-forward re-current-symbol nil t)
          (progn
            (backward-char offset)
            (setq bounds-of-symbol (bounds-of-thing-at-point 'symbol))
            (joseph-highlight (car bounds-of-symbol ) (cdr bounds-of-symbol))
            )
        (goto-char (point-min))
        (if (re-search-forward re-current-symbol nil t)
            (progn (message "Searching from top. %s" (line-number-at-pos))
                   (backward-char offset)
                   (setq bounds-of-symbol (bounds-of-thing-at-point 'symbol))
                   (joseph-highlight (car bounds-of-symbol ) (cdr bounds-of-symbol))
                   )
          (message "Searching from top: Not found"))
        ))))

(defun joseph-backward-current-symbol-keep-offset ()
  "modified  from (Vagn Johansen 2002)'s (vjo-forward-current-word-keep-offset)
直接搜索当前`symbol',并跳到相应位置(反向)"
  (interactive)
  (let* ((current-symbol (thing-at-point 'symbol))
         (re-current-symbol  (concat "\\_<" current-symbol "\\_>"))
         (offset (point))
         (case-fold-search nil))
    (if (not current-symbol)
        (message "no symbol here. search end .")
      (beginning-of-thing 'symbol)
      (setq offset (- offset (point)))	; offset from start of symbol/word
      (forward-char)
      (if (re-search-backward re-current-symbol nil t)
          (progn
            (forward-char offset)
            (setq bounds-of-symbol (bounds-of-thing-at-point 'symbol))
            (joseph-highlight (car bounds-of-symbol ) (cdr bounds-of-symbol))
            )
        (goto-char (point-max))
        (if (re-search-backward re-current-symbol nil t)
            (progn (message "Searching from bottom. %s" (line-number-at-pos))
                   (forward-char offset)
                   (setq bounds-of-symbol (bounds-of-thing-at-point 'symbol))
                   (joseph-highlight (car bounds-of-symbol ) (cdr bounds-of-symbol))
                   )
          (message "Searching from bottom: Not found")))
      )))

(defun  joseph-forward-current-symbol-keep-offset-or-isearch-regexp-forward(&optional param)
  "`C-s' call `joseph-forward-current-symbol-keep-offset'
`C-uC-s' call `isearch-forward-regexp'"
  (interactive "P")
  (if param
      (call-interactively 'isearch-forward-regexp)
    (call-interactively  'joseph-forward-current-symbol-keep-offset)
    )
  )

(defun  joseph-backward-current-symbol-keep-offset-or-isearch-regexp-backwark(&optional param)
  "`C-s' call `joseph-forward-current-symbol-keep-offset'
`C-uC-s' call `isearch-forward-regexp'"
  (interactive "P")
  (if param
      (call-interactively 'isearch-backward-regexp)
    (call-interactively  'joseph-backward-current-symbol-keep-offset)
    )
  )

(provide 'joseph-isearch)
;;; joseph-isearch.el ends here

