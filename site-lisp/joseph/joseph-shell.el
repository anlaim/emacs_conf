(defun n-shell-simple-send (proc command)
  "shell����clear ,exit ,man ĳЩ���������,�����⴦��
 clear ,������exit ,��رմ���
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
;;��eshell ��,����clear ����,������������ ,����
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
;;��һЩ���Գ�����echo.exe Ĭ�������Ҳ����ʾ��ִ�е�����,���hook
;;����ʹ������ʾ��Ӧ����ʾ�Ĳ���
;;�� $echo a
;;Ĭ�ϻ���ʾΪ
;;echo a
;;a
;;�д˺�ֻ��ʾa
;; (defun joseph-comint-init () (setq comint-process-echoes t))
;; (add-hook 'comint-mode-hook 'joseph-comint-init)
;;��������ܹرջ���,�������������
;;(setq explicit-cmd.exe-args '("/q"));;��ʹ��cmd ʱ,ʹ��/q ����, ע����������cmd.exe ,
;;;;���$SHELL =bash ,��Ӧ �ı�������explicit-bash-args ,


(provide 'joseph-shell)
