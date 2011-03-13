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
;;{{{ ��Viһ����%��ƥ������ż���ת

(defun goto-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) )
	((looking-back "\\s\)")  (backward-list 1))
   ((looking-at "\\s\{") (forward-list 1) )
	((looking-back "\\s\}") (forward-char 1))
	(t (self-insert-command (or arg 1)))))

;; (defun goto-match-paren (arg)
;;   "Go to the matching parenthesis if on parenthesis AND last command is a movement command, otherwise insert %.
;; vi style of % jumping to matching brace."
;;   (interactive "p")
;;   (message "%s" last-command)
;;   (if (not (memq last-command '(
;;                                 set-mark
;;                                 cua-set-mark
;;                                 goto-match-paren
;;                                 down-list
;;                                 up-list
;;                                 end-of-defun
;;                                 beginning-of-defun
;;                                 backward-sexp
;;                                 forward-sexp
;;                                 backward-up-list
;;                                 forward-paragraph
;;                                 backward-paragraph
;;                                 end-of-buffer
;;                                 beginning-of-buffer
;;                                 backward-word
;;                                 forward-word
;;                                 mwheel-scroll
;;                                 backward-word
;;                                 forward-word
;;                                 mouse-start-secondary
;;                                 mouse-yank-secondary
;;                                 mouse-secondary-save-then-kill
;;                                 move-end-of-line
;;                                 move-beginning-of-line
;;                                 backward-char
;;                                 forward-char
;;                                 scroll-up
;;                                 scroll-down
;;                                 scroll-left
;;                                 scroll-right
;;                                 mouse-set-point
;;                                 next-buffer
;;                                 previous-buffer
;;                                 )
;;              ))
;;   (self-insert-command (or arg 1))
;; (cond ((looking-at "\\s\(") (forward-list 1) )
;;       ((looking-back "\\s\)")  (backward-list 1))
;;       (t (self-insert-command (or arg 1))))))

