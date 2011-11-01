;; -*- coding:utf-8 -*-
;;; exit and man and clear command in shell mode
;; ;; From: http://www.dotfiles.com/files/6/235_.emacs
;;在eshell 中,输入clear 命令,会调用这个函数 ,清屏
;;;###autoload
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun n-shell-simple-send (proc command)
  "shell对于clear ,exit ,man 某些特殊的命令,做特殊处理
 clear ,清屏，exit ,后关闭窗口"
  (cond
   ;; Checking for clear command and execute it.
   ((string-match "^[ \t]*vi[ \t]+\\(.*\\)$" command);;vi means open files
    (let ((origin-buf(current-buffer)))
      (erase-buffer)
      (comint-send-string proc "\n")
      (find-file (match-string  1 command))
      (delete-other-windows)
      (set-buffer origin-buf)))

   ((string-match "^[ \t]*clear[ \t]*$" command) ;;clear screen
    (erase-buffer)
    (comint-send-string proc "\n")
    (recenter-top-bottom))

   ((string-match "^[ \t]*man[ \t]+" command);;man ,call woman
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (when command (funcall 'woman command)(delete-other-windows)))
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))
   ))

(eval-after-load 'comint '(progn (setq comint-input-sender 'n-shell-simple-send)))

;;当退出时自动关闭当前buffer及窗口
(add-hook 'shell-mode-hook 'kill-buffer-when-exit-func)
(defun kill-buffer-when-exit-func()
  (set-process-sentinel
   (get-buffer-process (current-buffer))
   (lambda (process state) "DOCSTRING"
     (when (string-match "exited abnormally with code.*\\|finished\\|exited" state)
       (if (not (minibufferp))
           (kill-buffer-and-window)
         (kill-buffer (current-buffer)))))))



 ;; (setq process-coding-system-alist (cons '("bash" . undecided-unix) process-coding-system-alist))

;;; bash bash-cd
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (comint-output-filter-functions nil)

;;这里很多变量，都被我用let 置成临时变量，而全局的相应变量并没做修改，
;;因为在windows 上，我使用默认的cdmproxy
;;;###autoload
(defun toggle-shell (&optional shell-name shell-buffer-name)
  "Start `bash' shell."
  (interactive)
  (let ((binary-process-input t)
        (binary-process-output nil)
        (comint-scroll-show-maximum-output 'this)
        (shell-file-name (or shell-name "bash"))
        (shell-command-switch "-c");
        (explicit-shell-file-name (or shell-name "bash")) ;;term.el
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
        (ediff-shell shell-file-name)
        (inner-shell-buf-name (or shell-buffer-name "*bash*"))
        )
    ;; (when (equal system-type 'windows-nt)
    ;;   (setq comint-output-filter-functions '(comint-strip-ctrl-m))) 不知原因为何windows 上，加了这句后，shell不显颜色
    (setenv "SHELL" explicit-shell-file-name)
    (if (and (get-buffer inner-shell-buf-name)
             (buffer-live-p (get-buffer inner-shell-buf-name)))
        (cond
         ( (not (string= (buffer-name) inner-shell-buf-name))
           (switch-to-buffer-other-window inner-shell-buf-name))
         ((and (string= (buffer-name) inner-shell-buf-name)
               (> (length (window-list)) 1)
               (member last-command '(bash-cd bash)))
          (delete-other-windows)
          )
         ((and (string= (buffer-name) inner-shell-buf-name)
               (> (length (window-list)) 1))
          (delete-window)
          )
         ((and
           (string= (buffer-name) inner-shell-buf-name)
           (equal (length (window-list)) 1))
          (bury-buffer)
          ))
      (shell inner-shell-buf-name)(sleep-for 1)
      )
    ))

;;;###autoload
(defun toggle-bash-cd(&optional dir)
  (interactive)
  (let ((dest-dir-cd (or dir default-directory)))
    (toggle-shell "bash" "*bash*")
    (with-current-buffer "*bash*"
      (goto-char (point-max))
      ;; (comint-send-string (get-buffer-process (current-buffer)) "\n")
      ;; (comint-send-string (get-buffer-process (current-buffer)) (format "cd %s\n" dest-dir-cd))
      (insert (concat "cd " dest-dir-cd))
      (comint-send-input)
      )
    ))

;;;###autoload
(defun toggle-zsh-cd(&optional dir)
  (interactive)
  (let ((dest-dir-cd (or dir default-directory)))
    (toggle-shell "zsh" "*zsh*")
    (with-current-buffer "*zsh*"
      (goto-char (point-max))
      ;; (comint-send-string (get-buffer-process (current-buffer)) "\n")
      ;; (comint-send-string (get-buffer-process (current-buffer)) (format "cd %s\n" dest-dir-cd))
      (insert (concat "cd " dest-dir-cd))
      (comint-send-input))))

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
;;; 自动处理msys路径
(defun shell-msys-path-complete-as-command ()
  "replace /d/ with d:/ on windows when you press `TAB'in shell mode."
  (let* ((filename (comint-match-partial-filename))
         filename-beg filename-end driver-char)
    (when (equal system-type 'windows-nt)
      (cond
       ((and filename (string-equal  "/" filename) (looking-back "/")) ; replace "/" with root directory
        (setq filename-beg (match-beginning 0))
        (setq filename-end (match-end 0))
        (goto-char filename-beg)
        (delete-region filename-beg filename-end)
        (insert (substring (expand-file-name default-directory)  0 3))
        )
       ((and filename (string-match "^/\\([a-zA-Z]\\)" filename)) ; replace "/d" with "d:/"
        (setq driver-char (match-string 1 filename))
        (when (looking-back (regexp-quote filename))
          (setq filename-beg (match-beginning 0))
          (setq filename-end (match-end 0))
          (goto-char filename-beg)
          (delete-region filename-beg filename-end)
          (insert (replace-regexp-in-string "^/\\([a-zA-Z]\\)/?" (concat driver-char ":/") filename))))
       )))nil)

(eval-after-load 'shell
  '(add-to-list 'shell-dynamic-complete-functions 'shell-msys-path-complete-as-command))


;;; auto close *Completeion* after `TAB' complete
(defun comint-close-completions ()
  "Close the comint completions buffer.
Used in advice to various comint functions to automatically close
the completions buffer as soon as I'm done with it. Based on
Dmitriy Igrishin's patched version of comint.el."
  (if comint-dynamic-list-completions-config
      (progn
        (set-window-configuration comint-dynamic-list-completions-config)
        (setq comint-dynamic-list-completions-config nil))))

(defadvice comint-send-input (after close-completions activate)
  (comint-close-completions))

(defadvice comint-dynamic-complete-as-filename (after close-completions activate)
  (if ad-return-value (comint-close-completions)))

(defadvice comint-dynamic-simple-complete (after close-completions activate)
  (if (member ad-return-value '('sole 'shortest 'partial))
      (comint-close-completions)))

(defadvice comint-dynamic-list-completions (after close-completions activate)
  (comint-close-completions)
  (if (not unread-command-events)
      ;; comint's "Type space to flush" swallows space. put it back in.
      (setq unread-command-events (listify-key-sequence " "))))

 (provide 'joseph-shell)
