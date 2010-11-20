(tool-bar-mode -1) ;;���ز˵���
;(menu-bar-mode -1)

(setq inhibit-startup-message t);����������ʾ����
;(setq initial-scratch-message "")
(setq initial-scratch-message nil);�ر�scratch��Ϣ��ʾ
(setq use-dialog-box nil  )  ;;��ʹ�öԻ�����У��ǣ��� ȡ���� ��ѡ�񣬶�����minibuffer
(setq frame-title-format "<<%b>>   GNU/ Emacs") ;;������ʾ�ļ�����������Ĭ�ϵ�username@localhost
;(setq frame-title-format '("GNU/Emacs - [ " (buffer-file-name "%f \]" (dired-directory dired-directory "%b \]"))))
;;;;״̬����ʾʱ��ĸ�ʽ
;; (setq display-time-24hr-format t)
;; (setq display-time-interval 30)
;; (setq display-time-day-and-date t)
;; (display-time); mode-line ����ʾʱ��

(setq-default save-place t) ;��ס���λ��,�ٴδ�ͬһ���ļ�����괦����ͬλ��
(require 'saveplace)

(setq-default indent-tabs-mode nil tab-width 4) ;�ÿո����tab
(setq x-stretch-cursor nil);;�������Ϊt�������TAB�ַ��ϻ���ʾΪһ���󷽿�:)
(setq track-eol t) ;; ���������β�����ƶ���ʱ��ʼ�ձ�������β��
(blink-cursor-mode -1);��겻Ҫ��˸
;(setq-default cursor-type 'bar);;�����ʾΪһ����
;;(setq default-major-mode 'text-mode)
;;;��ֹ���L�ӕr���� scroll-margin 3 �����ڿ�����Ļ����3��ʱ�Ϳ�ʼ���������ԺܺõĿ���������
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)
(setq resize-mini-windows t) ;;����minibuffer���ɱ仯���С��ָ��ȣ�
(setq column-number-mode t) ;״̬�����к�
(scroll-bar-mode nil);;ȡ��������
(mouse-wheel-mode t);;֧��������
(mouse-avoidance-mode 'animate) ;;����Զ��ܿ�ָ�룬�統�������ʱ��ָ�뵽������λ�ã�����е㵲ס������ X�� 
(fset 'yes-or-no-p 'y-or-n-p) ;; ��Yes��y����
;(setq next-line-add-newlines t);�������һ�к����C-n����ӿ���
(global-set-key [(meta g)] 'goto-line) ;alt+g ����ָ����

(setq show-paren-mode t) ;;������ʾƥ�������
(setq show-paren-style 'parenthesis);;;;����ƥ��ʱ���Ը�����ʾ����һ�ߵ����ţ�����겻�ᷳ�˵�������һ�����Ŵ���
;;��֮��صĲ��� C-M+f C-M+b  C-M+k

(setq auto-save-mode t) ;; �Զ�����
;���ñ����ļ���λ��
(setq
     backup-by-copying t    ;�Զ�����
     backup-directory-alist  '(("." . "~/.backup"))
     delete-old-versions t ; �Զ�ɾ���ɵı����ļ�
     kept-new-versions 10   ; ���������6�������ļ�
     kept-old-versions 2   ; ���������2�������ļ�
     version-control t)    ; ��α���
;;ǰ������ɫ
;; (add-to-list 'default-frame-alist '(background-color . "#2e2d28") )
;; (add-to-list 'default-frame-alist  '(foreground-color . "#f7f8c6"))
(add-to-list 'default-frame-alist  '(cursor-color . "white") )
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
;;;;��������
;;(set-fontset-font "fontset-default" 'gb18030 '("WenQuanYi Bitmap Song" . "unicode-bmp")) ;; ������������  
;; (set-default-font "Courier New-13")  
;; (set-fontset-font "fontset-default" 'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))
;; (create-fontset-from-fontset-spec
;;  "-misc-dejavu sans mono-bold-r-normal--0-0-0-0-m-0-fontset-mymono,
;;  chinese-gb2312:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1,
;;  chinese-gbk:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1,
;;  chinese-gb18030:-*-wenquanyi bitmap song-medium-*-normal--14-*-*-*-*-*-iso10646-1"
;; )

;; (setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))
;; (set-default-font "fontset-mymono")
;(set-fontset-font "fontset-default" 'ascii '("WenQuanYi Bitmap Song" . "unicode-bmp")) ;; ������������  
;; (set-fontset-font "fontset-default" 'cjk-misc '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'han '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'bopomofo '("STHeiti" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'symbol '("YaHei Consolas Hybrid" . "unicode-bmp"))






;Emacs��c-s��Ӧ�����������������Ǹ����ʱ����Ҫ����ĳ��ģʽ�������õ����Ļ��ǽ���ʽ��������ʽ������������ʽ�����и����˵����⣺��������ʱ��겻һ��ͣ����ƥ���ִ��Ŀ��ˡ��Һ�����������׽����
;ͷ�������°󶨱�׼������c-s��c-r����isearch����regex-isearch���������м��붨�ƺ������ؼ��������(goto-char isearch-other-end)����֤���ͣ����ƥ���ִ��Ŀ�ͷ��������ȱʡ��ĩβ��
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control r)] 'isearch-backward-regexp)
;; Always end searches at the beginning of the matching expression.
(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))


(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; �˳� emacs ʱ���Զ��رյ�ǰ buffer 



;;�����л�buffer��ѡ���Ĭ�ϵĺ�
(require 'ibuffer)
(global-set-key ( kbd "C-x C-b ")' ibuffer)
;;CRM bufer list
;(global-set-key "\C-x\C-b" 'electric-buffer-list)


(global-set-key "" (quote execute-extended-command)) ;;Ctrl+Z ִ������
(global-unset-key  "" )
(global-set-key "" (quote execute-extended-command))
(global-unset-key  "" );; ͣC-x C-c �ر�����
;(global-set-key "\C-h" 'backward-delete-char-untabify) ;;��ǰɾ��һ���ַ�

(global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  ��ס��ǰ���λ�ã�����"C+," ��ת��ȥ
(global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;���ska-point-to-registerʹ�� "C+," ������ת
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))


 (provide 'jixiuf_common)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp