;; -*- coding:utf-8 -*-

(defun n-shell-simple-send (proc command)
  "shell对于clear ,exit ,man 某些特殊的命令,做特殊处理
 clear ,清屏，exit ,后关闭窗口"
  (cond
   ;; Checking for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (erase-buffer)
    (comint-send-string proc "\n")
    (recenter-top-bottom))
   ((string-match "^[ \t]*exit[ \t]*$" command)
    (comint-simple-send proc command)
    (remove-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
    (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)
    (kill-buffer-and-window))

   ;; Checking for man command and execute it.
   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (when command (funcall 'woman command)(delete-other-windows))
    )
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))
   )
  )

(eval-after-load 'comint '(progn (setq comint-input-sender 'n-shell-simple-send)))

 ;; (setq process-coding-system-alist (cons '("bash" . undecided-unix) process-coding-system-alist))


;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (comint-output-filter-functions nil)

;;这里很多变量，都被我用let 置成临时变量，而全局的相应变量并没做修改，
;;因为在windows 上，我使用默认的cdmproxy
;;;###autoload
(defun bash ()
  "Start `bash' shell."
  (interactive)
  (let ((binary-process-input t)
        (binary-process-output nil)
        (comint-scroll-show-maximum-output 'this)
        (shell-file-name "bash")
        (shell-command-switch "-c");
        (explicit-shell-file-name "bash") ;;term.el
        (explicit-bash-args '("-login" "-i"))
        (comint-completion-addsuffix t);;目录补全时,在末尾加一个"/"字符
        (comint-eol-on-send t)
        (comint-file-name-quote-list '(?\  ?\")) ;;当文件名中有这些(空格引号)特殊字符时会把这些特殊字符用"\"转义
        (w32-quote-process-args ?\")  ;;再给程序传递参数的时候,使用这个字符将参数括起来
        ;; (eval-after-load 'ediff-diff '(progn (setq ediff-shell shell-file-name))) ;;Ediff shell
        ;; Unfortunately, when you visit a DOS text file within an
        ;; encoded file, you'll see CRs (^Ms) in the buffer.
        ;; If `binary-process-output' is set to `nil', this problem goes
        ;; away, which is fine for files of type `.gz'.
        (ediff-shell shell-file-name))
    ;; (when (equal system-type 'windows-nt)
    ;;   (setq comint-output-filter-functions '(comint-strip-ctrl-m))) 不知原因为何windows 上，加了这句后，shell不显颜色
    (setenv "SHELL" explicit-shell-file-name)
    (if (and (get-buffer "*bash*")
             (buffer-live-p (get-buffer "*bash*")))
        (cond
         ( (not (string= (buffer-name) "*bash*"))
           (switch-to-buffer-other-window "*bash*"))
         ((and (string= (buffer-name) "*bash*")
               (> (length (window-list)) 1)
               (member last-command '(bash-cd bash)))
          (delete-other-windows)
          )
         ((and (string= (buffer-name) "*bash*")
               (> (length (window-list)) 1))
          (delete-window)
          )
         ((and
           (string= (buffer-name) "*bash*")
           (equal (length (window-list)) 1))
          (bury-buffer)
          ))
      (shell "*bash*")(sleep-for 1)
      )
    ))

;;;###autoload
(defun bash-cd(&optional dir)
  (interactive)
  (let ((dest-dir-cd (or dir default-directory)))
    (bash)
    (with-current-buffer "*bash*"
      (goto-char (point-max))
      (insert (concat "cd " dest-dir-cd))
      (comint-send-input))
    ))


;; ;;;###autoload
;; (defun set-shell-bash()
;;   "Enable on-the-fly switching between the bash shell and DOS."
;;   (interactive)
;;   (setq comint-scroll-show-maximum-output 'this)

;;   (setq shell-file-name "bash")
;;   (setq shell-command-switch "-c")      ; SHOULD IT BE (setq shell-command-switch "-ic")?

;;   (setq explicit-shell-file-name "bash") ;;term.el
;;   (setenv "SHELL" explicit-shell-file-name)
;;   (setq explicit-bash-args '("-login" "-i"))

;;   (make-variable-buffer-local 'comint-completion-addsuffix)
;;   (setq comint-completion-addsuffix t);;目录补全时,在末尾加一个"/"字符
;;   (setq comint-eol-on-send t)
;;   (setq comint-file-name-quote-list '(?\  ?\")) ;;当文件名中有这些(空格引号)特殊字符时会把这些特殊字符用"\"转义
;;   (setq w32-quote-process-args ?\")  ;;再给程序传递参数的时候,使用这个字符将参数括起来
;;   (eval-after-load 'ediff-diff '(progn (setq ediff-shell shell-file-name))) ;;Ediff shell
;;   (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m nil t)
;;   ;; Unfortunately, when you visit a DOS text file within an
;;   ;; encoded file, you'll see CRs (^Ms) in the buffer.
;;   ;; If `binary-process-output' is set to `nil', this problem goes
;;   ;; away, which is fine for files of type `.gz'.
;;   (setq binary-process-input t)
;;   (setq binary-process-output nil)
;;   )


;;;###autoload
(defun cmdproxy()
  "Set shell to `cmdproxy'."
  (interactive)
  (let((shell-file-name "cmdproxy")
       (explicit-shell-file-name "cmdproxy")
       )
    (shell "cmd")
    )
  ;; (setenv "SHELL" explicit-shell-file-name)
  )

;; (if (equal system-type 'windows-nt)
;;   (set-shell-cmdproxy)
;;   (set-shell-bash))

;; ;; From: http://www.dotfiles.com/files/6/235_.emacs
;;在eshell 中,输入clear 命令,会调用这个函数 ,清屏
;;;###autoload
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


;;有一些回显程序如echo.exe 默认情况下也会显示你执行的命令,这个hook
;;可以使它仅显示它应该显示的部分
;;如 $echo a
;;默认会显示为
;;echo a
;;a
;;有此后只显示a
;; (defun joseph-comint-init () (setq comint-process-echoes t))
;; (add-hook 'comint-mode-hook 'joseph-comint-init)
;;如果还不能关闭回显,可以用这个方法
;;(setq explicit-cmd.exe-args '("/q"));;在使用cmd 时,使用/q 参数, 注意变量名里的cmd.exe ,
;;;;如果$SHELL =bash ,相应 的变量名是explicit-bash-args ,


 (provide 'joseph-shell)
