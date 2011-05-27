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
;;(when (or window-system (daemonp))
  ;; (keyboard-translate ?\C-i ?\H-i)
  ;; (keyboard-translate ?\C-m ?\H-m)
  ;; (global-set-key [?\H-m] 'backward-char);C-m
;;  (global-set-key [?\H-i] 'delete-backward-char) ;C-i
;;  )
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "M-[") 'move-backward-paren)
(global-set-key (kbd "M-]") 'move-forward-paren)
;;(global-set-key (kbd "C-f") 'joseph-go-to-char)
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
(global-set-key (kbd "S-SPC") 'set-mark-command)
(global-set-key (quote [C-tab]) 'set-mark-command)

(global-set-key (kbd "C-c w") 'browse-url-at-point)

;; Faster point movement,һ��ǰ������5��
(add-hook 'Info-mode-hook '(lambda () "define M-n for Info" (define-key Info-mode-map "\M-n" 'joseph-forward-4-line)))
(global-set-key "\M-n"  'joseph-forward-4-line)
(global-set-key "\M-p"  'joseph-backward-4-line)

(global-set-key "\M-\C-n" 'scroll-other-window-up-or-previous-buffer)
(global-set-key "\M-\C-p" 'scroll-other-window-down-or-next-buffer)
(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map "\M-\C-n" 'scroll-other-window-up-or-previous-buffer)
     (define-key dired-mode-map  "\M-\C-p" 'scroll-other-window-down-or-next-buffer)
     ))

(define-key global-map (kbd "C-x M-n") 'next-buffer)
(define-key global-map (kbd "C-x M-p") 'previous-buffer)

(global-set-key "\C-x\C-v" 'switch-to-scratch-buffer)
;; (define-key emacs-lisp-mode-map (kbd "C-;") 'eval-print-last-sexp)
;; (define-key lisp-interaction-mode-map (kbd "C-;") 'eval-print-last-sexp)
(define-key lisp-interaction-mode-map "\C-j" 'open-line-or-new-line-dep-pos)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;ֻ����괦һ���ո����ɾ�����пո�
(global-set-key "\M-\\" 'just-one-space-or-delete-horizontal-space)
;;�ʵ�,��Ҫsdcd��֧��
(global-set-key "\C-c\C-d" 'query-stardict)
(global-set-key "\C-cd" 'sdcv-to-buffer)
(global-set-key "\C-k" 'joseph-kill-region-or-line)
(global-set-key (kbd "C-x k") 'kill-buffer-or-server-edit)
(global-set-key (kbd "C-x C-k") 'kill-buffer-or-server-edit)

(global-set-key "\C-x\C-f" 'icicle-file)

(autoload 'joseph-trailing-whitespace-hook "joseph-command" " �Զ����ÿһ��ĩ����Ŀո�." )
(autoload 'joseph-untabify-hook "joseph-command" " �ڱ���֮ǰ�ÿո��滻�����е�TAB")
(add-hook 'before-save-hook 'joseph-trailing-whitespace-hook)
(add-hook 'before-save-hook 'joseph-untabify-hook)
(global-set-key [(meta g) (meta g)] 'goto-line)

(provide 'joseph_keybinding)
;;emacs -batch -f batch-byte-compile  filename
;;C-x C-e run current lisp
