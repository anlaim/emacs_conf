;; -*- coding:utf-8 -*-
(defun n-shell-simple-send (proc command)
  "shell对于clear ,exit ,man 某些特殊的命令,做特殊处理
 clear ,清屏，exit ,后关闭窗口
"
  (cond
   ;; Checking for clear command and execute it.
   ;; (string-match "^[ \t]*clear[ \t]*$" command)
   ;; ;; (comint-send-string proc "\nexit\n")
   ;; ;; (erase-buffer)
   ;; (recenter-top-bottom)
   ;; )
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

(setq process-coding-system-alist (cons '("bash" . undecided-unix) process-coding-system-alist))

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

;;;###autoload
(defun set-shell-bash()
  "Enable on-the-fly switching between the bash shell and DOS."
  (interactive)
  ;; (setq binary-process-input t)
  (setq comint-scroll-show-maximum-output 'this)

  ;; (setq shell-file-name "bash")
  ;; (setq shell-command-switch "-c")      ; SHOULD IT BE (setq shell-command-switch "-ic")?

  (setq explicit-shell-file-name "bash") ;;term.el
  (setenv "SHELL" explicit-shell-file-name)
  (setq explicit-bash-args '("-login" "-i"))
  (make-variable-buffer-local 'comint-completion-addsuffix)
  (setq comint-completion-addsuffix t);;目录补全时,在末尾加一个"/"字符
  (setq comint-eol-on-send t)
  (setq comint-file-name-quote-list '(?\  ?\")) ;;当文件名中有这些(空格引号)特殊字符时会把这些特殊字符用"\"转义
  (setq w32-quote-process-args ?\")  ;;再给程序传递参数的时候,使用这个字符将参数括起来
  (eval-after-load 'ediff-diff '(progn (setq ediff-shell shell-file-name))) ;;Ediff shell
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m nil t)
  ;; Unfortunately, when you visit a DOS text file within an
  ;; encoded file, you'll see CRs (^Ms) in the buffer.
  ;; If `binary-process-output' is set to `nil', this problem goes
  ;; away, which is fine for files of type `.gz'.
  (setq binary-process-input t)
  (setq binary-process-output nil)
  )

;;;###autoload
(defun set-shell-cmdproxy()
  "Set shell to `cmdproxy'."
  (interactive)
  (setq shell-file-name "cmdproxy")
  (setq explicit-shell-file-name "cmdproxy")
  (setenv "SHELL" explicit-shell-file-name)
  ;;;;;(setq explicit-sh-args nil)           ; Undefined?
  (setq w32-quote-process-args nil))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


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
