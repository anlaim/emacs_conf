(tool-bar-mode -1) ;;���ز˵���
;(menu-bar-mode -1)

(setq inhibit-startup-message t);����������ʾ����
;(setq initial-scratch-message "")
(setq initial-scratch-message nil);�ر�scratch��Ϣ��ʾ
(setq use-dialog-box nil  )  ;;��ʹ�öԻ�����У��ǣ��� ȡ���� ��ѡ�񣬶�����minibuffer

;;״̬����ʾʱ��ĸ�ʽ
(setq display-time-24hr-format t)
(setq display-time-interval 30)
;(setq display-time-day-and-date t)
(display-time); mode-line ����ʾʱ��

 (setq-default save-place t) ;��ס���λ��,�ٴδ�ͬһ���ļ�����괦����ͬλ��
 (require 'saveplace)

;;���ϴε��ļ���¼
;;Emacs������������ļ���״̬���ϴι���λ�ã���������ϼ�����һ�εı༭����
(load "desktop") 
(desktop-load-default)
(desktop-read)
;;��emacs�˳�ʱ�����ļ���״̬
(add-hook 'kill-emacs-hook '(lambda()(desktop-save "~/.emacs.d/.desktop_session/"))) 

;���ñ����ļ���λ��
(setq
     backup-by-copying t    ;�Զ�����
     backup-directory-alist  '(("." . "~/.backup"))
     delete-old-versions t ; �Զ�ɾ���ɵı����ļ�
     kept-new-versions 10   ; ���������6�������ļ�
     kept-old-versions 2   ; ���������2�������ļ�
     version-control t)    ; ��α���
;;ǰ������ɫ
(add-to-list 'default-frame-alist '(background-color . "#2e2d28") )
(add-to-list 'default-frame-alist  '(foreground-color . "#f7f8c6"))
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



(setq resize-mini-windows t) ;;����minibuffer���ɱ仯���С��ָ��ȣ�
(setq column-number-mode t) ;״̬�����к�
(scroll-bar-mode nil);;ȡ��������
(mouse-wheel-mode t);;֧��������
(mouse-avoidance-mode 'animate) ;;����Զ��ܿ�ָ�룬�統�������ʱ��ָ�뵽������λ�ã�����е㵲ס������ X�� 
(fset 'yes-or-no-p 'y-or-n-p) ;; ��Yes��y����
;(setq next-line-add-newlines t);�������һ�к����C-n����ӿ���
(global-set-key [(meta g)] 'goto-line) ;alt+g ����ָ����


(setq-default indent-tabs-mode nil tab-width 4) ;�ÿո����tab
(setq track-eol t) ;; ���������β�����ƶ���ʱ��ʼ�ձ�������β��
;(setq default-major-mode 'text-mode)
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

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


(show-paren-mode t) ;;������ʾƥ�������
(setq show-paren-style 'parenthesis);;;;����ƥ��ʱ���Ը�����ʾ����һ�ߵ����ţ�����겻�ᷳ�˵�������һ�����Ŵ���
;;��֮��صĲ��� C-M+f C-M+b  C-M+k


;;�����л�buffer��ѡ���Ĭ�ϵĺ�
(require 'ibuffer)
(global-set-key ( kbd "C-x C-b ")' ibuffer)
;;CRM bufer list
;(global-set-key "\C-x\C-b" 'electric-buffer-list)

;; (load "gnuserv-compat")
;; (load-library "gnuserv")
;; (gnuserv-start)
;; ;; When loading files reuse existing frames.
;; (setq gnuserv-frame (car (frame-list)))


 (provide 'jixiuf_common)




 
