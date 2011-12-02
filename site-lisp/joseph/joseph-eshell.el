;;; joseph-eshell.el --- config for eshell   -*- coding:utf-8 -*-

;; Description: config for eshell
;; Created: 2011-11-25 13:19
;; Last Updated: Joseph 2011-12-02 20:33:30 星期五
;; Author: 纪秀峰  jixiuf@gmail.com
;; Maintainer:  纪秀峰  jixiuf@gmail.com
;; Keywords: eshell emacs
;; URL: http://www.emacswiki.org/emacs/joseph-eshell.el

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
;;  `toggle-eshell'
;;    Start `bash' shell.
;;  `eshell/clear'
;;    04Dec2001 - sailor, to clear the eshell buffer.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Code:
(defvar eshll-toggle-commands '(toggle-e-bash-cd toggle-e-bash toggle-e-zsh toggle-e-zsh-cd toggle-shell))

(defun toggle-eshell (&optional shell-name shell-buffer-name)
  "Start `bash' shell."
  (interactive "sshell name:\nsshell buffer name:")
  (let ((binary-process-input t)
        (binary-process-output nil)
        (comint-scroll-show-maximum-output 'this)
        ;; (shell-name (or shell-name "bash"))
        ;; (shell-command-switch "-c");
        ;; (explicit-shell-file-name (or shell-name "bash")) ;;term.el
        ;; (explicit-bash-args '("-login" "-i"))
        (comint-completion-addsuffix t);;目录补全时,在末尾加一个"/"字符
        (comint-eol-on-send t)
        (comint-file-name-quote-list '(?\  ?\")) ;;当文件名中有这些(空格引号)特殊字符时会把这些特殊字符用"\"转义
        (w32-quote-process-args ?\")  ;;再给程序传递参数的时候,使用这个字符将参数括起来
        ;; (eval-after-load 'ediff-diff '(progn (setq ediff-shell shell-name))) ;;Ediff shell
        ;; Unfortunately, when you visit a DOS text file within an
        ;; encoded file, you'll see CRs (^Ms) in the buffer.
        ;; If `binary-process-output' is set to `nil', this problem goes
        ;; away, which is fine for files of type `.gz'.
        ;; (ediff-shell shell-name)
        ;; (shell-buffer-name (or shell-buffer-name "*bash*"))
        )
    ;; (when (equal system-type 'windows-nt)
    ;;   (setq comint-output-filter-functions '(comint-strip-ctrl-m))) 不知原因为何windows 上，加了这句后，shell不显颜色
    (setenv "SHELL" explicit-shell-file-name)
    (if (and (get-buffer shell-buffer-name)
             (buffer-live-p (get-buffer shell-buffer-name)))
        (cond
         ( (not (string= (buffer-name) shell-buffer-name))
           (switch-to-buffer-other-window shell-buffer-name))
         ((and (string= (buffer-name) shell-buffer-name)
               (> (length (window-list)) 1)
               (member last-command eshll-toggle-commands))
          (delete-other-windows)
          )
         ((and (string= (buffer-name) shell-buffer-name)
               (> (length (window-list)) 1))
          (delete-window)
          )
         ((and
           (string= (buffer-name) shell-buffer-name)
           (equal (length (window-list)) 1))
          (bury-buffer)
          ))
      (let((old-window-config (current-window-configuration)))
        (setq eshell-buffer-name shell-buffer-name)
        (eshell)
        (goto-char (point-max))
        ;; (insert (concat "cd " (concat "\""default-directory "\""))) ;;make sure current directory is default-directory
        ;; (eshell-send-input)
        (set-window-configuration old-window-config)
        (switch-to-buffer-other-window shell-buffer-name)
        )
      )
    )
  )


(defvar shell-buffer-hist nil)

(defun toggle-shell-completing-read-buffer-name(arg &optional default-buffer-name-when-no-hist )
  (let* ((default-shell-buffer
           (if (and shell-buffer-hist (listp shell-buffer-hist) (car shell-buffer-hist))
               (car shell-buffer-hist) default-buffer-name-when-no-hist ))
         (buffer-name default-shell-buffer))
    (when arg
      (setq buffer-name (completing-read (concat "shell buffer name(default:"
                                                 (if (string-match "^\\*" default-shell-buffer)
                                                     default-shell-buffer
                                                   (concat "*"  default-shell-buffer "*"))
                                                 "):")
                                         shell-buffer-hist nil nil nil nil default-shell-buffer ))
      (unless (string-match "^\\*" buffer-name)
        (setq buffer-name (concat "*"  buffer-name "*"))) )
    (setq shell-buffer-hist (delete buffer-name shell-buffer-hist))
    (push buffer-name shell-buffer-hist)
    buffer-name
    ))

;;;###autoload
(defun toggle-e-bash-cd(&optional arg dir)
  (interactive "P")
  (let ((dest-dir-cd (or dir default-directory))
        (shell-buffer-name (toggle-shell-completing-read-buffer-name arg "*bash*")))
    (toggle-eshell "bash" shell-buffer-name)
    (with-current-buffer shell-buffer-name
      (goto-char (point-max))
      (cd dest-dir-cd)
      (insert (concat "cd \"" dest-dir-cd "\""))
      (eshell-send-input))))

;;;###autoload
(defun toggle-e-bash(&optional arg dir)
  (interactive "P")
  (toggle-eshell "bash"  (toggle-shell-completing-read-buffer-name arg "*bash*")))

;;;###autoload
(defun toggle-e-zsh-cd(&optional arg dir)
  (interactive "P")
  (let ((dest-dir-cd (or dir default-directory))
        (shell-buffer-name (toggle-shell-completing-read-buffer-name arg "*zsh*")))
    (toggle-eshell "zsh" shell-buffer-name)
    (with-current-buffer shell-buffer-name
      (goto-char (point-max))
      (cd dest-dir-cd)
      (insert (concat "cd \"" dest-dir-cd "\""))
      (eshell-send-input)))
  )

;;;###autoload
(defun toggle-e-zsh(&optional arg dir)
  (interactive "P")
  (toggle-eshell "zsh"  (toggle-shell-completing-read-buffer-name arg "*zsh*")))


;;using anything.el as the complete engine
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map [M-right] 'copy-above-while-same);
              (define-key eshell-mode-map [remap eshell-previous-matching-input] 'anything-eshell-history ) ;M-r
              (define-key eshell-mode-map [remap pcomplete] 'anything-esh-pcomplete))) ;Tab

(setq-default eshell-directory-name (expand-file-name "~/.emacs.d/eshell"))

;;在eshell 中,输入clear 命令,会调用这个函数 ,清屏
;;;###autoload
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defalias 'vi 'find-file)
(defalias 'o 'find-file-other-window)


(provide 'joseph-eshell)
;;; joseph-eshell.el ends here
