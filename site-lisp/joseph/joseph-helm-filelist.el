;; -*- coding:utf-8 -*-
;;helm-config 中提供了filelist 的功能，在linux 上使用它就可以了
;;但在windows上emacs总不能与像grep find es等程序合作(不是不能，是经常的当掉)
;;所以有此段小程序
;;使用方法，只要将某个文件的完整路径加入到joseph-helm-find-in-filelist-file-name
;;指向的文件中，每行一个。
;; (helm-filelist-add-matched-files-in-dir-recursively "d:/workspace/HH_MRP1.0/" "\\.cs$")
;; (helm-filelist-add-matched-files-in-dir-recursively "~/.emacs.d/site-lisp/" nil nil "\\.elc$\\|\\.git\\b\\|cedet-1\\.0\\|\\borg-mode-git\\b\\|\\bnxhtml\\b\\|malabar-1.5-SNAPSHOT" t)
;; (helm-filelist-add-matched-files-in-dir-recursively "d:/workspace/HH_MRP1.0/" nil nil "\\bobj\\|\\bbin\\b\\|\\.svn\\b\\|\\.git\\b\\|\\.dll\\|~$\\|Service References" t)
;;find / >~/.emacs.d/cache/filelist
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'joseph_byte_compile_include)
  (require 'helm)
  )

(defvar joseph-helm-find-in-filelist-file-name "~/.emacs.d/cache/filelist")
(defvar joseph-helm-find-in-filelist-buffer nil)
(defun joseph-helm-find-in-filelist-init()
  (unless (and  joseph-helm-find-in-filelist-buffer
                (buffer-live-p joseph-helm-find-in-filelist-buffer))
    (with-current-buffer
        (setq
         joseph-helm-find-in-filelist-buffer
         (find-file-noselect
          (expand-file-name joseph-helm-find-in-filelist-file-name)))
      (rename-buffer  " *helm filelist 4 windows*")))
  (with-current-buffer (helm-candidate-buffer 'global)
    (insert-buffer-substring joseph-helm-find-in-filelist-buffer)
    ))

(defvar helm-c-source-joseph-filelist
  '((name . "Find file in filelist")
    (init . joseph-helm-find-in-filelist-init)
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

 ;;

(defun helm-filelist-add-matched-files-in-dir-recursively
  (dir &optional include-regexp include-regexp-absolute-path-p exclude-regex exclude-regex-absolute-path-p)
  "add matched files to filelist"
  (let((file-opend (find-buffer-visiting joseph-helm-find-in-filelist-file-name)))
    (with-current-buffer (find-file-noselect joseph-helm-find-in-filelist-file-name)
      (goto-char (point-max))
      (dolist (file (all-files-under-dir-recursively
                     dir include-regexp include-regexp-absolute-path-p exclude-regex exclude-regex-absolute-path-p)
                     )
        (insert file)
        (insert "\n"))
      (save-buffer (find-file-noselect joseph-helm-find-in-filelist-file-name))
      (set-buffer-modified-p nil)
      )
    (when (not file-opend)
      (kill-buffer file-opend))))

;; (helm-filelist-add-matched-files-in-dir-recursively "~/.emacs.d/site-lisp/" nil nil "\\.elc$\\|\\.git\\b\\|cedet-1\\.0\\|\\borg-mode-git\\b\\|\\bnxhtml\\b\\|malabar-1.5-SNAPSHOT\\|\\bicicles\\b" t)
;; (helm-filelist-add-matched-files-in-dir-recursively "d:/workspace/HH_MRP1.0/" nil nil "\\bobj\\|\\bbin\\b\\|\\.svn\\b\\|\\.git\\b\\|\\.dll\\|~$\\|Service References" t)

(provide 'joseph-helm-filelist)
