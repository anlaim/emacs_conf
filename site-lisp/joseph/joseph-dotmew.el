;; 本文件默认是~/.mew.el , (setq-default mew-rc-file "~/.emacs.d/site-lisp/joseph/joseph-dotmew.el")
(eval-when-compile
  (add-to-list 'load-path  (expand-file-name "."))
  (require 'mew-vars))

;;未读邮件用"U"标记出来  When you read a message with `SPC', `n', or `p' and etc, the `U' mark disappears.
(setq mew-use-unread-mark t)
;`zSPC' ,只显示标记为* 与U 的邮件
;; `M-u' 重新标记为未读 Put the `U' mark to the current message.

(setq mew-use-cached-passwd t) ;;cache password in memory
(setq mew-passwd-timer-unit 999);;设置缓存时间长一点 ,默认是10
(setq mew-passwd-lifetime 999) ;默认是2 两者相乘10*2 ,即默认缓存20min密码
;; (setq mew-use-master-passwd t)

(setq mew-fcc "+sent")
(setq mew-demo-picture nil)             ;不显示那两只猫
(setq mew-auto-get t)                   ;自动收邮件
(set-default 'mew-decode-quoted 't)
(setq mew-prog-pgp "gpg")

;; 我们分别定义了两个 folder，”default”，”pop3-gmail-folder" 如果我们切换
;; 至 “pop3-gmail-folder” folder，mew 默认会用pop3收取gmail 邮件.mew默认使
;; 用 mew 时，使用的为 “default” folder，即使用 imap 协议 收取 Gmail 邮件。
;; 在 summary-mode 中，可以通过快捷键 “C” 方便地在不同 folder 之间切换。
;; g 可在inbox send ,即收件箱,发件箱,垃圾箱等间切换.
;; s 之后可选update ,all,sync,last 等,与服务器同步邮件
(setq mew-config-alist
      ;;Gmail
      '(("default" ;;pop3 gmail
         ("name"		. "jixiuf")
         ("user"		. "jixiuf")
         ("mail-domain"	. "gmail.com")
         ("proto"	. "$") ; +,$,%,- 对应着 local/pop/imap/nntp
         ("pop-ssl"	. t)
         ("pop-ssl-port"	. "995")
         ("pop-auth"	. pass)
         ("pop-user"	. "jixiuf@gmail.com")
         ("pop-server"	. "pop.gmail.com")
         ("pop-size"	. 0)
         ("pop-delete" . t)

         ("smtp-ssl"	. t)
         ("smtp-ssl-port". "465")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"	. "jixiuf@gmail.com")
         ("smtp-server"	. "smtp.gmail.com")
         )
        ("hackjixf@gmail.com" ;;pop3 gmail
         ("name"		. "hackjixf")
         ("user"		. "hackjixf")
         ("mail-domain"	. "gmail.com")
         ("proto"	. "+")
         ("pop-ssl"	. t)
         ("pop-ssl-port"	. "995")
         ("pop-auth"	. pass)
         ("pop-user"	. "hackjixf@gmail.com")
         ("pop-server"	. "pop.gmail.com")
         ("pop-size"	. 0)
         ("pop-delete" . nil)

         ("smtp-ssl"	. t)
         ("smtp-ssl-port". "465")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"	. "hackjixf@gmail.com")
         ("smtp-server"	. "smtp.gmail.com")
         )
        ;; ("imap-gmail-folder" ;在windows上,和imap收信会崩,故引用pop3作为默认收信
        ;;  ("name"	. "jixiuf")
        ;;  ("user"	. "jixiuf")
        ;;  ("mail-domain" . "gmail.com")
        ;;  ("proto" . "%")
        ;;  ("imap-server"	. "imap.gmail.com")
        ;;  ;; ("imap-ssh-server"	. "SSH server address")
        ;;  ("imap-user"	. "jixiuf@gmail.com")
        ;;  ("imap-size"	. 0)
        ;;  ("imap-delete" . t)
        ;;  ("imap-ssl" . t)
        ;;  ("imap-ssl-port" . 993)
        ;;  ("imap-queue-folder" . "%queue")
        ;;  ("imap-trash-folder" . "%INBOX.Trash") ;; This must be in concile with your IMAP box setup
        ;;  ;; ("imap-header-only" . t) ;只下载邮件头,不下载内容,直到查看文件内容时才下载.
        ;;  ("smtp-ssl"	. t)
        ;;  ("smtp-ssl-port". "465")
        ;;  ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
        ;;  ("smtp-user"	. "jixiuf@gmail.com")
        ;;  ("smtp-server"	. "smtp.gmail.com")

        ;;  )
        ("qq-pop3"
         ("name"		. "jixiuf")
         ("user"		. "jixiuf")
         ("mail-domain"	. "qq.com")
         ("proto"	. "+")
         ("pop-ssl"	. t)
         ("pop-ssl-port"	. "995")
         ("pop-auth"	. pass)
         ("pop-user"	. "jixiuf@qq.com")
         ("pop-server"	. "pop.qq.com")
         ("pop-size"	. 0)
         ("pop-delete" . nil)

         ("smtp-ssl"	. t)
         ("smtp-ssl-port". "465")
         ("smtp-auth-list" . ("PLAIN" "LOGIN" "CRAM-MD5"))
         ("smtp-user"	. "jixiuf@qq.com")
         ("smtp-server"	. "smtp.qq.com")
         )
        ("softbrain"
         ("name"		. "jixf")
         ("user"		. "jixf")
         ("mail-domain"	. "softbrain-offshore.com.cn")
         ("proto"	. "+")
         ("pop-ssl"	. t)
         ("pop-ssl-port"	. "995")
         ("pop-auth"	. pass)
         ("pop-user"	. "jixf@softbrain-offshore.com.cn")
         ("pop-server"	. "172.20.65.50")
         ("pop-size"	. 0)
         ("pop-delete" . nil)

         ("smtp-ssl"	. nil)
         ("smtp-ssl-port". "995")
         ("smtp-auth-list" . ( "LOGIN" "PLAIN" "CRAM-MD5"))
         ("smtp-user"	. "jixf@softbrain-offshore.com.cn")
         ("smtp-server"	. "172.20.65.50")
         )
        ))
 (setq mew-ssl-verify-level 0)



;;Biff 好像在modeline 显示新邮件个数
(setq mew-use-biff t) ;; nil
(setq mew-use-biff-bell t) ;; nil

;; 引用
;; mew 可以灵活的设置如何引用邮件上下文，定制引用的格式。mew的引用是
;; 由变量 mew-cite-fields 控制，有 From，Subject，Date 域，具体的引用
;; 样式由 mew-cite-format 设置。mew 默认的配置如下：
;; (defvar mew-cite-fields '("From:" "Subject:" "Date:"))
;; (defvar mew-cite-format "From: %s\nSubject: %s\nDate: %s\n\n")
;; (defvar mew-cite-prefix "> ")

;; 如何回复，回复的位置，大概是邮件中争论最多的地方。基本上所有邮件的 web 客户
;; 端，Gmail，outlook 都默认使用上回复(top-posting)，但是邮件列表和新闻组
;; (usenet)提倡下回复(bottom-posting)，在一个社区中使用“错误”的风格，可能被视
;; 作严重违反网络礼仪，从而遭致社区成员的激烈反应。可以参考 wiki 和 python的邮
;; 件列表规范和礼节。回到 mew 的设置，通过设置变量
;; mew-summary-reply-with-citation-position 可以选择是使用上回复或是下回复。如
;; 果设置为 body，即回复出现在引文之前，名为上回复，如设置为 end，在引文后回复，
;; 使用下回复样式。
(setq mew-summary-reply-with-citation-position 'body)

;; 插入修改签名 `C-cTAB'
;; (setq mew-signature-file "~/.emacs.d/mail/signature")
;; (setq mew-signature-as-lastpart t)
;; (setq mew-signature-insert-last t)

;; 获取相应协议的邮件。但此时位于 summary 模式时，只需输入 ‘i’ 即可需要再
;; 查收远程 folder 上的邮件，试试 ’s’ 快捷键。对于 IMAP 和 NetNews，更加建
;; 议使用 ’s’而非 ‘i’
;; 当使用 ‘C-u s’快捷键时，可以在仅获取邮件头和获取完整邮件信息间切换

(setq mew-summary-form
      '(type (5 date) " " (14 from) " " t (0 subj)))
(setq mew-summary-form-extract-rule '(name))

;; w 写信
;; M-TAB 补齐收信人信息
;; Q 退出mew
;; i 收信
;; g 跳转邮箱
;; o 对邮件进行分类
;; d 把邮件标记为删除
;; * 作星号标记
;; u 清除标记
;; x 对所有标记进行处理(如删除)
;; a 不带引用的回复，不建议使用
;; A 带引用的回复，推荐
;; f 转发邮件
;; y 保存邮件，会提示是保存整个邮件和是仅保存正文
;; SPACE 阅读邮件
;; ENTER 让阅读的邮件向上滚动一行
;; - 向下滚动一行
;; n 下一封邮件
;; p 前一封邮件
;; j 跳到某一封邮件
;; N 下一封带星号的邮件
;; P 上一封带星号的邮件
;; S 按某个指定项目对邮件排序
;; / 按指定条件搜索邮件，并进入虚拟模式
;; tt 进入虚拟模式，根据线索查看，普通模式下是不可以的
;; C 如果设置了多个邮箱，用此切换
;; C-cC-m 编辑新邮件，放入草稿中
;; C-cC-c 发送邮件
;; C-cC-q 取消草稿
;; C-cC-a 插入附件
;; C-cTAB 插入签名
;; C-cC-l 转换当前邮件的编码格式
;; C-cC-y 复制部分邮件，带引用前缀
;; C-cC-t 复制部分邮件，不带引用前缀
;; C-cC-a 把当前的发信人加入地址薄
;; C-uC-cC-a 比C-cC-a多加入昵称和名字，推荐

;;Sort
(setq mew-sort-default-key-alist
      '(("+inbox" . "date")
        ("+xiyoulinux". "subject")
        ("+zh-kernel". "subject")
        ("+zeuux". "subject")
        ("+lkml" . "subject")))
;; 搜索过滤  用 /
