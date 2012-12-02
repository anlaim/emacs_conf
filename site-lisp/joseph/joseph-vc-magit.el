;;; joseph-vc-magit.el --- Description

;; Description: Description
;; Created: 2012-12-02 17:00
;; Last Updated: 纪秀峰 2012-12-02 17:19:20 星期日
;; Author: 纪秀峰  jixiuf@gmail.com
;; Keywords:
;; URL: http://www.emacswiki.org/emacs/download/joseph-vc-magit.el

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
  (add-to-list 'load-path  (expand-file-name "."))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/"))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/helm"))
  (add-to-list 'load-path  (expand-file-name "~/.emacs.d/site-lisp/magit"))
  (require 'magit)
  (require 'magit-svn)
  (require 'helm))


(defun magit-mode-hook-fun()
  (turn-on-magit-svn)
  (define-key magit-mode-map (kbd "C-w") nil)
  (define-key magit-mode-map "," 'helm-magit)
  (add-to-list 'magit-repo-dirs (expand-file-name ".." (magit-git-dir)))
  )
(add-hook 'magit-mode-hook 'magit-mode-hook-fun)

(unless magit-repo-dirs
  (setq magit-repo-dirs (list (expand-file-name "~/.emacs.d")
                              (expand-file-name "~/dotfiles")
                              (expand-file-name "~/documents/org/src"))))

(defvar helm-c-source-magit-history
  '((name . "Magit History:")
    (candidates . magit-repo-dirs)
    (action . (("Go" . (lambda(candidate) (magit-status candidate)))))))

;;;###autoload
(defun helm-magit()
  "helm magit status interface"
  (interactive)
  (helm '(helm-c-source-magit-history) ""  nil nil))

(defun magit-get-section-files(section-title)
  "get file path in section `section-title' ,`section-title' maybe
`staged' ,`unstaged' ,`untracked',`unpushed'"
  (save-excursion
    (let (section files-struct files)
      (magit-goto-section-at-path (list section-title))
      (setq section (magit-current-section))
      (when section
        (setq files-struct (magit-section-children section))
        (dolist (magit-section-struct files-struct)
          (add-to-list 'files (magit-section-title magit-section-struct))))
      files)))

(defun magit-log-edit-auto-insert-files()
  "提交代码时日志中自动插入staged的文件."
  (let ((files (with-current-buffer magit-buffer-internal (magit-get-section-files 'staged))))
    (when files
      (save-excursion
        (goto-char (point-min))
        (when (search-forward "\n受影响的文件:" (point-max) t)
          (delete-region (match-beginning 0) (point-max)))
        (goto-char (point-max))
        (insert "\n受影响的文件:\n    "
                (mapconcat 'identity files "\n    "))))))

(defun magit-log-edit-auto-insert-author()
  (save-excursion
    (goto-char (point-min))
    (if (search-forward magit-log-header-end (point-max) t) ;skip magit log header -end
        (goto-char (match-end 0))
      (goto-char (point-min)))
    (delete-horizontal-space)
    ;; (goto-char (point-at-eol))
    (let ((sign (format  "[%s]:" user-full-name)))
      (unless (looking-at (regexp-quote sign))
        (insert sign)))))

(defadvice magit-log-edit-commit (around auto-insert-author preactivate activate compile)
  (magit-log-edit-auto-insert-author)
  (magit-log-edit-auto-insert-files)
  ad-do-it)

;; 在magit buffer里，C-xvL 依然可以使用,
(defadvice vc-deduce-backend (around magit-support  preactivate activate compile)
  (let (backend)
    ad-do-it
    (setq backend ad-return-value)
    (unless backend
      (cond
       ((derived-mode-p 'magit-mode)
        (setq backend 'Git)
        )
       (t nil)))
    (setq ad-return-value backend)
    ))

(provide 'joseph-vc-magit)

;; Local Variables:
;; coding: utf-8
;; End:

;;; joseph-vc-magit.el ends here
