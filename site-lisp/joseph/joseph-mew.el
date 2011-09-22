(eval-when-compile (add-to-list 'load-path  (expand-file-name ".")) (require 'mew-vars))

(autoload 'mew "mew" nil t) ;用于收信
(autoload 'mew-send "mew" nil t);用于送信
;;C-xm 会被自动绑定为send mail
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

(if (string-equal system-type "windows-nt")
    ;; Note,in windows,you must use replace stunnel4 with stunnel3 version.
    (setq mew-prog-ssl  "C:/Program Files/stunnel/stunnel.exe")
  (setq mew-prog-ssl "/usr/bin/stunnel"))

(setq-default mew-conf-path "~/.emacs.d/cache/mail")
(setq-default mew-mail-path "~/.emacs.d/cache/mail")
(setq-default mew-rc-file "~/.emacs.d/site-lisp/joseph/joseph-dotmew.el")

