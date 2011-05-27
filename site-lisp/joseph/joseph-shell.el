(defun n-shell-simple-send (proc command)
  "shell对于clear ,exit ,man 某些特殊的命令,做特殊处理
 clear ,清屏，exit ,后关闭窗口
"
  (cond
   ;; Checking for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (comint-send-string proc "\nexit\n")
    (erase-buffer)
    )
   ((string-match "^[ \t]*exit[ \t]*$" command)
    (comint-simple-send proc command)
    (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)
    (kill-buffer-and-window)
    )
   ;; Checking for man command and execute it.

   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (funcall 'man command)
    )
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))
   )
  )
(eval-after-load 'comint
  '(progn (setq comint-process-echoes t)
          (setq comint-input-sender 'n-shell-simple-send)))


;; ;; From: http://www.dotfiles.com/files/6/235_.emacs
;;在eshell 中,输入clear 命令,会调用这个函数 ,清屏
;;;###autoload
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


;;;###autoload
(defun bash ()
  "Start `bash' shell."
  (interactive)
  (let ((binary-process-input t)
        (binary-process-output nil))
    (shell)))
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
