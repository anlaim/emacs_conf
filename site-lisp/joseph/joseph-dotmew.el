(setq mew-fcc "+sent")
(setq mew-demo-picture nil)
(setq mew-pop-size 0)
(setq mew-auto-get t)
;; (setq toolbar-mail-reader 'Mew)
(setq mew-use-cached-passwd t)
(setq mew-passwd-timer-unit 999)
(setq mew-passwd-lifetime 999)
(set-default 'mew-decode-quoted 't)
(setq mew-prog-pgp "gpg")
(setq mew-pop-delete nil)
(setq mew-config-alist
      ;;Gmail
      '(("default"
         ("name"	. "jixiuf")
         ("user"	. "jixiuf")
         ("mail-domain" . "gmail.com")
         ("proto" . "%")
         ("imap-server"	. "imap.gmail.com")
         ;; ("imap-ssh-server"	. "SSH server address")
         ("imap-user"	. "jixiuf@gmail.com")
         ("imap-size"	. 0)
         ("imap-delete" . t)
         ("imap-ssl" . t)
         ("imap-ssl-port" . 993)
         ("imap-queue-folder" . "%queue")
         ("imap-trash-folder" . "%INBOX.Trash") ;; This must be in concile with your IMAP box setup

         ("smtp-ssl"	. t)
         ("smtp-ssl-port". "465")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"	. "jixiuf@gmail.com")
         ("smtp-server"	. "smtp.gmail.com")

         )
        ("pop3"
         ("name"		. "jixiuf")
         ("user"		. "jixiuf")
         ("mail-domain"	. "gmail.com")
         ("proto"	. "+")
         ("pop-ssl"	. t)
         ("pop-ssl-port"	. "995")
         ("pop-auth"	. pass)
         ("pop-user"	. "jixiuf@gmail.com")
         ("pop-server"	. "pop.gmail.com")

         ("smtp-ssl"	. t)
         ("smtp-ssl-port". "465")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"	. "jixiuf@gmail.com")
         ("smtp-server"	. "smtp.gmail.com")
         )
        ))
(setq mew-ssl-verify-level 0)



;;Biff 好像在modeline 显示新邮件个数
(setq mew-use-biff t) ;; nil
(setq mew-use-biff-bell t) ;; nil

;;Reply

;;Sort
(setq mew-sort-default-key-alist
      '(("+inbox" . "date")
        ("+xiyoulinux". "subject")
        ("+zh-kernel". "subject")
        ("+zeuux". "subject")
        ("+lkml" . "subject")))

(shell-command "notify-send asdas")
