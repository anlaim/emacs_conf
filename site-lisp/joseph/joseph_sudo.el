;;; -*- coding:utf-8 -*-
;; this stuff help you to switch between edit current buffer as root and as  common user
;;(global-set-key (kbd "C-c o") 'toggle-read-only-file-with-sudo)
;; also you can  /usr/bin/emacsclient -t -e "(wl-sudo-find-file \"$1\" \"$PWD\")"
;;; toggle-read-only-file-with-sudo  函数的定义
(require 'tramp)
(defvar toggle-with-sudo-history-host-user-alist (make-hash-table))

;;;###autoload
(defun toggle-read-only-file-with-sudo (&optional argv)
  (interactive "P")
  (let* ((old-pos (point))
         (fname (or buffer-file-name dired-directory) )
         (local-hostname (get-localhost-name)))
    (when fname
      (cond
       ((tramp-remote-file-name-p fname local-hostname) ;打开远程文件
        (with-parsed-tramp-file-name fname nil
          (if (string-equal user "root")
              (let*((cache-username (gethash  (intern  host) toggle-with-sudo-history-host-user-alist))
                    (toggle-username (if argv
                                         (read-string (concat "username:[" cache-username "]") "" nil cache-username)
                                       (or cache-username "root"))))

                ;; (tramp-make-tramp-file-name method user host localname "")
                (puthash  (intern  host) user toggle-with-sudo-history-host-user-alist)
                (setq fname (concat "/ssh:" toggle-username "@" host  ":" localname)))
            (let*((cache-username (or (gethash  (intern  host) toggle-with-sudo-history-host-user-alist) "root")))
              (if argv
              (setq fname (concat "/" method ":" (read-string (concat "username:[" cache-username "]") "" nil cache-username) "@" host ":" localname))
              (setq fname (concat "/" method ":" user "@" host "|sudo:" "root"  "@" host ":" localname))
              (puthash  (intern  host) user toggle-with-sudo-history-host-user-alist))))))

       ((string-match (concat "^/sudo:.*@" (regexp-quote local-hostname)) fname) ;用sudo 打开了本机的文件
        (with-parsed-tramp-file-name fname nil (setq fname localname)))

       (t                               ;默认正常打开本机文件
        (let*((cache-username (or (gethash  (intern  local-hostname) toggle-with-sudo-history-host-user-alist) "root")))
          (setq fname (concat "/sudo:" (if argv (read-string (concat "username:[" cache-username "]") "" nil cache-username) "root") "@" local-hostname ":"  fname)))))
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
  (if (string-match "^/sudo:" (or (buffer-file-name)  dired-directory)) (toggle-to-root-header-warning))
  (when (or (string-match "^/etc" (or (buffer-file-name)  dired-directory))
            (string-match "^/private/etc" (or (buffer-file-name)  dired-directory)))
    (find-alternate-file (concat "/sudo:root@" (get-localhost-name) ":" (or (buffer-file-name)  dired-directory)))))

(add-hook 'find-file-hooks 'joseph-sudo-find-file-hook);; find-file-hooks 是加载完file 之后调用的一个hook
(add-hook 'dired-mode-hook 'joseph-sudo-find-file-hook) ;;



(provide 'joseph_sudo)
