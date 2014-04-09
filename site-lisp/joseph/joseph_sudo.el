;;; -*- coding:utf-8 -*-
;; this stuff help you to switch between edit current buffer as root and as  common user
;;(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
;; also you can  /usr/bin/emacsclient -t -e "(wl-sudo-find-file \"$1\" \"$PWD\")"
;;; toggle-read-only-file-with-sudo  函数的定义
(require 'tramp)
;; (defvar toggle-with-sudo-history-host-user-alist nil)

;;;###autoload
(defun toggle-read-only-file-with-sudo (&optional argv)
  (interactive "P")
  (let* ((old-pos (point))
         (fname (or buffer-file-name dired-directory) )
         (local-hostname (get-localhost-name))
         (sudo-username (if argv
                            (read-string "username:[root]" "" nil "root")
                          "root" )))
    (when fname
      (cond
       ((tramp-remote-file-name-p fname local-hostname) ;打开远程文件
        (with-parsed-tramp-file-name fname nil
          ;; (tramp-make-tramp-file-name method user host localname "")
          (if  (string-equal user "root")
            (setq fname (concat "/ssh:" (read-string "username:[root]" "" nil "root") "@" host  ":" localname)) ;这里可能需要改进
            (setq fname (concat "/" method ":" user "@" host "|sudo:" sudo-username "@" host ":" localname)))))

       ((string-match (concat "^/sudo:.*@" (regexp-quote local-hostname)) fname) ;用sudo 打开了本机的文件
        (with-parsed-tramp-file-name fname nil (setq fname localname)))
       (t                               ;默认正常打开本机文件
        (setq fname (concat "/sudo:" sudo-username "@" local-hostname ":"  fname))))
      (find-alternate-file fname) ;;
      (goto-char old-pos))))

(defun get-localhost-name()
  (let* ((default-directory (expand-file-name "~"))
         (hostname (shell-command-to-string "hostname" )))
    (substring hostname  0 (string-match "$" hostname )))) ;trim \n


(defun tramp-remote-file-name-p(filename local-hostname)
  (and (or (string-match "/ssh:"  filename)
           (string-match "/sudo:"  filename))
       (not (string-match (concat (regexp-quote local-hostname) "[:\\|\\]")  filename))
       (not (string-match "localhost[:\\|\\]"  filename))
       (not (string-match (concat (regexp-quote "127.0.0.1") "[:\\|\\]")  filename))))


;; ;;;###autoload
;; (defun wl-sudo-find-file (file &optional dir)
;;   (interactive (find-file-read-args "Find file with sudo : "
;;                         (confirm-nonexistent-file-or-buffer)))
;;   (find-file (concat "/sudo:root@localhost:" (expand-file-name file dir)))
;;   )


;;; 当切换到root 用户时，为作区别 ，外观显红色

(defface toggle-to-root-header-face
  '((t (:foreground "white" :background "red3")))
  "*Face use to display header-lines for files opened as root."
    :group 'emacs)

;;when open a file with sudo ,then change the face of the file to waring
(defun toggle-to-root-header-warning ()
  "*Display a warning in header line of the current buffer.
   This function is suitable to add to `toggle-to-root-hook'."
  (let* ((warning "WARNING: EDITING FILE AS ROOT!")
         (space (+ 6 (- (window-width) (length warning))))
         (bracket (make-string (/ space 5) ?-))
         (warning (concat bracket bracket warning bracket bracket bracket )))
    (setq header-line-format
          (propertize  warning 'face 'toggle-to-root-header-face))))

;;; 加载一个新文件时，如果是sudo 开头的文件 ，也加上红色的外观
(defun joseph-sudo-find-file-hook ()
  (if (string-match "^/sudo:" (buffer-file-name)) (toggle-to-root-header-warning))
  (when (or (string-match "^/etc" (buffer-file-name))
            (string-match "^/private/etc" (buffer-file-name)))
    (find-alternate-file (concat "/sudo:root@" (get-localhost-name) ":" (buffer-file-name)))))

(add-hook 'find-file-hooks 'joseph-sudo-find-file-hook);; find-file-hooks 是加载完file 之后调用的一个hook



(provide 'joseph_sudo)
