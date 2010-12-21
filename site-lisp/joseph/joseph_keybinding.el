;;һЩ��ݼ�������

(global-set-key [(meta g)] 'goto-line) ;alt+g ����ָ����
(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; �˳� emacs ʱ���Զ��رյ�ǰ buffer 
(add-hook 'lisp-interaction-mode-hook '(lambda ()
  (global-set-key (kbd "C-;") (quote eval-print-last-sexp))
  (global-unset-key "\C-j" )
  (global-set-key "\C-j" 'open-and-move-to-next-line )
 ))


    
;;����C-v C-b �Ĺ��� 
(global-set-key (kbd "C-v")  (quote backward-char))
(global-set-key (kbd "C-b") (quote scroll-up))
;;����M-b M-v 
(global-set-key (kbd "M-v") (quote backward-word) )
(global-set-key (kbd "M-b") (quote scroll-down) )
(global-set-key (kbd "C-t") (quote scroll-down) )
;;;����C-a C-q
(global-set-key (kbd "C-q" ) (quote  move-beginning-of-line))
;;(global-set-key (kbd "C-a" ) (quote  quoted-insert))
(defun quit_twice () "just quit serval times " (interactive ) (keyboard-quit) (keyboard-quit) (keyboard-quit) )
(global-set-key (kbd "C-g") 'quit_twice ) 
(global-unset-key "\C-z" )

;;{{{ ����Ctrl-z ��ǰ׺����˿��԰󶨸����C-z ��ͷ������
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
;;Ȼ������������ַ�ʽ
(global-set-key (kbd "C-z C-c C-w b") 'find-file)
(define-key ctl-z-map (kbd "��") 'find-file)
;;}}}
;;{{{ Ctrl+, Ctrl+. ���趨������������ת
(global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  ��ס��ǰ���λ�ã�����"C+," ��ת��ȥ
(global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;���ska-point-to-registerʹ�� "C+," ������ת
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
   Use ska-jump-to-register to jump back to the stored position."
  (interactive) (let (( zmacs-region-stays t)) (point-to-register 8)) )
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
   that was stored with ska-point-to-register."
  (interactive) (let ((tmp (point-marker))( zmacs-region-stays t) ) (jump-to-register 8) (set-register 8 tmp)))
;;}}}
;;{{{ ibuffer ��CRM �����л�buffer������, ��buffer ��ص�һЩ����
;;�����л�buffer��ѡ���Ĭ�ϵĺ�
;;CRM bufer list
;(require 'ibuffer)
;;ibuffer �Ĺ��� 
;;n p ���£�m���б�� D���Ϊɾ�����ر�buffer�� x��رձ�ǵ�buffer
;; = ����diff�������ѱ������buffer�еģ� 
;;O ���˱�ǵ�buffer ��������������������ʾ������� 
(global-set-key ( kbd "C-x C-c")' ibuffer)
;(global-set-key "\C-x\C-c" 'electric-buffer-list)
(global-set-key "\C-x\c" 'switch-to-buffer)
(global-set-key "\C-x\C-b" 'save-buffers-kill-terminal);; ԭ�� ��C-x C-c 
;;}}}
;;{{{ ��������
;Emacs��c-s��Ӧ�����������������Ǹ����ʱ����Ҫ����ĳ��ģʽ�������õ����Ļ��ǽ���ʽ��������ʽ������������ʽ�����и����˵����⣺��������ʱ��겻һ��ͣ����ƥ���ִ��Ŀ��ˡ��Һ�����������׽����
;ͷ�������°󶨱�׼������c-s��c-r����isearch����regex-isearch���������м��붨�ƺ������ؼ��������(goto-char isearch-other-end)����֤���ͣ����ƥ���ִ��Ŀ�ͷ��������ȱʡ��ĩβ��
(global-unset-key [(control r)] )
(global-set-key [(control s)] 'isearch-forward-regexp)
;(global-set-key [(control r)] 'isearch-forward-regexp)
;; Always end searches at the beginning of the matching expression.
 (add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
  (defun custom-goto-match-beginning () "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))
;;}}}

;; (global-set-key "\C-r" 'backward-delete-cdsfhar-untabify) ;;��ǰɾ��һ���ַ�
;; (global-set-key "\M-r" 'backward-kill-word) ;;��ǰɾ��һ������

(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") (quote set-mark-command))




 (provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
