;;; -*- coding:utf-8 -*-
;;anything-config 中提供了filelist 的功能，在linux 上使用它就可以了
;;但在windows上emacs总不能与像grep find es等程序合作(不是不能，是经常的当掉)
;;所以有此段小程序
;;使用方法，只要将某个文件的完整路径加入到joseph-anything-find-in-filelist-file-name
;;指向的文件中，每行一个。
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

(provide 'joseph-anything-filelist)