;;}}}
;;{{{ �ϲ���ǰ������һ�У�ͬvim�� J���� ,��������ǿ�����Ժϲ����У�ʹ�÷��� C-u n C-c C-j ;n�Ǵ���:
;(global-set-key (kbd "C-x C-j") 'joseph-join-lines)
(defun joseph-join-lines(&optional arg)
  (interactive "*p")
    (save-excursion
    (let ((index 1)   )        ;index ��ʼ��Ϊ0
         (while (<= index  arg) ; when index <arg 
            (end-of-line)
            (delete-char  1)
            (delete-horizontal-space)
            (insert " ")
            (setq index (1+ index)) ; ����������һ index=index+1
        )
     )
  )
)

;;}}}
;;{{{ ;�˺������Խ��п��ٶ�λ ,vi ���и�f������fa ����a ��������Ӧλ��, ������������������ȫ����ȥ��C-f ��C-b��������
;; �����������֮���ƣ��罫�����C-f�󣬰���C-f�� ������һ����ĸ��s���һֱ����s ����λ����Ӧ��λ�ã���C-h�ɷ�������
;;ֱ�����²�ͬ����ĸ(Դ���������wy-go-tochar�Ͻ������޸ģ����Խ��з�������)
; ;֣�������Ƽ���д�� ,�����󶨵�C-f ,��������ͨC-f ��ǰ�Ƶ�һ���ַ��Ĺ���,ͬʱ���ܸ����ض��ַ����ٶ�λ
(defun joseph-go-to-char (n)
  "Move forward to Nth occurence of CHAR.
Typing `joseph-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR. Typing `\C-h' will move back ."
  (interactive "p")
  (forward-char n)
  (unless (equal last-command 'joseph-go-to-char)
    (let((char (read-event "Go to Char:" )))
      (if (characterp char) 
          (if (string-match "[[:cntrl:]]" (string char))
              (if (char-equal ?\C-f char)
                  (progn (forward-char n)
                         (let ((readed-char (read-event " ")))
                           (while (and  (characterp readed-char) (char-equal ?\C-f readed-char)) 
                             (forward-char)
                             (setq readed-char (read-event " "))))
                         (setq unread-command-events (list last-input-event)))
                )
            (progn 
              (when (search-forward (string char) nil nil n) (backward-char))                 
              (let ((readed-char (read-event
                                  (concat "(?\C-h for backward search ,\""
                                          (string char) "\" for forward search):"))))
                (while (and (characterp readed-char)
                            (or (char-equal readed-char char)  
                                (char-equal ?\C-h readed-char)))
                  (if    (char-equal ?\C-h readed-char)
                      (search-backward (string char) nil nil n)
                    (forward-char)
                    (when (search-forward (string char) nil nil n) (backward-char))
                    )
                  (setq readed-char (read-event
                                     (concat "(?\C-h for backward search ,\""
                                             (string char)"\" for forward search):"))))
                (setq unread-command-events (list last-input-event)))))
        (setq unread-command-events (list last-input-event))
        )
      )
    )
  )

;;}}}
;;{{{  open-line-or-new-line-dep-pos
(defun open-line-or-new-line-dep-pos()
  "if point is in head of line then open-line
if point is at end of line , new-line-and-indent"
  (interactive)
  (if (or (= (point) (line-beginning-position))
          (string-match "^[ \t]*$"
                        (buffer-substring-no-properties
                         (line-beginning-position)(point) ) ))
      (progn
        (beginning-of-line)
        (open-line 1)
        (indent-relative-maybe)
        )
    (newline-and-indent)
    ))
;;}}}
;;{{{  smart-beginning-of-line 
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
;;}}}
;;{{{  switch-to-scratch-buffer

(defun switch-to-scratch-buffer()
  "switch to *scratch* buffer."
  (interactive)
  (switch-to-buffer "*scratch*")
  (goto-char (point-max))
  )

;;}}}
;;{{{  move-backward-paren move-forward-paren ����ǰ(��)һ������

(defun move-backward-paren()
  (interactive)
   (re-search-backward "\\s[\\|\\s(\\|\\s{" nil t)
  )
(defun move-forward-paren()
  (interactive)
   (re-search-forward "\\s]\\|\\s)\\|\\s}" nil t)
  )

;;}}}
;;{{{ stardict �ʵ�
(defun query-stardict ()
  "Serch dict in stardict."
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    (message "searching  %s ... using stardicr" (buffer-substring begin end))
    (shell-command "notify-send \"`sdcv -n -u '�ʵ�Ӣ���ֵ�5.0' %s`\"" (buffer-substring begin end) )
    (message "finished searching  �ʵ�Ӣ���ֵ�5.0'")
    ))

(defun sdcv-to-buffer ()
  "Search dict in region or world."
(interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
      (current-word nil t)))
        (buf-name (buffer-name))
        )
    ;; (setq word (read-string (format "Search the dictionary for (default %s): " word)
    ;;                         nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (insert (shell-command-to-string  (format "sdcv -n %s " word) ))
    (if (equal buf-name "*sdcv*")
        (switch-to-buffer "*sdcv*")
      (switch-to-buffer-other-window "*sdcv*")
        )
    (goto-char (point-min))
    ))
;; (shell-command "notify-send \"`sdcv -n  %s`\"" (buffer-substring begin end))
;; (tooltip-show
;;      (shell-command-to-string
;;       (concat "sdcv -n "
;;               (buffer-substring begin end))))

;;}}}
;;{{{ ֻ��һ���ո�,����ɾ����괦���пո�(����������ô������Ч��)

(defun just-one-space-or-delete-horizontal-space()
   ""
   (interactive)
   (if (equal last-command 'just-one-space-or-delete-horizontal-space)
       (delete-horizontal-space)
     (just-one-space)
     )
   )

;;}}}

(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

(define-prefix-command 'ctl-w-map)
(global-set-key (kbd "C-w") 'ctl-w-map)

(define-prefix-command 'meta-g-map)
(global-set-key (kbd "M-G") 'Meta-G-Map)

;; Ĭ��Emacs ��TAB==`C-i'
;;            RET==`C-m'
;;            ESC==`C-['
;;�������Խ��а󶨵ļ���������һЩ,
;;����ķ�������ʵ�ֽ�`C-i' `C-m'����`TAB' `RET'��ͬ��func
;;����ֻ��Gui������
(when window-system
  (keyboard-translate ?\C-i ?\H-i)
  (keyboard-translate ?\C-m ?\H-m)
  (global-set-key [?\H-m] 'backward-char);C-m
  (global-set-key [?\H-i] 'delete-backward-char) ;C-i
  )
(global-set-key "\C-m" 'newline-and-indent) ;retu;;{{{ �ڴ�С���ż�ǰ������
(global-set-key (kbd "M-[") 'move-backward-paren)
(global-set-key (kbd "M-]") 'move-forward-paren)
(define-key global-map (kbd "C-f") 'joseph-go-to-char)
(global-set-key "%" 'goto-match-paren)

;;when meet long line ,whether to wrap it 
(setq-default truncate-lines t)
(global-set-key "\C-z$" 'toggle-truncate-lines)

(global-set-key (kbd "C-x C-z") 'suspend-frame)
(global-set-key (kbd "C-z C-z") 'execute-extended-command)
;;һ�������˵���
(global-set-key "\C-zm" (lambda () (interactive) (menu-bar-mode) (tool-bar-mode)))


(global-set-key "\C-j" 'open-line-or-new-line-dep-pos)
(global-set-key (kbd "C-q") 'smart-beginning-of-line)
(global-set-key (kbd "C-e") 'smart-end-of-line)
(global-set-key (kbd "C-a" ) (quote  quoted-insert))
(global-set-key (kbd "C-c C-j") 'joseph-join-lines)

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

(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,һ��ǰ������5�� 
(global-set-key "\M-n"  (lambda () (interactive) (forward-line 4) (scroll-up   4)))
(global-set-key "\M-p"  (lambda () (interactive) (forward-line -4)(scroll-down 4)))

(global-set-key "\M-\C-n" 'scroll-other-window)
(global-set-key "\M-\C-p" 'scroll-other-window-down)
(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
(define-key emacs-lisp-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;ֻ����괦һ���ո����ɾ�����пո�
(global-set-key "\M-\\" 'just-one-space-or-delete-horizontal-space)
;;�ʵ�,��Ҫsdcd��֧��
(global-set-key "\C-c\C-d" 'query-stardict)
(global-set-key "\C-cd" 'sdcv-to-buffer)

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp

