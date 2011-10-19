;;; -*- coding:utf-8 -*-
;;anything-config 中提供了filelist 的功能，在linux 上使用它就可以了
;;但在windows上emacs总不能与像grep find es等程序合作(不是不能，是经常的当掉)
;;所以有此段小程序
;;使用方法，只要将某个文件的完整路径加入到joseph-anything-find-in-filelist-file-name
;;指向的文件中，每行一个。
;; (anything-filelist-add-matched-files-in-dir-recursively "d:/workspace/HH_MRP1.0/" "\\.cs$")
;;find / >~/.emacs.d/cache/filelist
(defvar joseph-anything-find-in-filelist-file-name "~/.emacs.d/cache/filelist")
(defvar joseph-anything-find-in-filelist-buffer nil)
(defun joseph-anything-find-in-filelist-init()
  (unless (and  joseph-anything-find-in-filelist-buffer
                (buffer-live-p joseph-anything-find-in-filelist-buffer))
    (with-current-buffer
        (setq
         joseph-anything-find-in-filelist-buffer
         (find-file-noselect
          (expand-file-name joseph-anything-find-in-filelist-file-name)))
      (rename-buffer  " *anything filelist 4 windows*")))
  (with-current-buffer (anything-candidate-buffer 'global)
    (insert-buffer joseph-anything-find-in-filelist-buffer)
    ))

(defvar anything-c-source-joseph-filelist
  '((name . "Find file in filelist")
    (init . joseph-anything-find-in-filelist-init)
    (candidates-in-buffer)
    (type . file)
    ))

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((lines) (end (copy-marker end)))
      (goto-char start)
      (while (and (< (point) (marker-position end))
                  (not (eobp)))
        (let ((line (buffer-substring-no-properties
                     (line-beginning-position) (line-end-position))))
          (if (member line lines)
              (delete-region (point) (progn (forward-line 1) (point)))
            (push line lines)
            (forward-line 1)))))))

;; (anything-filelist-add-matched-files-in-dir-recursively "d:/workspace/HH_MRP1.0/" "\\.cs$")
(defun anything-filelist-add-matched-files-in-dir-recursively
  (dir &optional include-regexp)
  "add matched files to filelist"
  (let((file-opend (find-buffer-visiting joseph-anything-find-in-filelist-file-name)))
    (with-current-buffer (find-file-noselect joseph-anything-find-in-filelist-file-name)
      (goto-char (point-max))
      (dolist (file (joseph-all-files-under-dir-recursively
                     (expand-file-name dir) include-regexp))
        (insert file)
        (insert "\n"))
      (save-current-buffer)
      (setq buffer-modified-p nil)
      )
    (when (not file-opend)
      (kill-buffer file-opend))))

(provide 'joseph-anything-filelist)
