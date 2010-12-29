;;һЩ��ݼ�������
;;{{{ byte-compile
  (eval-when-compile
    (add-to-list 'load-path  (expand-file-name "."))
    (require 'joseph_byte_compile_include)
  )
  
;;}}}

;;{{{  ���ڼ��󶨵�һЩ֪ʶ
;;���ڼ��󶨵�һЩ����
;; change a binding in the global keymap, the change is effective in all
;; buffers (though it has no direct effect in buffers that shadow the
;; global binding with a local one).  If you change the current buffer's
;; local map, that usually affects all buffers using the same major mode.
;; The `global-set-key' and `local-set-key' functions are convenient
;; interfaces for these operations .
;;Ҳ����˵global-set-key �����е�buffer ��Ч,
;;��local-set-key ֻӰ��ĳһ��major-mode,
;;��ͬʱ������local-set-key global-set-key ,��ɼ���ͻʱ,ǰ�ߵ����ȼ���.���߻ᱻ���ܵ�.

;;(global-set-key key binding) �ȼ��� (define-key (current-global-map) key binding)
;;ȡ������ (global-unset-key key) �ȼ��� (define-key (current-global-map) key nil)
;;(local-set-key key binding) == (define-key (current-local-map) key binding)
;;(local-unset-key key) == (define-key (current-local-map) key nil)
;;     (global-set-key (kbd "C-x C-\\") 'next-line)
;;     (global-set-key [?\C-x ?\C-\\] 'next-line)
;;     (global-set-key [(control ?x) (control ?\\)] 'next-line)
;;
;;����ǰ׺��һ�����
;;����Ĭ�������C-z ���󶨵���С������,���ʱ��������û������"C-z C-f"
;;��������C-z Ϊǰ׺�Ŀ�ݼ���,�����Ҫ��ô��,���붨��һ�� ǰ׺,
;;Ȼ���C-z �󶨵����ǰ׺��.
;;����
;;(define-prefix-command 'ctl-z-map)
;;(global-set-key (kbd "C-z") 'ctl-z-map)
;;ctrl-z-map ��������������ȡ,����
;;(define-prefix-command 'aaaaaaaaaa)
;;(global-set-key (kbd "C-z") 'aaaaaaaaaa)
;;Ч��Ҳ����ͬ��
;;���������C-z ��ǰ׺��Ϳ��Խ����󶨵�C-z ��ͷ�ĵĿ�ݼ�����.
;;�󶨵ķ�ʽ������
;;1, (global-set-key (kbd "C-z C-f") 'find-file)
;;2,������ȷָ��ʹ��ctl-z-map ǰ׺
;; (define-key ctl-z-map (kbd "C-f") 'find-file)

;;}}}

;;{{{ ����һЩ����ǰ׺ ��ǰ׺����˿��԰󶨸����C-z ��ͷ������
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-z C-z") 'suspend-frame )

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-g") 'meta-g-map)

;;}}}

;;when meet long line ,whether to wrap it 
(setq truncate-lines t);;������
(global-set-key (kbd "C-c $") 'toggle-truncate-lines)
;;����C-v C-b �Ĺ��� 
(global-set-key (kbd "C-v")  (quote backward-char))
(global-set-key (kbd "C-b") (quote scroll-up))
;;����M-b M-v 
(global-set-key (kbd "M-v") (quote backward-word) )
(global-set-key (kbd "M-b") (quote scroll-down) )
(global-set-key (kbd "C-t") (quote scroll-down) )
(defun smart-beginning-of-line ()
    "Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character. "
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (and (= oldpos (point))
    (back-to-indentation) ) ))
(global-set-key (kbd "C-q") 'smart-beginning-of-line)
;;;����C-a C-q
;(global-set-key (kbd "C-q" ) (quote  move-beginning-of-line))
(global-set-key (kbd "C-a" ) (quote  quoted-insert))
;(defun quit_three () "just quit serval times " (interactive ) (keyboard-quit) (keyboard-quit) (keyboard-quit) )
;(global-set-key (kbd "C-g") 'quit_three ) 
;;{{{ joseph-goto-line
(defun joseph-goto-line()
  "when read a num then (goto-line num ) when read a string+num then goto line by percent "
  (interactive)
  (let ((readed-string (read-from-minibuffer "Goto line(char+num by percent): "))(percent) )
    (if (string-match "^[%a-zA-Z ]+\\([0-9]+\\)$" readed-string )
        (let* ((total (count-lines (point-min) (point-max))) (num ))
          (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
          (setq num (round (* (/ total 100.0) percent)))
          (line-number-at-pos)
          (goto-char (point-min))
          (forward-line (1- num))
           )
      (when (string-match "^[0-9]+$" readed-string )
          (goto-char (point-min))
          (forward-line  (1- (string-to-number readed-string) ))
            )
    ))
  )
(defun joseph-goto-line-by-percent ()
  (interactive)
(let ((readed-string (read-from-minibuffer "Goto line( by percent): "))(percent) )
     (if (string-match "^[ \t]*\\([0-9]+\\)[ \t]*$" readed-string )
        (let* ((total (count-lines (point-min) (point-max))) (num ))
          (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
          (setq num (round (* (/ total 100.0) percent)))
          (goto-char (point-min) )
          (forward-line (1- num)) )
    ))
  )
(global-set-key [(meta g)(g)]       'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta g)] 'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta f)] 'joseph-goto-line)

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
(global-unset-key (kbd "C-x C-c"))
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
(global-set-key "\C-m" 'newline-and-indent) ;return 

;;{{{ smart-compile
(eval-and-compile
(add-to-list 'load-path
               (expand-file-name  joseph_site-lisp_install_path )))
;; �����������ر���ã����Ը����ļ��ĺ�׺���� mode �жϵ��õ� compile
;; �����Ŀ¼���� makefile �Զ�ʹ�� make ���
(global-set-key (kbd "C-c r") 'smart-run)
(global-set-key (kbd "C-c s") 'smart-compile)
;; smart compile ��һ���ǳ����õ� elisp����������Ҳ�൱�򵥡�ֻҪ����Ӧ�ĺ�׺
;; ���� compile �� run ����������ˡ���ʽҲ�������档
;; smart-executable-alist �������ڵ��� smart-run ʱ�Ƿ���Ҫ compile������
;; �ű�һ�㶼Ҫ���뵽����б��С�������ֻ�� smart-compile ���С�
(require 'smart-compile+)
;(require 'smart-compile nil t)
;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )
(when (featurep 'smart-compile)
(setq smart-compile-alist
      '(("\\.c$"          . "g++ -o %n %f")
        ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
        ("\\.java$"       . "javac %f")
        ("\\.f90$"        . "f90 %f -o %n")
        ("\\.[Ff]$"       . "f77 %f -o %n")
        ("\\.mp$"         . "runmpost.pl %f -o ps")
        ("\\.php$"        . "php %f")
        ("\\.tex$"        . "latex %f")
        ("\\.l$"          . "lex -o %n.yy.c %f")
        ("\\.y$"          . "yacc -o %n.tab.c %f")
        ("\\.py$"         . "python %f")
        ("\\.sql$"        . "mysql < %f")
        ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
        ("\\.sh$"         . "./%f")
        (emacs-lisp-mode  . (emacs-lisp-byte-compile))))
(setq smart-run-alist
      '(("\\.c$"          . "./%n")
        ("\\.[Cc]+[Pp]*$" . "./%n")
        ("\\.java$"       . "java %n")
        ("\\.php$"        . "php %f")
        ("\\.m$"          . "%f")
        ("\\.scm"         . "%f")
        ("\\.tex$"        . "dvisvga %n.dvi")
        ("\\.py$"         . "python %f")
        ("\\.pl$"         . "perl \"%f\"")
        ("\\.pm$"         . "perl \"%f\"")
        ("\\.bat$"        . "%f")
        ("\\.mp$"         . "mpost %f")
        ("\\.ahk$"        . "start d:\\Programs\\AutoHotkey\\AutoHotkey %f")
        ("\\.sh$"         . "./%f")))
(setq smart-executable-alist
      '("%n.class"
        "%n.exe"
        "%n"
        "%n.mp"
        "%n.m"
        "%n.php"
        "%n.scm"
        "%n.dvi"
        "%n.py"
        "%n.pl"
        "%n.ahk"
        "%n.pm"
        "%n.bat"
        "%n.sh")))

;;}}}

(global-set-key (kbd "C-c w") 'browse-url-at-point)


;;{{{ hooks 
(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; �˳� emacs ʱ���Զ��رյ�ǰ buffer 
(add-hook 'lisp-interaction-mode-hook '(lambda ()
  (global-set-key (kbd "C-;") (quote eval-print-last-sexp))
;  (global-unset-key "\C-j" )
 ; (global-set-key "\C-j" 'open-and-move-to-next-line )
 ))
;;}}}

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
