;;; custom-mode-line.el --- Description

;; Description: Description
;; Created: 2012-03-09 22:28
;; Last Updated: Joseph 2012-03-10 01:38:39 星期六
;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords:
;; URL: http://www.emacswiki.org/emacs/download/custom-mode-line.el

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

;;; Commands:
;;
;; Below are complete command list:
;;
;;  `vc-mode-line'
;;    Set `vc-mode' to display type of version control for FILE.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:

(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".	c %s\",
\" 	c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \"};"  color1 color2))

(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".	c %s\",
\" 	c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\"};"  color2 color1))


(defconst color1 "#555")                ;灰
(defconst color2 "black")               ;黑

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background color2
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background color2)


(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)



(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)


(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color1) 'xpm t :ascent 'center))
;; (defvar arrow-right-3 (create-image (arrow-right-xpm color2 color1) 'xpm t :ascent 'center))
;; (defvar arrow-right-4 (create-image (arrow-right-xpm color1 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))



;; (setq-default mode-line-format
;;  (list  '(:eval (concat (propertize " %b " 'face 'mode-line-color-1)
;;                         (propertize " " 'display arrow-right-1)))
;;         '(:eval (concat (propertize " %m " 'face 'mode-line-color-2)
;;                         (propertize " " 'display arrow-right-2)))

;;         ;; Justify right by filling with spaces to right fringe - 16
;;         ;; (16 should be computed rahter than hardcoded)
;;         '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))

;;         '(:eval (concat (propertize " " 'display arrow-left-2)
;;                         (propertize " %p " 'face 'mode-line-color-2)))
;;         '(:eval (concat (propertize " " 'display arrow-left-1)
;;                         (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
;; ))

(provide 'custom-mode-line)

;;; 在mode line 上，可上 此frame 可否使用 emacsclient  进行连接 "CS"字样
(setq mode-line-client
      `(""
        (:propertize ("" (:eval (if (frame-parameter nil 'client) "CS " "")))
                     help-echo ,(purecopy "emacsclient frame:此frame 可以使用 emacsclient进行连接"))))

(eval-after-load 'which-func
  '(setq-default which-func-format
              `((:propertize which-func-current
                             local-map ,which-func-keymap
                             face which-func
                             ;;mouse-face highlight	; currently not evaluated :-(
                             help-echo "左键：跳到函数头部\n中键: toggle rest visibility\n右键:跳到函数尾部")))
  )
(eval-after-load 'time
  '(setq display-time-string-forms (quote ((if (and (not display-time-format) display-time-day-and-date) (format-time-string "%a %b %e " now) "") (concat (propertize (format-time-string (or display-time-format (if display-time-24hr-format "%H:%M" "%-I:%M%p")) now) (quote face) (quote mode-line-color-2) (quote help-echo) (format-time-string "%a %b %e, %Y" now)) (propertize " " (quote display) arrow-right-2)) load (if mail (concat " " (propertize display-time-mail-string (quote display) (\` (when (and display-time-use-mail-icon (display-graphic-p)) (\,@ display-time-mail-icon) (\,@ (if (and display-time-mail-face (memq (plist-get (cdr display-time-mail-icon) :type) (quote (pbm xbm)))) (let ((bg (face-attribute display-time-mail-face :background))) (if (stringp bg) (list :background bg))))))) (quote face) display-time-mail-face (quote help-echo) "You have new mail; mouse-2: Read mail" (quote mouse-face) (quote mode-line-highlight) (quote local-map) (make-mode-line-mouse-map (quote mouse-2) read-mail-command))) ""))))
  )

(setq-default mode-line-format
              '("%e"
                (:eval (concat
                        (propertize " " 'display arrow-right-2)
                        (propertize "%b"
                                           'face 'mode-line-color-1
                                           'help-echo (purecopy "文件或缓冲区名\n左键: 前一个 buffer\n右键: 后一个 buffer")
                                           'local-map mode-line-buffer-identification-keymap)
                               (propertize " " 'display arrow-right-1)))
                (:eval (concat (propertize " %m " 'face 'mode-line-color-2)
                               (propertize " " 'display arrow-right-2)))

                ;; mode-line-position
                (:eval (concat (propertize "(%4l:%2c)/%6p" 'face 'mode-line-color-1)
                               (propertize " " 'display arrow-right-1)
                               ))
                global-mode-string
                (vc-mode vc-mode)
                (:eval (propertize "   "  'help-echo (purecopy "左键拖动:改变window大小 \n中键: 当前window最大化\n右键: 移除当前window")))
                mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification
                which-func-format

                mode-line-modes
                (:eval
                 (unless
                     (display-graphic-p)
                   #("-%-" 0 3
                     (help-echo "左键拖动:改变window大小 \n中键: 当前window最大化\n右键: 移除当前window"))))

                ))

;; 为mode line 上的vc 信息显示 添加face 修改
;; 'face 'mode-line-color-1
;; (propertize " " 'display arrow-right-1)
(defun vc-mode-line (file &optional backend)
  "Set `vc-mode' to display type of version control for FILE.
The value is set in the current buffer, which should be the buffer
visiting FILE.
If BACKEND is passed use it as the VC backend when computing the result."
  (interactive (list buffer-file-name))
  (setq backend (or backend (vc-backend file)))
  (if (not backend)
      (setq vc-mode nil)
    (let* ((ml-string (vc-call-backend backend 'mode-line-string file))
	   (ml-echo (get-text-property 0 'help-echo ml-string)))
      (setq vc-mode
	    (concat
	     (if (null vc-display-status)
		 (symbol-name backend)
         (concat
          (propertize
		ml-string
		'mouse-face 'mode-line-highlight
        'face 'mode-line-color-1
		'help-echo
		(concat (or ml-echo
			    (format "File under the %s version control system"
				    backend))
			"\nmouse-1: Version Control menu")
		'local-map vc-mode-line-map)
          (propertize " " 'display arrow-right-1)
          )

           ))))
    ;; If the user is root, and the file is not owner-writable,
    ;; then pretend that we can't write it
    ;; even though we can (because root can write anything).
    ;; This way, even root cannot modify a file that isn't locked.
    (and (equal file buffer-file-name)
	 (not buffer-read-only)
	 (zerop (user-real-uid))
	 (zerop (logand (file-modes buffer-file-name) 128))
	 (setq buffer-read-only t)))
  (force-mode-line-update)
  backend)

;; Local Variables:
;; coding: utf-8
;; End:

;;; custom-mode-line.el ends here
