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
;;{{{ ����һЩ������ǰ׺����˿��԰󶨸����C-z ��ͷ������
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-x C-z") 'suspend-frame )
(global-set-key (kbd "C-z C-z") 'execute-extended-command )
;;һ�������˵���
(global-set-key "\C-zm" (lambda () (interactive) (menu-bar-mode) (tool-bar-mode)  ) )

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)
;;when meet long line ,whether to wrap it 
(setq-default truncate-lines t)
(global-set-key "\C-z$" 'toggle-truncate-lines)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-g") 'meta-g-map)
;;}}}
;;{{{ scroll up down C-v C-r
        
(defcustom scroll-highlight-tag-after-jump t
  "*If non-nil, temporarily highlight the tag
  after you jump to it.
  (borrowed from etags-select.el)"
  :group 'scroll-
  :type 'boolean)
(defcustom scroll-highlight-delay 0.3
  "*How long to highlight the tag.
  (borrowed from etags-select.el)"
  :group 'scroll-
  :type 'number)

(defface scroll-highlight-line-face
  '((t (:foreground "white" :background "cadetblue4" :bold t)))
  "Font Lock mode face used to highlight tags.
  (borrowed from etags-select.el)"
  :group 'scroll-)
        
(defun scroll-highlight (beg end)
  "Highlight a region temporarily.
   (borrowed from etags-select.el)"
  (if (featurep 'xemacs)
      (let ((extent (make-extent beg end)))
        (set-extent-property extent 'face 'scroll-highlight-line-face)
        (sit-for scroll-highlight-delay)
        (delete-extent extent))
    (let ((ov (make-overlay beg end)))
      (overlay-put ov 'face 'scroll-highlight-line-face)
      (sit-for scroll-highlight-delay)
      (delete-overlay ov))))

(defun scroll-half-screen-down()
  (interactive)
  (let ((b (point-at-bol) )(e (1+ (point-at-eol)) ))
  (forward-line  (round (/ (frame-height) 1.5) ))
  (recenter 5)
;;  (scroll-highlight b e)
  (scroll-highlight (point-at-bol)(1+ (point-at-eol)))
  ))
(defun scroll-half-screen-up()
  (interactive)
  (let ((b (point-at-bol) )(e (1+ (point-at-eol)) ))
  (forward-line (- 0 (round (/(frame-height) 1.5))))
  (recenter 5)
;;  (scroll-highlight b e)
  (scroll-highlight (point-at-bol)(1+ (point-at-eol)))
  ))
(global-set-key "\C-r" 'scroll-half-screen-up)
(global-set-key "\C-v" 'scroll-half-screen-down)

;; (defun chb-page-down ()
;;   (interactive)
;;   (when (featurep 'xemacs) (setq zmacs-region-stays t))
;;   (forward-line
;;    (- (if (fboundp 'window-displayed-height)      ;XEmacs
;;           (window-displayed-height)
;;         (window-text-height))                     ;GNUEmacs
;;       next-screen-context-lines))
;;   (recenter next-screen-context-lines)
;;   )

;; (defun chb-page-up ()
;;   (interactive)
;;   (when (featurep 'xemacs) (setq zmacs-region-stays t))
;;   (forward-line
;;    (- (- (if (fboundp 'window-displayed-height)   ;XEmacs
;;              (window-displayed-height)
;;            (window-text-height))                  ;GNUEmacs
;;          next-screen-context-lines)))
;;     (recenter next-screen-context-lines)
;;   )
;; (global-set-key "\C-r" 'chb-page-up)
;; (global-set-key "\C-v" 'chb-page-down)

;;}}}

;;{{{ smart-beginning-of-line 

(defun smart-beginning-of-line ()
    "Move point to first non-whitespace character or beginning-of-line.
Move point to beginning-of-line ,if point was already at that position,
  move point to first non-whitespace character. "
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (and (= oldpos (point))
         (back-to-indentation) )))

(defun smart-end-of-line()
  "Move point to first non-whitespace character or end-of-line.
Move point to end-of-line ,if point was already at that position,
  move point to first non-whitespace character."
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (when (re-search-forward "[ \t]*$" (point-at-eol) t) 
      (goto-char (match-beginning 0))) 
    (when (= oldpos (point)) 
      (end-of-line))))
(global-set-key (kbd "C-q") 'smart-beginning-of-line)
(global-set-key (kbd "C-e") 'smart-end-of-line)
(global-set-key (kbd "C-a" ) (quote  quoted-insert))
;;}}}
;;{{{ joseph-goto-line
;; (defun joseph-goto-line()
;;   "when read a num then (goto-line num ) when read a string+num then goto line by percent "
;;   (interactive)
;;   (let ((readed-string (read-from-minibuffer "Goto line(char+num by percent): "))(percent) )
;;     (if (string-match "^[%a-zA-Z ]+\\([0-9]+\\)$" readed-string )
;;         (let* ((total (count-lines (point-min) (point-max))) (num ))
;;           (setq percent  (string-to-number (match-string-no-properties 1 readed-string)))
;;           (setq num (round (* (/ total 100.0) percent)))
;;           (line-number-at-pos)
;;           (goto-char (point-min))
;;           (forward-line (1- num))
;;            )
;;       (when (string-match "^[0-9]+$" readed-string )
;;           (goto-char (point-min))
;;           (forward-line  (1- (string-to-number readed-string) ))
;;             )
;;     ))
;;   )
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
(global-set-key "\M-gf"      'joseph-goto-line-by-percent)
(global-set-key [(meta g) (meta f)] 'joseph-goto-line-by-percent)
;(global-set-key [(meta g) (meta f)] 'joseph-goto-line)
(global-set-key [(meta g) (meta g)] 'goto-line)
;;}}}
;;{{{ Ctrl+, Ctrl+. ���趨������������ת(��joseph-quick-jumpȡ��)
;; (global-set-key [(control ?\.)] 'ska-point-to-register);;;"Ctrl+."  ��ס��ǰ���λ�ã�����"C+," ��ת��ȥ
;; (global-set-key [(control ?\,)] 'ska-jump-to-register)  ;;���ska-point-to-registerʹ�� "C+," ������ת
;; (defun ska-point-to-register()
;;   "Store cursorposition _fast_ in a register.
;;    Use ska-jump-to-register to jump back to the stored position."
;;   (interactive) (let (( zmacs-region-stays t)) (point-to-register 8)) )
;; (defun ska-jump-to-register()
;;   "Switches between current cursorposition and position
;;    that was stored with ska-point-to-register."
;;   (interactive) (let ((tmp (point-marker))( zmacs-region-stays t) ) (jump-to-register 8) (set-register 8 tmp)))
;;}}}

;;{{{ ��������
;Emacs��c-s��Ӧ�����������������Ǹ����ʱ����Ҫ����ĳ��ģʽ�������õ����Ļ��ǽ���ʽ��������ʽ������������ʽ�����и����˵����⣺��������ʱ��겻һ��ͣ����ƥ���ִ��Ŀ��ˡ��Һ�����������׽����
;ͷ�������°󶨱�׼������c-s��c-r����isearch����regex-isearch���������м��붨�ƺ������ؼ��������(goto-char isearch-other-end)����֤���ͣ����ƥ���ִ��Ŀ�ͷ��������ȱʡ��ĩβ��
;;(global-unset-key [(control r)] )
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


(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,һ��ǰ������5��
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   4)(forward-line 4) (recenter 10)))
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 4)(forward-line -4)(recenter 10)))

(global-set-key "\M-\C-n" 'scroll-other-window)
(global-set-key "\M-\C-p" 'scroll-other-window-down)

(defun switch-to-scratch-buffer()
  "switch to *scratch* buffer."
  (interactive)
  (switch-to-buffer "*scratch*")
  (goto-char (point-max))
  )
(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
;;{{{ hooks 
;;(add-hook 'server-done-hook '(lambda () (delete-frame server-window) (setq server-window nil))) ; �˳� emacs ʱ���Զ��رյ�ǰ buffer



(define-key emacs-lisp-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;}}}

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
