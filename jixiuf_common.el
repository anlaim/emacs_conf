(tool-bar-mode -1) ;;���ز˵���
;(menu-bar-mode -1)

(setq inhibit-startup-message t);����������ʾ����
(setq initial-scratch-message "")
(setq use-dialog-box nil  )  ;;��ʹ�öԻ�����У��ǣ��� ȡ���� ��ѡ�񣬶�����minibuffer

;;״̬����ʾʱ��ĸ�ʽ
(setq display-time-24hr-format t)
(setq display-time-interval 30)
;(setq display-time-day-and-date t)
(display-time); mode-line ����ʾʱ��

(setq-default save-place t) ;��ס���λ��,�ٴδ�ͬһ���ļ�����괦����ͬλ��
(require 'saveplace)

;���ñ����ļ���λ��
(setq
     backup-by-copying t    ;�Զ�����
     backup-directory-alist  '(("." . "~/.backup"))
     delete-old-versions t ; �Զ�ɾ���ɵı����ļ�
     kept-new-versions 6   ; ���������6�������ļ�
     kept-old-versions 2   ; ���������2�������ļ�
     version-control t)    ; ��α���
;;���ڼ��а�
(setq x-select-enable-clipborad t) ;ѡ�����ݣ���copy ,����������������ճ����
;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(define-key ctl-x-map "y" 'clipboard-yank)
;(global-set-key  "\C-x y" 'clipboard-yank)
;(set-clipboard-coding-system 'chinese-iso-8bit) ;; ���а壬���ں���������֮�临������
;(set-clipboard-coding-system 'ctext)
;; For my language code setting (UTF-8)���ñ���
 (setq current-language-environment "UTF-8")
 (setq locale-coding-system 'utf-8)
 (set-terminal-coding-system 'utf-8)
 (set-keyboard-coding-system 'utf-8)
 (set-selection-coding-system 'utf-8)
 (prefer-coding-system 'utf-8)
;;;;copy ���������������а壬������������
(global-set-key [C-f5] 'my-copy-buffer)
(defun my-copy-buffer ()
  "copy whole buffer to clipboard."
  (interactive)
  (beginning-of-buffer)
  (setq start (point))
  (end-of-buffer)
  (setq end (point))
  (clipboard-kill-ring-save start end)
  )

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

;;java c c++���Զ���ȫ() {} []
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
;;                   (?` ?` _ "''")
                   (?\( ?  _ " )")
                   (?\[ ?  _ " ]")
                   (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
(add-hook 'java-mode-hook 'my-c-mode-auto-pair)

(setq-default indent-tabs-mode nil tab-width 4) ;�ÿո����tab
(setq track-eol t) ;; ���������β�����ƶ���ʱ��ʼ�ձ�������β��
(setq default-major-mode 'text-mode)
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)

;alt+/ ���벹ȫ
(global-set-key [(meta /)] 'hippie-expand)
(require 'hippie-exp)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        yas/hippie-try-expand
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-expand-whole-kill))
;Ĭ�������M-w����һ�����򣬵������û������ѡ�У����Ƶ�ǰ��
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;Ĭ�������C-w����һ�����򣬵������û������ѡ�У�����е�ǰ��
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))


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

;;shell emacs ֮������л�
  (autoload 'shell-toggle "shell-toggle" "Toggles between the *shell* buffer and whatever buffer you are editing." t)
  (autoload 'shell-toggle-cd "shell-toggle" "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
  (global-set-key [M-f1] 'shell-toggle)
  (global-set-key [C-f1] 'shell-toggle-cd)


;;�����л�buffer��ѡ���Ĭ�ϵĺ�
;; (require 'ibuffer)
;; (global-set-key ( kbd "C-x C-b ")' ibuffer)
;;CRM bufer list
(global-set-key "\C-x\C-b" 'electric-buffer-list)

;; (load "gnuserv-compat")
;; (load-library "gnuserv")
;; (gnuserv-start)
;; ;; When loading files reuse existing frames.
;; (setq gnuserv-frame (car (frame-list)))


 (provide 'jixiuf_common)




 
